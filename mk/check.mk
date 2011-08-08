##############################################################################
# Check for GNK Make
##############################################################################
# include guard
ifndef INCLUDE_check_mk
INCLUDE_check_mk=$(lastword $(MAKEFILE_LIST))

########
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

########
# Stop rebuild of this makefile
$(INCLUDE_check_mk): ;

##############################################################################
# end include guard
endif
