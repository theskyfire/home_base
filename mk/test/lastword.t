EXPECT:=AZ
ACTUAL:=A$(lastword)Z
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=AZ
ACTUAL:=A$(lastword )Z
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=AZ
ACTUAL:=A$(lastword	)Z
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=AzZ
ACTUAL:=A$(lastword	z)Z
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=AzZ
ACTUAL:=A$(lastword	a z)Z
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=AzZ
ACTUAL:=A$(lastword	a	z)Z
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=Aa,zZ
ACTUAL:=A$(lastword	a,z	)Z
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=AzZ
ACTUAL:=A$(lastword	a	,	z	)Z
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

f=$(lastword	$(1)$(2))
EXPECT:=AzZ
ACTUAL:=A$(call f	, a , z )Z
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif
undefine f

f=$(lastword	$(1)$(2))
EXPECT:=AazZ
ACTUAL:=A$(call f	, a,z )Z
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif
undefine f

.DEFAULT_GOAL:=PASS
# vim: set syntax=make:
