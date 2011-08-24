##############################################################################
# call
##############################################################################

CALL1=A
CALL2=B
ifneq ($(call CALL1),A)
include FAIL $(error Does call work? Please use a modern GNU Make!)
endif
ifneq ($(call CALL2),B)
include FAIL $(error Does call work? Please use a modern GNU Make!)
endif
ifeq ($(call CALL1),$(call CALL2))
include FAIL $(error Does call work? Please use a modern GNU Make!)
endif
undefine CALL1
undefine CALL2

CALL=$(1)
ifneq ($(call CALL),)
include FAIL $(error Does call work? Please use a modern GNU Make!)
endif
ifneq ($(call CALL,A),A)
include FAIL $(error Does call work? Please use a modern GNU Make!)
endif
undefine CALL

##############################################################################
