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

#define BIT_GET(reg, bit) (reg & _BV(bit))
#define BIT_SET(reg, bit, value) ((value) ? (reg |= _BV(bit)) :  (reg &= ~(_BV(bit))))
#endif
