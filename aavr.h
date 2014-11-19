#ifndef AAVR_H
#        define AAVR_H
#        include <stdbool.h>
#        include <stddef.h>
/**
 * The standard callback type of a coroutine.
 *
 * @finish_context: the closure to pass the the corresponding _finish function.
 * @context: the closure initally passed to the asynchronous callee.
 */
typedef void (
	*AavrAsyncCallback) (
	void *finish_context,
	void *context);
/**
 * The callback type to run in the main loop.
 *
 * Returns: true if the event has occured.
 */
typedef bool (
	*AavrPoll) (
	void *context);
/**
 * The reason aavr_wait returned.
 * This is a boolean flag set.
 */
typedef int AavrStatus;
#        define AAVR_STATUS_INVOKED 1
#        define AAVR_STATUS_TIMED_OUT 2
#        define AAVR_STATUS_QUIT 4
#        define AAVR_STATUS_FAILED 8

/**
 * Exit the main loop.
 */
void aavr_quit(
	void);
/**
 * Run the main loop.
 */
void aavr_run(
	AavrPoll idle,
	void *idle_context);
/**
 * Return to an asynchronous method's caller at a later time.
 *
 * An asynchronous method can't return directly by calling it's parents
 * callback function since this could happen many times, overruning the stack.
 * When a function wishes to return, it passes its parent's callback (and
 * callback data) along with its own return code to this function, which stores
 * it an executes it in the main loop when appropriate.
 *
 * There is little reason to call this function directly. The compiler needs it.
 *
 * @callback: (closure callback_context): the continuation to return to when the event is done.
 * @result: (transfer full): the asynchronous result to be passed to the finish function.
 */
void aavr_trampoline(
	AavrAsyncCallback callback,
	void *result,
	void *callback_data);
/**
 * Update the clock.
 *
 * This function should be called from an interrupt to increment the elapsed
 * time in all the queued events.
 */
void aavr_tick(
	void);
/**
 * Wait for an event or timeout asynchronously.
 *
 * @poll: (closure poll_context) (allow-none): the callback to wake up the child.
 * @timeout: the number of clock ticks to wait before giving up or -1 to wait indefinitely.
 * @callback: (closure callback_context): the continuation to return to when the event is done.
 */
void aavr_wait(
	AavrPoll poll,
	void *poll_context,
	int timeout,
	AavrAsyncCallback callback,
	void *callback_context);
/**
 * Get the return value from aavr_wait when in the continuation.
 *
 * @finish_context: the context provided to the continuation
 * @time_elapsed: (out): the elapsed time since the wait was invoked
 * Returns: the reason the wait finished.
 */
AavrStatus aavr_wait_finish(
	void *finish_context,
	int *time_elapsed);

typedef bool (
	*GSourceFunc) (
	void *context);
#endif
