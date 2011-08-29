include ../func.mk

EXPECT:=.nothing
ifdef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should have no value)
endif
EXPECT:=AZ
ACTUAL:=A$(.nothing)Z
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=.true
ifndef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' is not defined)
endif
EXPECT:=A1Z
ACTUAL:=A$(.true)Z
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=.false
ifdef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should have no value)
endif
EXPECT:=A$(.nothing)Z
ACTUAL:=A$(.false)Z
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=.pass
ifndef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' is not defined)
endif
EXPECT:=AtrueZ
ACTUAL:=A$(.pass)Z
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=.fail
ifndef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' is not defined)
endif
EXPECT:=AfalseZ
ACTUAL:=A$(.fail)Z
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif


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

.DEFAULT_GOAL:=PASS
# vim: set syntax=make:
