##############################################################################
# HomeBase 0.1
##############################################################################

# full path to this makefile's directory
MK_DIR			:=$(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST)))))

# Include Guard
include $(MK_DIR)/guard.mk
ifdef FIRST_INCLUDE

# Bootstrap Make
include $(MK_DIR)/boot.mk
ifdef BOOTSTRAP

# load projects
include $(MK_PRJS)

# load stages
include $(MK_STAGES)

# END Bootstrap Guard
endif

# stop implicit rule search of top Makefile
$(firstword $(MAKEFILE_LIST)): ;

endif # END Include Guard
include $(END_GUARD)
##############################################################################
