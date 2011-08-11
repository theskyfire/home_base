##############################################################################
# Extract Stage
##############################################################################
include $(STAGE_TMPL)
ifdef FIRST_INCLUDE
##############################################################################

$(THIS)_PROG		=tar
$(THIS)_ARG		=vxf$($(PRJ)_ZIP_FLAG) '$($(PRJ)_AR)'

$(THIS)_PATH		=$(BUILD_DIR)/$(PRJ)

# $(BUILD_DIR)/$(PRJ)
.PRECIOUS: $(BUILD_DIR)/%
$(BUILD_DIR)/%: | $(BUILD_DIR)
	mkdir -vp '$(@)'

$($(THIS)_STAGE): get_STAGE
$($(THIS)_STAGE): | $(THIS)_PATH

##############################################################################
endif # END Include Guard
include $(END_STAGE_TMPL)
##############################################################################
