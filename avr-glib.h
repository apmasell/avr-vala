#ifndef AVR_GLIB_H
#        define AVR_GLIB_H
#        include <assert.h>
#        include <stdlib.h>
#        include <util/atomic.h>
/**
 * Stuff to make the AVR look more like GLib.
 */
#        define g_slice_new0(x) calloc(sizeof(x), 1)
#        define g_slice_free(y, x) free(x)

#        define g_assert_not_reached() assert(false)

typedef void (
	*GDestroyNotify) (
	void *);
typedef void *(
	*GBoxedCopyFunc) (
	void *);
typedef void *gpointer;

static inline void g_atomic_int_inc(
	int *x) {
	ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
		(*x)++;
	}
}

static inline int g_atomic_int_dec_and_test(
	int *x) {
	int result;
	ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
		result = --(*x);
	}
	return result;
}

#        define BIT_GET(reg, bit) (reg & _BV(bit))
#        define BIT_SET(reg, bit, value) ((value) ? (reg | _BV(bit)) :  (reg & ~(_BV(bit))))
#        define BIT_TOGGLE(reg, bit) (reg ^ _BV(bit))

#        define BIT_COND(reg, bit) reg = (reg & ~_BV(bit)) | _BV(bit) & -!!
#        define BIT_MASKED_SET(reg, mask) reg = (reg & ~(mask)) |

#        define TIMER0_MODE(slope, top, modea, modeb, modec) TIMER_MODE(slope, top, modea, modeb, 0)
#        define TIMER_MODE(slope, top, modea, modeb, modec) ((slope ? _BV(WGM00) : 0) | (top ? _BV(WGM01) : 0) | ((modea & 0x3) << 6) | ((modeb & 0x3) << 4) | ((modec & 0x3) << 2))
#        define ADC_SELECT(value) (ADMUX = (ADMUX & (_BV(REFS1) | _BV(REFS0) | _BV(ADLAR))) | (value & (_BV(MUX4) | _BV(MUX4) | _BV(MUX3) | _BV(MUX2) | _BV(MUX1) | _BV(MUX0)))), (ADCSRB = (ADCSRB & ~_BV(MUX5)) | (value & _BV(MUX5)))
#endif
