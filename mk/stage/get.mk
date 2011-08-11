##############################################################################
# Get Stage
##############################################################################
include $(GUARD)
ifdef FIRST_INCLUDE
include $(STAGE_TMPL)
##############################################################################

$(STAGE)_PROG		=wget

$(STAGE)_ARG		=$($(PRJ)_URL)

# Path where get command is run
$(STAGE)_PATH		=$(SRC_DIR)/$(PRJ)

# $(SRC_DIR)/$(PRJ)
.PRECIOUS: $(SRC_DIR)/%
$(SRC_DIR)/%: | $(SRC_DIR)
	mkdir -vp '$(@)'

##############################################################################
endif # END Include Guard
include $(END_GUARD)
##############################################################################
