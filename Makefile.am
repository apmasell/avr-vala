NULL =
ACLOCAL_AMFLAGS = -I m4

bin_PROGRAMS = \
	avr-valac \
	$(NULL)

vapidir = $(datadir)/vala-avr/vapi
dist_vapi_DATA = \
	avr.vapi \
	$(NULL)

avr_valac_VALAFLAGS = \
	--pkg libvala-$(VALA_VER) \
	$(NULL)

avr_valac_CPPFLAGS = \
	$(LIBVALA_CFLAGS) \
	$(GLIB_CFLAGS) \
	-DAVR_VAPI_DIR="\"$(vapidir)\"" \
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
	$(avr_valac_VALASOURCES:.vala=.c) \
	$(NULL)

