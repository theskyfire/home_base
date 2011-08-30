include $(LIB.mk)/cond.mk

# ifdef / ifndef

DEFINED=defined
ifdef DEFINED
else
include FAIL $(error ifdef DEFINED)
endif
undefine DEFINED

undefine UNDEFINED
ifdef UNDEFINED
include FAIL $(error ifdef UNDEFINED)
endif

undefine UNDEFINED
ifndef UNDEFINED
else
include FAIL $(error ifndef UNDEFINED)
endif

DEFINED=defined
ifndef DEFINED
include FAIL $(error ifndef DEFINED)
endif
undefine DEFINED

undefine DEFINED
ifdef DEFINED
include FAIL $(error undefine DEFINED)
endif

EXPECT:=.if.def
ifndef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should be defined)
endif

DEFINED=defined
EXPECT:=Then
undefine ACTUAL
$(eval $(call .if.def,DEFINED,ACTUAL:=Then))
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif
undefine DEFINED

undefine UNDEFINED
EXPECT:=Else
undefine ACTUAL
$(eval $(call .if.def,UNDEFINED,ACTUAL:=Then,ACTUAL:=Else))
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif
undefine DEFINED

EXPECT:=.if.ndef
ifndef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should be defined)
endif

undefine UNDEFINED
EXPECT:=Then
undefine ACTUAL
$(eval $(call .if.ndef,UNDEFINED,ACTUAL:=Then,ACTUAL:=Else))
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif
undefine DEFINED

DEFINED=defined
EXPECT:=Else
undefine ACTUAL
$(eval $(call .if.ndef,DEFINED,ACTUAL:=Then,ACTUAL:=Else))
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif
undefine DEFINED

EXPECT:=.ifdef
ifndef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should be defined)
endif

DEFINED=defined
EXPECT:=Then
undefine ACTUAL
$(call .ifdef,DEFINED,ACTUAL:=Then,ACTUAL:=Else)
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif
undefine DEFINED

undefine UNDEFINED
EXPECT:=Else
undefine ACTUAL
$(call .ifdef,DEFINED,ACTUAL:=Then,ACTUAL:=Else)
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif
undefine DEFINED

EXPECT:=.ifndef
ifndef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should be defined)
endif

undefine UNDEFINED
EXPECT:=Then
undefine ACTUAL
$(call .ifndef,UNDEFINED,ACTUAL:=Then,ACTUAL:=Else)
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif
undefine DEFINED

DEFINED=defined
EXPECT:=Else
undefine ACTUAL
$(call .ifndef,DEFINED,ACTUAL:=Then,ACTUAL:=Else)
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif
undefine DEFINED

# ifeq / ifneq

ifeq (X,)
include FAIL $(error ifeq (X,))
endif

ifeq (,X)
include FAIL $(error ifeq (,X))
endif

ifeq (0,1)
include FAIL $(error ifeq (0,1))
endif

ifeq (x,X)
include FAIL $(error ifeq (x,X))
endif

ifeq "x" "X"
include FAIL $(error ifeq "x" "X")
endif

ifeq '0' "O"
include FAIL $(error ifeq '0' "O")
endif

ifeq "1" '0'
include FAIL $(error ifeq "1" '0')
endif

ifeq '' ' '
include FAIL $(error ifeq '' ' ')
endif


ifneq (,)
include FAIL $(error ifneq (,))
endif

ifneq (x,x)
include FAIL $(error ifneq (x,x))
endif

ifneq "X" "X"
include FAIL $(error ifneq "X" "X")
endif

ifneq '0' "0"
include FAIL $(error ifneq '0' "0")
endif

ifneq "1" '1'
include FAIL $(error ifneq "1" '1')
endif

ifneq '' ''
include FAIL $(error ifneq '' '')
endif

EXPECT:=.if.eq
ifndef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should be defined)
endif

EXPECT:=Then
undefine ACTUAL
$(eval $(call .if.eq,,,ACTUAL:=Then,ACTUAL:=Else))
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=Else
undefine ACTUAL
$(eval $(call .if.eq,X,,ACTUAL:=Then,ACTUAL:=Else))
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=.if.neq
ifndef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should be defined)
endif

EXPECT:=Then
undefine ACTUAL
$(eval $(call .if.neq,A,Z,ACTUAL:=Then,ACTUAL:=Else))
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=Else
undefine ACTUAL
$(eval $(call .if.neq,A,A,ACTUAL:=Then,ACTUAL:=Else))
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=.ifeq
ifndef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should be defined)
endif

EXPECT:=Then
undefine ACTUAL
$(call .ifeq,,,ACTUAL:=Then,ACTUAL:=Else)
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=Else
undefine ACTUAL
$(call .ifeq,X,,ACTUAL:=Then,ACTUAL:=Else)
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=.ifneq
ifndef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should be defined)
endif

EXPECT:=Then
undefine ACTUAL
$(call .ifneq,A,Z,ACTUAL:=Then,ACTUAL:=Else)
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=Else
undefine ACTUAL
$(call .ifneq,A,A,ACTUAL:=Then,ACTUAL:=Else)
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

PASS: ;
# vim: set syntax=make:
