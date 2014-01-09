#include "aavr-parallel.h"
#include "avr-glib.h"

struct child_data {
	AavrBegin begin;
	AavrEnd end;
	void *user_data;
	void *result;
};

struct aavr_parallel {
	size_t ref_cnt;
	size_t outstanding;
	struct child_data *child;
	size_t child_length;
	size_t child_size;
	AavrAsyncCallback callback;
	void *callback_data;
};

struct parallel_data {
	size_t id;
	AavrParallel *self;
};

AavrParallel *aavr_parallel_new(
	void) {
	AavrParallel *self;
	self = g_slice_new0(struct aavr_parallel);
	self->ref_cnt = 1;
	self->outstanding = 0;
	self->child_size = 8;
	self->child_length = 0;
	self->child = calloc(sizeof(struct child_data), self->child_size);
}

static void parallel_callback(
	void *finish_context,
	void *_data) {
	struct parallel_data *data = (struct parallel_data *) _data;
	struct child_data *child = &data->self->child[data->id];
	child->result = child->end(finish_context);
	if (--data->self->outstanding == 0) {
		data->self->callback(data->self, data->self->callback_data);
	}
	free(data);
}

size_t aavr_parallel_add(
	AavrParallel *self,
	AavrBegin begin,
	void *begin_target,
	AavrEnd end) {
	if (self->child_length == self->child_size) {
		self->child_size *= 2;
		self->child = realloc(self->child, sizeof(struct child_data) * self->child_size);
	}
	self->child[self->child_length].begin = begin;
	self->child[self->child_length].end = end;
	self->child[self->child_length].user_data = begin_target;
	self->outstanding++;
	return self->child_length++;
}

void aavr_parallel_ref(
	AavrParallel *self) {
	g_atomic_int_inc(&self->ref_cnt);
}

void aavr_parallel_unref(
	AavrParallel *self) {
	if (g_atomic_int_dec_and_test(&self->ref_cnt) == 0) {
		g_slice_free(AavrParallel,
			self);
	}
}

void aavr_parallel_wait(
	AavrParallel *self) {
	size_t it;
	for (it = 0; it < self->child_length; it++) {
		struct parallel_data *data = g_slice_new0(struct parallel_data);
		data->self = self;
		data->id = it;
		self->child[it].begin(self->child[it].user_data, parallel_callback, data);
	}
}

void **aavr_parallel_wait_finish(
	void *finish_context,
	int *length) {
	AavrParallel *self;
	void **results;
	size_t it;

	if (finish_context == NULL) {
		*length = 0;
		return NULL;
	}

	self = (AavrParallel *) finish_context;
	results = calloc(sizeof(void *), self->child_length);
	*length = self->child_length;
	for (it = 0; it < self->child_length; it++) {
		results[it] = self->child[it].result;
	}
	self->child_length = 0;
	return results;
}
