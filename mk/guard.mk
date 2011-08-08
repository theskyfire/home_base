##############################################################################
# Include Guard
##############################################################################

# Require GUARD == full path to this makefile
ifneq "$(GUARD)" "$(abspath $(lastword $(MAKEFILE_LIST)))"
$(error Please set GUARD:=$$(dir $$(abspath $$(MAKEFILE_LIST)))/guard.mk in top Makefile)
endif

# Include GNU Make checks NOTE: Must come before any rules
include $(dir $(GUARD))check.mk

# Guard guard "Quis custodiet ipsos custodes?"
ifndef INCLUDE_guard_mk

# Explicitly set Guard's include marker
INCLUDE_guard_mk	:=$(GUARD)

# MK Directory
MK_DIR			:=$(patsubst %/,%,$(dir $(GUARD)))

# Inital definition for Guard created variables
THIS_MAKEFILE_LIST	:=
THIS_MAKEFILE		:=

# Return LIST without its last item
POP_LIST_N		=$(wordlist 1,$(shell echo "$$(( $$(( X = $(words $(1)) - $(2) )) >=0 ? X : 0))" ),$(1))
POP_LIST		=$(call POP_LIST_N,$(1),1)

# Generate Include Marker for given makefile
GET_MARKER		=$(subst /,_,$(subst .,_,$(patsubst $(MK_DIR)/%,%,$(abspath $(1)))))

# Set THIS as marker for including Makefile: $(MK_DIR)/foo/bar.mk -> foo_bar_mk
THIS			=$(call GET_MARKER,$(THIS_MAKEFILE))

# End Guard
END_GUARD		:=$(MK_DIR)/end_guard.mk

# Stop rebuild of Guard Makefile
$(GUARD): ;

endif # END Guard guard
##############################################################################

# Save Guard created variables
THIS_MAKEFILE_LIST	+=$(THIS_MAKEFILE)

# Set "THIS_MAKEFILE" for including Makefile's use (Remove guard.mk & check.mk)
THIS_MAKEFILE		:=$(lastword $(call POP_LIST_N,$(MAKEFILE_LIST),2))

##############################################################################
# Setup Include Guard for including Makefile

# Construct Include Marker for including Makefile
INCLUDE_MARKER		:=INCLUDE_$(THIS)

# This is first include
ifndef $(INCLUDE_MARKER)

# Set INCLUDE_foo_mk = /Full/Path/To/mk/foo.mk
$(INCLUDE_MARKER)	:=$(abspath $(THIS_MAKEFILE))

# Define FIRST_INCLUDE on first include
FIRST_INCLUDE		=YES

# Stop implicit rule search for including Makefile
$(THIS_MAKEFILE): ;

# This including Makefile was included before
else

# Undefine FIRST_INCLUDE on subsequent includes
undefine FIRST_INCLUDE

# end Include Guard setup for including Makefile
endif

# Unset variable holding name of include marker (Not the include marker itself)
undefine INCLUDE_MARKER

##############################################################################
