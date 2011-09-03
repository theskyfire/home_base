
CALL1=A
CALL2=B
ifneq ($(call CALL1),A)
include FAIL $(error CALL1 A)
endif
ifneq ($(call CALL2),B)
include FAIL $(error CALL2 B)
endif
ifeq ($(call CALL1),$(call CALL2))
include FAIL $(error CALL1 CALL2)
endif
undefine CALL1
undefine CALL2

CALL=$(1)
ifneq ($(call CALL),)
include FAIL $(error CALL,)
endif
ifneq ($(call CALL,A),A)
include FAIL $(error CALL,A)
endif
undefine CALL

# vim: set syntax=make:
