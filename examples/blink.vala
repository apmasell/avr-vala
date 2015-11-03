public struct Foo {
	int v;
	public async void blinky () {
		bool light = true;
		Port.d[6] = light;

		AsyncAvr.Status status;
		while (!(AsyncAvr.Status.QUIT in (status = yield AsyncAvr.wait (() => Pin.b[4], 8000)))) {
			light = !light;
			Port.d[6] = light;
		}
	}
}
void main () {
	disable_interrupts ();
	Direction.d[6] = true;

	Timer.zero.set_mode (false, true, Timer.CounterMode.NORMAL, Timer.CounterMode.NORMAL);
	Timer.zero.control = Timer.zero.Control.SOURCE_IO_DIV_8;

	Timer.zero.interrupt_enable = Timer.zero.Interrupt.COMPARE_A;
	enable_interrupts ();
	AsyncAvr.run ();
}
[Interrupt (vector = "TIMER0_COMPA_vect")]
public void timer0_compa () {
	AsyncAvr.tick ();
}

public void foo () {
	var p = AsyncAvr.Parallel.create<bool> ();
	Foo f = Foo ();
	p.add ((AsyncAvr.Begin)f.blinky.begin,  (AsyncAvr.End<bool> )f.blinky.end);
}
