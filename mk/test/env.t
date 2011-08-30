include $(LIB.mk)/env.mk

EXPECT:=.get.env.HOME
ifndef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should be defined)
endif

EXPECT:=$(HOME)
ACTUAL:=$(.get.env.HOME)
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

undefine HOME
EXPECT:=HOME
ifdef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should not be defined)
endif

EXPECT:=$(shell cd 2>/dev/null ; pwd)
ACTUAL:=$(.get.env.HOME)
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif


EXPECT:=.get.env.USER
ifndef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should be defined)
endif

EXPECT:=$(USER)
ACTUAL:=$(.get.env.USER)
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

undefine USER
EXPECT:=$(shell whoami)
ACTUAL:=$(.get.env.USER)
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif


EXPECT:=.get.env.TMPDIR
ifndef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should be defined)
endif

EXPECT:=/tmp
ACTUAL:=$(.get.env.TMPDIR)
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

undefine TMPDIR
EXPECT:=/tmp
ACTUAL:=$(.get.env.TMPDIR)
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

PASS: ;
# vim: set syntax=make:
