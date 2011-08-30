EXPECT:=AZ
ACTUAL:=A$(subst)Z
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=*** insufficient number of arguments (1) to function
SUBSHELL:=$(shell $(MAKE) --eval='A$$(subst )Z' 2>&1)
ACTUAL:=$(findstring $(EXPECT),$(SUBSHELL))
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=*** insufficient number of arguments (1) to function
SUBSHELL:=xIGNOREx $(shell $(MAKE) --eval='A$$(subst a)Z' 2>&1)
ACTUAL:=$(findstring $(EXPECT),$(SUBSHELL))
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=*** insufficient number of arguments (2) to function
SUBSHELL:=xIGNOREx $(shell $(MAKE) --eval='A$$(subst a , b)Z' 2>&1)
ACTUAL:=$(findstring $(EXPECT),$(SUBSHELL))
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=AZ
ACTUAL:=A$(subst a , b ,)Z
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=AZ
ACTUAL:=$(subst x,,xAxZx)
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=AZ
ACTUAL:=$(subst az,AZ,az)
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=az
ACTUAL:=$(subst az ,AZ,az)
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=A  Q Z
ACTUAL:=A$(subst\
	q,\
	Q,\
	q\
)Z
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

f=$(subst $(1),$(2),$(3))
EXPECT:=A Q Z
ACTUAL:=A$(call f,\
	q,\
	Q,\
	q\
)Z
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif
undefine f

f=$(subst $(strip $(1)),$(strip $(2)),$(strip $(3)))
EXPECT:=AQZ
ACTUAL:=A$(call f,\
	q,\
	Q,\
	q\
)Z
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif
undefine f

PASS: ;
# vim: set syntax=make:
