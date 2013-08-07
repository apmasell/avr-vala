[CCode(cheader_filename = "aavr-interrupt.h")]
namespace AsyncAvr {
	[CCode(cname = "AavrInterrupt", ref_function = "aavr_interrupt_ref", unref_function = "aavr_interrupt_unref")]
	public class Interrupt {
		[CCode(cname = "aavr_interrupt_new")]
		public Interrupt();
		[CCode(cname = "aavr_interrupt_ref")]
		public void @ref();
		[CCode(cname = "aavr_interrupt_unref")]
		public void unref();
		[CCode(cname = "aavr_interrupt_wait")]
		public async Status wait(int timeout = -1, out int time_elapsed = null);
		[CCode(cname = "aavr_interrupt_wake")]
		public void wake();
	}
}
