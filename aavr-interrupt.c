#include <aavr-interrupt.h>
#include <avr-glib.h>

struct aavr_interrupt {
	size_t ref_cnt;
	int epoch;
	int waiters;
};

struct aavr_interrupt_data {
	AavrInterrupt *self;
	int start_epoch;
	AavrAsyncCallback callback;
	void *callback_context;
	AavrStatus result;
	int time_elapsed;
};

AavrInterrupt *aavr_interrupt_new(
	) {
	AavrInterrupt *self = g_slice_new0(AavrInterrupt);
	self->ref_cnt = 1;
	self->epoch = 0;
	self->waiters = 0;
	return self;
}

void aavr_interrupt_ref(
	AavrInterrupt *self) {
	g_atomic_int_inc(&self->ref_cnt);
}

void aavr_interrupt_unref(
	AavrInterrupt *self) {
	if (g_atomic_int_dec_and_test(&self->ref_cnt) == 0) {
		g_slice_free(AavrInterrupt,
			self);
	}
}

void aavr_interrupt_wake(
	AavrInterrupt *self) {
	ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
		if (self->waiters == 0) {
			self->epoch = 0;
		} else {
			self->epoch++;
		}
	}
}

bool aavr_interrupt_poll(
	void *_data) {
	struct aavr_interrupt_data *data = (struct aavr_interrupt_data *) _data;

	return data->self->epoch >= data->start_epoch;
}

void aavr_interrupt_callback(
	void *finish_context,
	void *_data) {
	struct aavr_interrupt_data *data = (struct aavr_interrupt_data *) _data;
	data->result = aavr_wait_finish(finish_context, &data->time_elapsed);
	data->callback(_data, data->callback_context);
}

void aavr_interrupt_wait(
	AavrInterrupt *self,
	int timeout,
	AavrAsyncCallback callback,
	void *callback_context) {
	struct aavr_interrupt_data *data = g_slice_new0(struct aavr_interrupt_data);
	if (data == NULL) {
		callback(NULL, callback_context);
	}
	data->self = self;
	data->start_epoch = self->epoch;
	data->callback = callback;
	data->callback_context = callback_context;
	g_atomic_int_inc(&self->waiters);
	aavr_wait(aavr_interrupt_poll, data, timeout, aavr_interrupt_callback, data);
}

AavrStatus aavr_interrupt_wait_finish(
	void *finish_context,
	int *time_elapsed) {
	struct aavr_interrupt_data *data = (struct aavr_interrupt_data *) finish_context;
	AavrStatus result;
	if (finish_context == NULL) {
		if (time_elapsed != NULL)
			*time_elapsed = 0;
		return AAVR_STATUS_FAILED;
	}
	ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
		data->self->waiters--;
		if (data->self->waiters == 0) {
			data->self->epoch = 0;
		}
	}
	if (time_elapsed != NULL)
		*time_elapsed = data->time_elapsed;
	result = data->result;
	free(data);
	return result;
}
