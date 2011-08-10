##############################################################################
# Include Guard
##############################################################################

# Configuration
include $(MK_DIR)/config.mk

##############################################################################
# Guard guard "Quis custodiet ipsos custodes?"
ifndef INCLUDE_guard_mk

# Explicitly set Guard's include marker
INCLUDE_guard_mk	:=$(abspath $(lastword $(MAKEFILE_LIST)))

# Stack of Makefiles who use this include guard
THIS_MAKEFILE_LIST	:=

# The including makefile is the last in THIS_MAKEFILE_LIST
THIS_MAKEFILE		=$(lastword $(THIS_MAKEFILE_LIST))

# Set THIS as marker for including Makefile: $(MK_DIR)/foo/bar.mk -> foo_bar_mk
THIS			=$(call GET_MARKER,$(THIS_MAKEFILE))

# Stop rebuild of Guard Makefile
$(lastword $(call POP_LIST,$(MAKEFILE_LIST))): ;

endif # END Guard guard

##############################################################################
# Include Guard setup for including Makefile

# Append calling makefile to THIS_MAKEFILE_LIST
THIS_MAKEFILE_LIST	+=$(lastword $(call POP_LIST_N,$(MAKEFILE_LIST),2))

# Undefine FIRST_INCLUDE NOTE: only use directly after including this file
undefine FIRST_INCLUDE

# This is first include
ifndef INCLUDE_$(THIS)

# Set INCLUDE_foo_mk = /Full/Path/To/mk/foo.mk
INCLUDE_$(THIS)		:=$(abspath $(THIS_MAKEFILE))

# Define FIRST_INCLUDE on first include
FIRST_INCLUDE		=YES

# Stop implicit rule search for including Makefile
$(THIS_MAKEFILE): ;

# end Include Guard setup for including Makefile
endif

##############################################################################
