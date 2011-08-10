##############################################################################
# Get Stage
##############################################################################
# Include Guard
include $(GUARD)
ifdef FIRST_INCLUDE

include $(STAGE_DIR)/stage.tmpl

$(STAGE)_PROG		=wget

$(STAGE)_ARG		="$($(PRJ)_URL)"

# Path where get command is run
$(STAGE)_PATH		=$(SRC_DIR)/$(PRJ)

# Set PROG
#$(foreach prog,$(PROGS),$(eval GET_$(prog): PROG=$(prog)))

# $(SRC_DIR)/$(PROJ)
.PRECIOUS: $(SRC_DIR)/%/
$(SRC_DIR)/%/: | $(SRC_DIR)
	mkdir -vp '$(@)'

endif # END Include Guard
include $(END_GUARD)
##############################################################################
