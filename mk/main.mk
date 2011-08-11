##############################################################################
# HomeBase 0.1
##############################################################################

# Set a trap for versions of make that don't support .DEFAULT_GOAL
_TRAP_: FORCE
	@echo "Error: Please use a modern version of GNU Make!" >&2
	exit 1

# Define FORCE target
.PHONY: _TRAP_ FORCE
FORCE:

# Require .DEFAULT_GOAL
ifndef .DEFAULT_GOAL
$(error Please use a modern version of GNU Make!)
endif

# Test for modern GNU Make
ifneq ($(findstring else-if,$(.FEATURES)),else-if)
$(error Please use a modern version of GNU Make!)
endif
ifneq ($(findstring target-specific,$(.FEATURES)),target-specific)
$(error Please use a modern version of GNU Make!)
else ifneq ($(findstring order-only,$(.FEATURES)),order-only)
$(error Please use a modern version of GNU Make!)
else ifneq ($(findstring second-expansion,$(.FEATURES)),second-expansion)
$(error Please use a modern version of GNU Make!)
else ifneq ($(findstring archives,$(.FEATURES)),archives)
$(error Please use a modern version of GNU Make!)
else ifneq ($(findstring jobserver,$(.FEATURES)),jobserver)
$(error Please use a modern version of GNU Make!)
else ifneq ($(findstring check-symlink,$(.FEATURES)),check-symlink)
$(error Please use a modern version of GNU Make!)
endif
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
