EXPECT:=AZ
ACTUAL:=A$(firstword)Z
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=AZ
ACTUAL:=A$(firstword )Z
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=AZ
ACTUAL:=A$(firstword	)Z
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=AzZ
ACTUAL:=A$(firstword	z)Z
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=AaZ
ACTUAL:=A$(firstword	a z)Z
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=AaZ
ACTUAL:=A$(firstword	a	z)Z
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=Aa,zZ
ACTUAL:=A$(firstword	a,z	)Z
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=AaZ
ACTUAL:=A$(firstword	a	,	z	)Z
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

f=$(firstword	$(1)$(2))
EXPECT:=AaZ
ACTUAL:=A$(call f	, a , z )Z
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif
undefine f

f=$(firstword	$(1)$(2))
EXPECT:=AazZ
ACTUAL:=A$(call f	, a,z )Z
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif
undefine f

PASS: ;
# vim: set syntax=make:
