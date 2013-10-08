NULL =
PLATFORM ?= broken
ACLOCAL_AMFLAGS = -I m4

avrplatformlibdir = $(libdir)/avr/lib/$(PLATFORM)
avrplatformlib_DATA = \
	libaavr.a \
	libaavr-interrupt.a \
	libaavr-semaphore.a \
	$(NULL)

libaavr.a: ../aavr.c
libaavr-interrupt.a: ../aavr-interrupt.c
libaavr-semaphore.a: ../aavr-semaphore.c

%.a:
	$(AVR_GCC) -mmcu=$(PLATFORM) -std=c99 -I$(top_srcdir) $< -c -o $*.o
	$(AVR_AR) -c -r -s $@ $*.o
