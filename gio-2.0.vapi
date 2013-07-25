[CCode(cheader_filename = "aavr.h")]
namespace AsyncAvr {
	/**
	 * The collection of reasons a {@link wait} returned.
	 */
	[CCode(cname = "AavrStatus", cprefix = "AAVR_STATUS_")]
	[Flags]
	public enum Status {
		/**
		 * The {@link Poll} delegate requested that {@link wait} return.
		 */
		INVOKED,
		/**
		 * The supplied timeout to {@link wait} has been exceeded.
		 */
		TIMED_OUT,
		/**
		 * The method {@link quit} was called.
		 */
		QUIT,
		/**
		 * The method could not be started.
		 */
		FAILED
	}

	/**
	 * Exit the main loop by waking up all pending coroutines.
	 *
	 * This may be called from any context (main code, coroutines, poll,
	 * interrupts).
	 */
	[CCode(cname = "aavr_quit")]
	public void quit();

	/**
	 * Start the main loop.
	 *
	 * This may be called only from main code, not inside coroutines, poll or
	 * interrupts.
	 *
	 * For the timeouts to function correctly, {@link tick} must be called from a
	 * timer interrupt.
	 *
	 * @param idle a function to run when no work is scheduled. Depending on work
	 * flow, this might be an opportunity to put the processor to sleep.
	 */
	[CCode(cname = "aavr_run")]
	public void run(Poll? idle = null);

	/**
	 * Update the clock.
	 *
	 * This function should be called from an interrupt to increment the elapsed
	 * time in all the queued events.
	 */
	[CCode(cname = "aavr_tick")]
	public void tick();

	/**
	 * Add an event to main loop and wait asynchronously for it to finish.
	 *
	 * This will cause a coroutine to wait for a particular event to happen.
	 * There are three reasons for control to be returned the controller:
	 * * the event the user was waiting for occurred
	 * * a specified amount of time has elapsed
	 * * the {@link quit} method has been called.
	 *
	 * @param poll the delegate that can cause {@link wait} to return. This
	 * delegate will be called every pass of the main loop to determine if it is
	 * indeed time for this coroutine to continue.
	 *
	 * @param timeout the maximum amount of time before control should be
	 * returned even if the specified event has not occurred.
	 *
	 * @param time_elapsed the number of ticks that have occurred since the
	 * coroutine called this method.
	 *
	 * @return the reason the wait was finished. This can be a combination of
	 * reasons as all reasons are tested every time.
	 */
	[CCode(cname = "aavr_wait")]
	public async Status wait(Poll? poll, int timeout = -1, out int time_elapsed = null);

	/**
	 * Check if a {@link wait} should return.
	 *
	 * Every pass through the main loop, this delegate will be called to
	 * determine if it is time to wake up the corresponding caller who invoked
	 * {@link wait} using it.
	 *
	 * Since this is called in the main loop many times, it should be as fast as
	 * possible.
	 *
	 * The method {@link run} should //not// be called in this context.
	 *
	 * @return true if the caller should be woken; false to continue to wait.
	 */
	public delegate bool Poll();
}
namespace GLib {
	[CCode(cname = "void", free_function = "")]
	[Compact]
	public class AsyncResult {
	}

	[CCode(cname = "AavrAsyncCallback", scope = "async")]
	public delegate void AsyncReadyCallback(owned AsyncResult finish_context);
	[CCode(cname = "GSourceFunc", scope = "async")]
	public delegate bool SourceFunc();
}
