# Build MY_MAKE

SHELL=/bin/sh

BASE=$(HOME)/base
TMPBASE=/tmp/homebase

#GNU_URL=ftp://ftp.gnu.org/pub/gnu
GNU_URL=http://mirrors.kernel.org/gnu

all: $(TMPBASE)/$(BASE)/bin/make
	@echo 'You may now run: $(TMPBASE)/$(BASE)/bin/make -f homebase.mk BASE="$(BASE)"'

src:
	mkdir -v 'src'

src/make-3.82.tar.gz: src
	wget -O './src/make-3.82.tar.gz' '$(GNU_URL)/make/make-3.82.tar.gz'
	touch './src/make-3.82.tar.gz'

$(TMPBASE):
	mkdir -v '$(TMPBASE)'

$(TMPBASE)/make-3.82: $(TMPBASE) src/make-3.82.tar.gz
	tar vxz -C '$(TMPBASE)' -f './src/make-3.82.tar.gz'
	touch '$(TMPBASE)/make-3.82'

$(TMPBASE)/$(BASE): $(TMPBASE)/make-3.82
	mkdir -vp '$(TMPBASE)/$(BASE)'
	touch '$(TMPBASE)/$(BASE)'

$(TMPBASE)/make-3.82/Makefile: $(TMPBASE)/$(BASE)
	cd '$(TMPBASE)/make-3.82' && $(MAKE) distclean ||:
	cd '$(TMPBASE)/make-3.82' && sh ./configure --prefix='$(BASE)' --disable-nls
	touch '$(TMPBASE)/make-3.82/Makefile'

$(TMPBASE)/$(BASE)/bin/make: $(TMPBASE)/make-3.82/Makefile
	$(MAKE) -C '$(TMPBASE)/make-3.82' all install DESTDIR='$(TMPBASE)'
	touch '$(TMPBASE)/make-3.82'
	touch '$(TMPBASE)/$(BASE)'
	touch '$(TMPBASE)/make-3.82/Makefile'
	touch '$(TMPBASE)/$(BASE)/bin/make'

install: $(TMPBASE)/$(BASE)/bin/make
	$(MAKE) -C '$(TMPBASE)/make-3.82' install

clean:
	[ -d '$(TMPBASE)' ] && rm -rf '$(TMPBASE)/make-3.82'

distclean:
	[ -d '$(TMPBASE)' ] && rm -rf '$(TMPBASE)'

Makefile:
	true
