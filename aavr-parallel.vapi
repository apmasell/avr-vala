namespace AsyncAvr {
	/**
	 * Run several parallel tasks and wait for the combined results.
	 */
	[CCode(cname = "AavrParallel", ref_function = "aavr_parallel_ref", unref_function = "aavr_parallel_unref", cheader_filename = "aavr-parallel.h")]
	public class Parallel<T> {
		/**
		 * Create a new task collection with a particular return type.
		 */
		[CCode(cname = "aavr_parallel_new", simple_generics = true)]
		public static Parallel<T> create<T>();
		/**
		 * Add a new task to the collection.
		 *
		 * The ''.begin'' and ''.end'' members of the method must be provided. The method must return the appropriate type.
		 * @return the position in the output of this method's result.
		 */
		[CCode(cname = "aavr_parallel_add")]
		public int add(Begin start, End<T> end);
		/**
		 * Increase the reference count.
		 */
		[CCode(cname = "aavr_parallel_ref")]
		public void @ref();
		/**
		 * Decrease the reference count.
		 *
		 * Note, that if the reference count goes to zero while the {@link wait} method is invoked, there will be memory corruption.
		 */
		[CCode(cname = "aavr_parallel_unref")]
		public void unref();
		/**
		 * Start all queued methods and wait for the results.
		 *
		 * All added methods will be executed in parallel, and after they all return, the return value of each method will be placed in an array.
		 *
		 * After this method is called, the added methods are cleared and the instance may be used again.
		 */
		[CCode(cname = "aavr_parallel_wait")]
		public async T[]? wait();
	}
	/**
	 * The type of a '''.begin''' method.
	 */
	[CCode(cname = "AavrBegin", instance_pos = 0, cheader_filename = "aavr-parallel.h")]
	public delegate void Begin(GLib.AsyncReadyCallback cb);
	/**
	 * The type of a '''.end''' method.
	 */
	[CCode(cname = "AavrEnd", has_target = false, simple_generics = true, cheader_filename = "aavr-parallel.h")]
	public delegate T End<T>(owned GLib.AsyncResult finish_context);
}
