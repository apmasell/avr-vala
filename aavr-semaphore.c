#include <aavr-semaphore.h>
#include <avr-glib.h>

struct aavr_semaphore {
	size_t ref_cnt;
	volatile int i;
};

struct aavr_semaphore_data {
	AavrSemaphore *self;
	int i;
	AavrAsyncCallback callback;
	void *callback_context;
	AavrStatus result;
	int time_elapsed;
};

AavrSemaphore *aavr_semaphore_new(
	) {
	AavrSemaphore *self = g_slice_new0(AavrSemaphore);
	self->ref_cnt = 1;
	self->i = 0;
	return self;
}

void aavr_semaphore_ref(
	AavrSemaphore * self) {
	g_atomic_int_inc(&self->ref_cnt);
}

void aavr_semaphore_unref(
	AavrSemaphore * self) {
	if (g_atomic_int_dec_and_test(&self->ref_cnt) == 0) {
		g_slice_free(AavrSemaphore, self);
	}
}

void aavr_semaphore_signal(
	AavrSemaphore * self,
	int i) {
	ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
		self->i += i;
	}
}

bool aavr_semaphore_poll(
	void *_data) {
	struct aavr_semaphore_data *data = (struct aavr_semaphore_data *) _data;

	bool run_now = false;
	ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
		if (data->self->i >= data->i) {
			data->self->i -= data->i;
			run_now = true;
		}
	}
	return run_now;
}

void aavr_semaphore_callback(
	void *finish_context,
	void *_data) {
	struct aavr_semaphore_data *data = (struct aavr_semaphore_data *) _data;
	data->result = aavr_wait_finish(finish_context, &data->time_elapsed);
	data->callback(_data, data->callback_context);
}

void aavr_semaphore_wait(
	AavrSemaphore * self,
	int timeout,
	int i,
	AavrAsyncCallback callback,
	void *callback_context) {
	struct aavr_semaphore_data *data = g_slice_new0(struct aavr_semaphore_data);
	if (data == NULL) {
		callback(NULL, callback_context);
	}
	data->self = self;
	data->i = i;
	data->callback = callback;
	data->callback_context = callback_context;
	aavr_wait(aavr_semaphore_poll, data, timeout, aavr_semaphore_callback, data);
}

AavrStatus aavr_semaphore_wait_finish(
	void *finish_context,
	int *time_elapsed) {
	struct aavr_semaphore_data *data = (struct aavr_semaphore_data *) finish_context;
	AavrStatus result;
	if (finish_context == NULL) {
		if (time_elapsed != NULL)
			*time_elapsed = 0;
		return AAVR_STATUS_FAILED;
	}
	if (time_elapsed != NULL)
		*time_elapsed = data->time_elapsed;
	result = data->result;
	free(data);
	return result;
}
