#ifndef AAVR_PARALLEL_H
#        define AAVR_PARALLEL_H
#        include <aavr.h>

typedef void (
	*AavrBegin) (
	void *user_data,
	AavrAsyncCallback callback,
	void *callback_data);
typedef void *(
	*AavrEnd) (
	void *finish_context);

typedef struct aavr_parallel AavrParallel;

AavrParallel *aavr_parallel_new(
	void);
size_t aavr_parallel_add(
	AavrParallel *self,
	AavrBegin begin,
	void *begin_target,
	AavrEnd end);
void aavr_parallel_ref(
	AavrParallel *self);
void aavr_parallel_unref(
	AavrParallel *self);
void aavr_parallel_wait(
	AavrParallel *self);
void **aavr_parallel_wait_finish(
	void *finish_context,
	int *length);

#endif
