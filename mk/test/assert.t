include $(LIB.mk)/assert.mk

EXPECT:=.assert.if.def
ifndef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should be defined)
endif

#VEXPECT:=PATH.mk
#ifndef $(EXPECT)
#endif
#EXPECT:=$(realpath $(CURDIR)/..)
#ACTUAL:=$(PATH.mk)
#ifneq ($(EXPECT),$(ACTUAL))
#include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
#endif

PASS: ;
# vim: set syntax=make:
