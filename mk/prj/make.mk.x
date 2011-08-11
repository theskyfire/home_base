##############################################################################
# Make Project
##############################################################################
# Include Guard
include $(GUARD)
ifdef FIRST_INCLUDE

include $(PRJ_DIR)/prj.tmpl

$(get_$(PRG)): dir


install_$(PRJ):

#.PHONY: make
#make: installdirs $(MY_MAKE)

#$(MY_MAKE): installdi/tmp/homebase/$(BASE_DIR)/bin/make
#	$(MAKE) -C '$(COMMON_DIR)' install BASE='$(BASE_DIR)'

#/tmp/homebase/$(BASE_DIR)/bin/make:
#	$(MAKE) -C '$(COMMON_DIR)' BASE='$(BASE_DIR)'


endif # END Include Guard
include $(END_GUARD)
##############################################################################
