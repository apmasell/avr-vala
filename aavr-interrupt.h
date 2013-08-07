#ifndef AAVR_INTERRUPT_H
#        define AAVR_INTERRUPT_H
#        include <aavr.h>

typedef struct aavr_interrupt AavrInterrupt;

AavrInterrupt *aavr_interrupt_new(
	);
void aavr_interrupt_ref(
	AavrInterrupt *self);
void aavr_interrupt_unref(
	AavrInterrupt *self);
void aavr_interrupt_wait(
	AavrInterrupt *self,
	int timeout,
	AavrAsyncCallback callback,
	void *callback_context);
AavrStatus aavr_interrupt_wait_finish(
	void *finish_context,
	int *time_elapsed);
void aavr_interrupt_wake(
	AavrInterrupt *self);
#endif
