AC_CONFIG_MACRO_DIR([m4])
AC_PREREQ(2.59)
AC_INIT(avr-vala, 0.1.0, andre@masella.name)
AM_INIT_AUTOMAKE
AC_CONFIG_HEADER([config.h])
AM_MAINTAINER_MODE

AM_INIT_AUTOMAKE([foreign])
m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])

AC_PROG_CC
AM_DISABLE_STATIC
AC_PROG_LIBTOOL
AC_PATH_PROG(VALAC, valac, valac)
AC_SUBST(VALAC)
AC_PATH_PROG(AVR_GCC, avr-gcc, avr-gcc)
AC_SUBST(VALAC)
AC_PATH_PROG(AVR_AR, avr-ar, avr-ar)
AC_SUBST(VALAC)

AC_SUBST(VALAFLAGS)
AC_SUBST(CFLAGS)
AC_SUBST(CPPFLAGS)
AC_SUBST(LDFLAGS)

GLIB_REQUIRED=2.16.0
PKG_CHECK_MODULES(GLIB, glib-2.0 >= $GLIB_REQUIRED gobject-2.0 >= $GLIB_REQUIRED)
AC_SUBST(GLIB_CFLAGS)
AC_SUBST(GLIB_LIBS)

PKG_CHECK_MODULES(LIBVALA, [libvala-0.18 >= 0.14.0], [VALA_VER=0.18],
	[ PKG_CHECK_MODULES(LIBVALA, [libvala-0.16 >= 0.14.0],  [VALA_VER=0.16]) ])
AC_SUBST(VALA_VER)
AC_SUBST(LIBVALA_CFLAGS)
AC_SUBST(LIBVALA_LIBS)

AC_CONFIG_FILES([
	Makefile
	aavr-interrupt.pc
	aavr-parallel.pc
	aavr-semaphore.pc
	avr.pc
	gio-2.0.pc
])

for platform in  \
	avr2 \
	avr25 \
	avr3 \
	avr31 \
	avr35 \
	avr4 \
	avr5 \
	avr51 \
	avr6 \
	avrxmega2 \
	avrxmega4 \
	avrxmega5 \
	avrxmega6 \
	avrxmega7
do
	test -d lib_$platform || mkdir lib_$platform
	echo PLATFORM = $platform > lib_$platform/Makefile.in
	cat libtmpl/Makefile.in >> lib_$platform/Makefile.in
	AC_CONFIG_FILES(lib_${platform}/Makefile)
	LIB_SUBDIRS="$LIB_SUBDIRS lib_$platform"
done
AC_SUBST(LIB_SUBDIRS)
AC_OUTPUT
