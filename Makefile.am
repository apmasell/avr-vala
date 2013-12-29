NULL =
ACLOCAL_AMFLAGS = -I m4

SUBDIRS = $(LIB_SUBDIRS)

bin_PROGRAMS = \
	avr-valac \
	$(NULL)

avrvapidir = $(datadir)/vala-avr/vapi
avrlibdir = $(libdir)/avr/lib
avrincludedir = $(libdir)/avr/include
avrpkgconfigdir = $(avrlibdir)/pkgconfig

dist_avrvapi_DATA = \
	aavr-interrupt.deps \
	aavr-interrupt.vapi \
	aavr-parallel.deps \
	aavr-parallel.vapi \
	aavr-semaphore.deps \
	aavr-semaphore.vapi \
	avr.vapi \
	atmega32u4.vapi \
	gio-2.0.vapi \
	$(NULL)

dist_avrinclude_HEADERS = \
	avr-glib.h \
	aavr.h \
	aavr-interrupt.h \
	aavr-parallel.h \
	aavr-semaphore.h \
	$(NULL)

dist_avrpkgconfig_DATA = \
	aavr-interrupt.pc \
	aavr-parallel.pc \
	aavr-semaphore.pc \
	avr.pc \
	gio-2.0.pc \
	$(NULL)

avr_valac_VALAFLAGS = \
	--pkg libvala-$(VALA_VER) \
	$(NULL)

avr_valac_CPPFLAGS = \
	$(LIBVALA_CFLAGS) \
	$(GLIB_CFLAGS) \
	-DAVR_VAPI_DIR="\"$(avrvapidir)\"" \
	-DAVR_PKG_CONFIG_DIR="\"$(avrpkgconfigdir)\"" \
	$(NULL)

avr_valac_LDFLAGS = \
	$(LIBVALA_LIBS) \
	$(GLIB_LIBS) \
	$(NULL)

avr_valac_SOURCES = \
	config.vapi \
	compiler.vala \
	$(NULL)

man_MANS = \
	avr-valac.1 \
	$(NULL)

EXTRA_DIST = \
	$(man_MANS)	 \
	$(NULL)

CLEANFILES = \
	$(NULL)

