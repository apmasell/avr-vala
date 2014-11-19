avr-vala
========

A modified Vala compiler to support AVR microcontrollers. Using `avr-valac`, you can compile Vala code to target AVR processors using the AVR GCC compiler.

The compiler has three important features compared with regular Vala:

1. A binding of the AVR libc, including all the special purpose functions.
2. Bindings of MCU-specific registers and the good sense to define a preprocessor flag in Vala and pass the `-mmcu` flag to GCC.
3. A new attribute, `[Interrupt(vector = "foo", block = true]` that can be attached to methods to turn them into interrupt handlers (ISRs).
4. Support for asynchronous methods using the AsyncAvr library, provided. More information below.

Much of the libc binding has not been tested, so expect bugs. In particular, to deal with program memory, a collection of new types have been introduced, `prog_uint8` and friends.

Please report bugs, or, especially if the change is simple, request a pull.

AsyncAvr
--------

Vala's asynchronous routines are extremely convenient in the context of a microcontroller because they allow writing straight line code that can avoid blocking while waiting for I/O. Unfortunately, writing coroutines in C by hand is not fun. Vala is rather adept at doing this.

To work properly, there needs to be a small library that provides the main loop. This is provided in `aavr.h` and `aavr.c`. The Vala binding is in `gio-2.0.vapi`, the name being an unfortunate by-product of how the Vala compiler is written. To enable asynchronous methods, use `--allow-async`. This will pass all the needed flags, including the extra `aavr.c` file to the C compiler.

The general flow is, from the main line, set up a timer to interrupt and overflow at a desired tick rate, invoking `AsyncAvr.tick()` in the interrupt. Invoke the `begin` method of an asynchronous method. Finally, invoke `AsyncAvr.run()` to start the main loop.

In each asynchronous method, calling `AsyncAvr.wait` will appear to block until the provided polling delegate meets some criteria. Essentially, this polling function should wait for hardware to be in the expected state. An optional timeout is provided such that `wait` can return even if the hardware does not respond.

    async void blinky () {
        bool light = true;
        Port.d[6] = light;
    
        AsyncAvr.Status status;
        while (!(AsyncAvr.Status.QUIT in (status = yield AsyncAvr.wait(() => Pin.b[4], 8000)))) {
            light = !light;
            Port.d[6] = light;
        }
    }
    void main() {
        disable_interrupts();
	      Direction.d[6] = true;
    
	      Timer.zero.set_mode (false, true, Timer.CounterMode.NORMAL, Timer.CounterMode.NORMAL);
	      Timer.zero.control = Timer.zero.Control.SOURCE_IO_DIV_8;

	      Timer.zero.interrupt_enable = Timer.zero.Interrupt.COMPARE_A;
        enable_interrupts();

        blinky.begin((f) => blinky.end((owned)f));
        AsyncAvr.run();
    }
    [Interrupt(vector = "TIMER0_COMPA_vect")]
    public void timer0_compa() {
        AsyncAvr.tick();
    }

Missing Features
----------------

The following features of the Vala language don't work (but could be added):

 - Exceptions
 - Classes, and therefore inheritance (structs work)
 - Signals (it would be ideal to build this in a way that interfaces with `errno`)
 - Locking
