########################################################################
# Before first include

EXPECT:=PATH.mk
ifndef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should be defined)
endif
EXPECT:=$(realpath $(CURDIR)/..)
ACTUAL:=$(PATH.mk)
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=guard
ifndef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should be defined)
endif
EXPECT:=$(PATH.mk)/lib/guard.mk
ACTUAL:=$(guard)
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=THIS.mk
ifdef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should not be defined)
endif
EXPECT:=AZ
ACTUAL:=A$(THIS.mk)Z
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=THIS.mk.abs
ifdef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should not be defined)
endif
EXPECT:=AZ
ACTUAL:=A$(THIS.mk.abs)Z
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=THIS.mk.real
ifdef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should not be defined)
endif
EXPECT:=AZ
ACTUAL:=A$(THIS.mk.real)Z
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=THIS.mk.name
ifdef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should not be defined)
endif
EXPECT:=AZ
ACTUAL:=A$(THIS.mk.name)Z
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=THIS.mk.relative
ifdef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should not be defined)
endif
EXPECT:=AZ
ACTUAL:=A$(THIS.mk.relative)Z
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=THIS.mk.esc
ifdef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should not be defined)
endif
EXPECT:=AZ
ACTUAL:=A$(THIS.mk.esc)Z
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=THIS.mk.marker
ifdef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should not be defined)
endif
EXPECT:=AZ
ACTUAL:=A$(THIS.mk.esc)Z
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=INCLUDE.test_include_guard_t
ifdef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should not be defined)
endif
EXPECT:=AZ
ACTUAL:=A$(INCLUDE.test_include_guard_t)Z
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=THIS.mk.includes
ifdef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should not be defined)
endif
EXPECT:=AZ
ACTUAL:=A$(THIS.mk.includes)Z
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=FIRST_INCLUDE
ifdef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should not be defined)
endif
EXPECT:=AZ
ACTUAL:=A$(FIRST_INCLUDE)Z
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=.FIRST.INCLUDE
ifdef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should not be defined)
endif
EXPECT:=AZ
ACTUAL:=A$(.FIRST.INCLUDE)Z
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

########################################################################
# Include
include $(guard)

EXPECT:=THIS.mk
ifndef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' is not defined)
endif
EXPECT:=$(TEST)
ACTUAL:=$(THIS.mk)
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=THIS.mk.abs
ifndef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should be defined)
endif
EXPECT:=$(abspath $(THIS.mk))
ACTUAL:=$(THIS.mk.abs)
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=THIS.mk.real
ifndef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should be defined)
endif
EXPECT:=$(realpath $(THIS.mk))
ACTUAL:=$(THIS.mk.real)
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=THIS.mk.name
ifndef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should be defined)
endif
EXPECT:=$(notdir $(THIS.mk.real))
ACTUAL:=$(THIS.mk.name)
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=THIS.mk.relative
ifndef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should be defined)
endif
EXPECT:=$(patsubst $(PATH.mk)/%,%,$(THIS.mk.real))
ACTUAL:=$(THIS.mk.relative)
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=THIS.mk.esc
ifndef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should be defined)
endif
EXPECT:=test_include_guard_t
ACTUAL:=$(THIS.mk.esc)
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=THIS.mk.marker
ifndef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should be defined)
endif
EXPECT:=INCLUDE.$(THIS.mk.esc)
ACTUAL:=$(THIS.mk.marker)
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

########################################################################
# call .FIRST.INCLUDE for first time

# still not defined
EXPECT:=FIRST_INCLUDE
ifdef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should not be defined)
endif
EXPECT:=AZ
ACTUAL:=A$(FIRST_INCLUDE)Z
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

# still not defined
EXPECT:=INCLUDE.test_include_guard_t
ifdef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should not be defined)
endif
EXPECT:=AZ
ACTUAL:=A$(FIRST_INCLUDE)Z
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=.FIRST.INCLUDE
ifndef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should be defined)
endif

EXPECT:=FIRST_INCLUDE
ACTUAL:=$(.FIRST.INCLUDE)
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=FIRST_INCLUDE
ifndef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should be defined)
endif
EXPECT:=FIRST_INCLUDE
ACTUAL:=$(FIRST_INCLUDE)
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=INCLUDE.test_include_guard_t
ifndef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should be defined)
endif
EXPECT:=AXZ
ACTUAL:=A$(INCLUDE.test_include_guard_t)Z
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

########################################################################
# call .FIRST.INCLUDE for second time

EXPECT:=.FIRST.INCLUDE
ifndef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should be defined)
endif

EXPECT:=FIRST_INCLUDE
ACTUAL:=$(.FIRST.INCLUDE)
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=FIRST_INCLUDE
ifdef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should not be defined)
endif
EXPECT:=AZ
ACTUAL:=A$(FIRST_INCLUDE)Z
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=INCLUDE.test_include_guard_t
ifndef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should be defined)
endif
EXPECT:=X_X
ACTUAL:=$(INCLUDE.test_include_guard_t)
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

########################################################################
# call .FIRST.INCLUDE for third time

EXPECT:=.FIRST.INCLUDE
ifndef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should be defined)
endif

EXPECT:=FIRST_INCLUDE
ACTUAL:=$(.FIRST.INCLUDE)
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=FIRST_INCLUDE
ifdef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should not be defined)
endif
EXPECT:=AZ
ACTUAL:=A$(FIRST_INCLUDE)Z
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=INCLUDE.test_include_guard_t
ifndef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should be defined)
endif
EXPECT:=X_X_X
ACTUAL:=$(INCLUDE.test_include_guard_t)
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

########################################################################
# call .FIRST.INCLUDE for forth time after resetting marker
undefine $(THIS.mk.marker)

EXPECT:=.FIRST.INCLUDE
ifndef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should be defined)
endif

EXPECT:=FIRST_INCLUDE
ACTUAL:=$(.FIRST.INCLUDE)
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=FIRST_INCLUDE
ifndef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should be defined)
endif
EXPECT:=FIRST_INCLUDE
ACTUAL:=$(FIRST_INCLUDE)
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=INCLUDE.test_include_guard_t
ifndef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should be defined)
endif
EXPECT:=AXZ
ACTUAL:=A$(INCLUDE.test_include_guard_t)Z
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

########################################################################
PASS: ;
# vim: set syntax=make:
