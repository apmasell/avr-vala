#ifndef AAVR_SEMAPHORE_H
#        define AAVR_SEMAPHORE_H
#        include <aavr.h>

typedef struct aavr_semaphore AavrSemaphore;

AavrSemaphore *aavr_semaphore_new(
	);
void aavr_semaphore_ref(
	AavrSemaphore * self);
void aavr_semaphore_unref(
	AavrSemaphore * self);
void aavr_semaphore_signal(
	AavrSemaphore * self,
	int i);
void aavr_semaphore_wait(
	AavrSemaphore * self,
	int timeout,
	int i,
	AavrAsyncCallback callback,
	void *callback_context);
AavrStatus aavr_semaphore_wait_finish(
	void *finish_context,
	int *time_elapsed);
#endif
