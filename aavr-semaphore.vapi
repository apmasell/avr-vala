[CCode(cheader_filename = "aavr-semaphore.h")]
namespace AsyncAvr {
	[CCode(cname = "AavrSemaphore", ref_function = "aavr_semaphore_ref", unref_function = "aavr_semaphore_unref")]
	public class Semaphore {
		[CCode(cname = "aavr_semaphore_new")]
		public Semaphore();
		[CCode(cname = "aavr_semaphore_ref")]
		public void @ref();
		[CCode(cname = "aavr_semaphore_unref")]
		public void unref();
		[CCode(cname = "aavr_semaphore_signal")]
		public void @signal(int i = 1);
		[CCode(cname = "aavr_semaphore_wait")]
		public async Status wait(int timeout = -1, int i = 1, out int time_elapsed = null);
	}
}
