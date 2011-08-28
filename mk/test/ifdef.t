##############################################################################
# ifdef / ifndef
##############################################################################

ifdef UNDEFINED
include FAIL $(error ifdef UNDEFINED)
endif

ifndef UNDEFINED
else
include FAIL $(error ifndef UNDEFINED)
endif

DEFINED=defined
ifndef DEFINED
include FAIL $(error ifndef DEFINED)
endif

ifdef DEFINED
else
include FAIL $(error ifdef DEFINED)
endif

undefine DEFINED
ifdef DEFINED
include FAIL $(error undefine DEFINED)
endif

.DEFAULT_GOAL:=PASS

##############################################################################
# vim: set syntax=make:
