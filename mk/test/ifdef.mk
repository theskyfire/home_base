##############################################################################
# ifdef / ifndef
##############################################################################

DEFINED=defined
ifndef DEFINED
include FAIL $(error Does ifndef work? Please use a modern GNU Make!)
endif

undefine DEFINED
ifdef DEFINED
include FAIL $(error Does undefine work? Please use a modern GNU Make!)
endif

ifdef UNDEFINED
include FAIL $(error Does ifdef work? Please use a modern GNU Make!)
endif


##############################################################################
