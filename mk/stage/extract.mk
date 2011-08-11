##############################################################################
# Extract Stage
##############################################################################
include $(GUARD)
ifdef FIRST_INCLUDE
include $(STAGE_TMPL)
##############################################################################

$(STAGE)_PROG		=tar
$(STAGE)_ARG		=vxf$($(PRJ)_ZIP_FLAG) '$($(PRJ)_AR)'

$(STAGE)_PATH		=$(BUILD_DIR)/$(PRJ)

# $(BUILD_DIR)/$(PRJ)
#.PRECIOUS: $(BUILD_DIR)/%
#$(BUILD_DIR)/%: | $(BUILD_DIR)
#	mkdir -vp '$(@)'

$(BUILD_DIR)/$(STAGE).%.log: $(BUILD_DIR)/get.%.log

##############################################################################
endif # END Include Guard
include $(END_GUARD)
##############################################################################
