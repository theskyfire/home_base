##############################################################################
# MY_MAKE

.PHONY: make
make: installdirs $(MY_MAKE)

$(MY_MAKE): installdi/tmp/homebase/$(BASE_DIR)/bin/make
	$(MAKE) -C '$(COMMON_DIR)' install BASE='$(BASE_DIR)'

/tmp/homebase/$(BASE_DIR)/bin/make:
	$(MAKE) -C '$(COMMON_DIR)' BASE='$(BASE_DIR)'


