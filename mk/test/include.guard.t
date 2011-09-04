########################################################################
# Before first include

EXPECT=guard
ifdef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should not be defined)
endif

EXPECT=LIB.mk
ifdef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should not be defined)
endif

EXPECT=PATH.mk
ifdef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should not be defined)
endif

EXPECT=THIS.mk
ifdef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should not be defined)
endif

EXPECT=THIS.mk.abs
ifdef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should not be defined)
endif

EXPECT=THIS.mk.real
ifdef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should not be defined)
endif

EXPECT=THIS.mk.name
ifdef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should not be defined)
endif

EXPECT=THIS.mk.relative
ifdef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should not be defined)
endif

EXPECT=THIS.mk.esc
ifdef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should not be defined)
endif

EXPECT=THIS.mk.marker
ifdef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should not be defined)
endif

EXPECT=.FIRST.INCLUDE
ifdef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should not be defined)
endif

EXPECT=FIRST_INCLUDE
ifdef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should not be defined)
endif

EXPECT=INCLUDE.test_guard_t
ifdef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should not be defined)
endif

EXPECT=INCLUDE.test_include_guard_t
ifdef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should not be defined)
endif

########################################################################
# Include guard.mk & assert.mk

include ../lib/guard.mk

# save THIS.mk
SAVE.THIS.mk:=$(THIS.mk)

# fake guard & .FIRST.INCLUDE to include assert.mk
guard=/dev/null
.FIRST.INCLUDE=guard
include ../lib/assert.mk

# reload guard.mk to fix guard & .FIRST.INCLUDE
include ../lib/guard.mk
THIS.mk:=$(SAVE.THIS.mk)

########################################################################
# test guard.mk

$(call .assert.def,guard)
$(call .assert.eq,$(realpath ../lib/guard.mk),$(guard))

$(call .assert.def,LIB.mk)
$(call .assert.eq,$(patsubst %/,%,$(dir $(guard))),$(LIB.mk))

$(call .assert.def,PATH.mk)
$(call .assert.eq,$(patsubst %/,%,$(dir $(LIB.mk))),$(PATH.mk))

$(call .assert.def,THIS.mk)
$(call .assert.eq,$(TEST),$(THIS.mk))

$(call .assert.def,THIS.mk.abs)
$(call .assert.eq,$(abspath $(THIS.mk)),$(THIS.mk.abs))

$(call .assert.def,THIS.mk.real)
$(call .assert.eq,$(realpath $(THIS.mk)),$(THIS.mk.real))

$(call .assert.def,THIS.mk.name)
$(call .assert.eq,$(notdir $(THIS.mk.real)),$(THIS.mk.name))

$(call .assert.def,THIS.mk.relative)
$(call .assert.eq,$(patsubst $(PATH.mk)/%,%,$(THIS.mk.real)),$(THIS.mk.relative))

$(call .assert.def,THIS.mk.esc)
$(call .assert.eq,test_include_guard_t,$(THIS.mk.esc))

$(call .assert.def,THIS.mk.marker)
$(call .assert.eq,INCLUDE.$(THIS.mk.esc),$(THIS.mk.marker))

$(call .assert.def,.FIRST.INCLUDE)

########################################################################
# call .FIRST.INCLUDE for first time

$(call .assert.ndef,FIRST_INCLUDE)
$(call .assert.ndef,INCLUDE.test_include_guard_t)

$(call .assert.def,.FIRST.INCLUDE)
$(call .assert.eq,FIRST_INCLUDE,$(.FIRST.INCLUDE))

$(call .assert.def,FIRST_INCLUDE)
$(call .assert.eq,FIRST_INCLUDE,$(FIRST_INCLUDE))

$(call .assert.def,INCLUDE.test_include_guard_t)
$(call .assert.eq,X,$(INCLUDE.test_include_guard_t))

#### $(THIS.mk):: ;  should now be defined
.DEFAULT_GOAL:=$(THIS.mk)

########################################################################
# call .FIRST.INCLUDE for second time

$(call .assert.def,.FIRST.INCLUDE)
$(call .assert.eq,FIRST_INCLUDE,$(.FIRST.INCLUDE))

$(call .assert.ndef,FIRST_INCLUDE)

$(call .assert.def,INCLUDE.test_include_guard_t)
$(call .assert.eq,XX,$(INCLUDE.test_include_guard_t))

########################################################################
# call .FIRST.INCLUDE for third time

$(call .assert.def,.FIRST.INCLUDE)
$(call .assert.eq,FIRST_INCLUDE,$(.FIRST.INCLUDE))

$(call .assert.ndef,FIRST_INCLUDE)

$(call .assert.def,INCLUDE.test_include_guard_t)
$(call .assert.eq,XXX,$(INCLUDE.test_include_guard_t))

########################################################################
# call .FIRST.INCLUDE for forth time after resetting marker
undefine $(THIS.mk.marker)

$(call .assert.def,.FIRST.INCLUDE)
$(call .assert.eq,FIRST_INCLUDE,$(.FIRST.INCLUDE))

$(call .assert.def,FIRST_INCLUDE)
$(call .assert.eq,FIRST_INCLUDE,$(FIRST_INCLUDE))

$(call .assert.def,INCLUDE.test_include_guard_t)
$(call .assert.eq,X,$(INCLUDE.test_include_guard_t))

########################################################################
# vim: set syntax=make:
