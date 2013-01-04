avr-vala
========

A modified Vala compiler to support AVR microcontrollers. Using `avr-valac`, you can compile Vala code to target AVR processors using the AVR GCC compiler.

The compiler has three important features compared with regular Vala:

1. A binding of the AVR libc, including all the special purpose functions.
2. Bindings of MCU-specific registers and the good sense to define a preprocessor flag in Vala and pass the `-mmcu` flag to GCC.
3. A new attribute, `[Interrupt(vector = "foo", block = true]` that can be attached to methods to turn them into interrupt handlers (ISRs).

Much of the libc binding has not been tested, so expect bugs. In particular, to deal with program memory, a collection of new types have been introduced, `prog_uint8` and friends.

Please report bugs, or, especially if the change is simple, request a pull.
