########################################################################
# ifdef

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

undefine DEFINED
ifdef DEFINED
include FAIL $(error undefine DEFINED)
endif

VAR=DEFINED
DEFINED=defined
ifdef $(VAR)
else
include FAIL $(error ifdef $$(VAR))
endif
undefine DEFINED
undefine VAR

VAR=.if.def
ifndef $(VAR)
include FAIL $(error Assertion failed: '$(VAR)' should be defined)
endif
undefine VAR

VAR=.ifdef
ifndef $(VAR)
include FAIL $(error Assertion failed: '$(VAR)' should be defined)
endif
undefine VAR

DEFINED=defined
EXPECT=Then
undefine ACTUAL
$(call .ifdef,DEFINED,ACTUAL=Then,ACTUAL=Else)
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif
undefine DEFINED

undefine UNDEFINED
EXPECT=Else
undefine ACTUAL
$(call .ifdef,UNDEFINED,ACTUAL=Then,ACTUAL=Else)
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

DEFINED=defined
$(call .ifdef,\
	DEFINED\
	,\
	,\
	include FAIL $$(error Assertion failed: DEFINED undefined)\
)
undefine DEFINED

undefine UNDEFINED
$(call .ifdef,\
	UNDEFINED\
	,\
	include FAIL $$(error Assertion failed: UNDEFINED defined)\
	,\
)
undefine DEFINED

DEFINED=defined
VAR=DEFINED
THEN=$(if X,,$(error Assertion failed: THEN))
ELSE=$(error Assertion failed: ELSE)
$(call .ifdef,\
	$(VAR)\
	,\
	$(THEN)\
	,\
	$(value ELSE)\
)
undefine ELSE
undefine THEN
undefine VAR
undefine DEFINED

########################################################################
# ifndef

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

EXPECT=.if.ndef
ifndef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should be defined)
endif

EXPECT=.ifndef
ifndef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should be defined)
endif

undefine UNDEFINED
EXPECT=Then
undefine ACTUAL
$(call .ifndef,UNDEFINED,ACTUAL=Then,ACTUAL=Else)
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif
undefine DEFINED

DEFINED=defined
EXPECT=Else
undefine ACTUAL
$(call .ifndef,DEFINED,ACTUAL=Then,ACTUAL=Else)
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif
undefine DEFINED

undefine UNDEFINED
$(call .ifndef,\
	UNDEFINED\
	,\
	,\
	include FAIL $$(error Assertion failed: error should not happen)\
)

undefine UNDEFINED
VAR=$(if X,UNDEFINED,$(error Assertion failed: VAR))
THEN=$(if X,,$(error Assertion failed: THEN))
ELSE=$(error Assertion failed: ELSE)
test_eval_cond=$(call .if.ndef,\
	$(value VAR)\
	,\
	$(value THEN)\
	,\
	$(value ELSE)\
)
$(eval $(test_eval_cond))
undefine test_eval_cond
undefine ELSE
undefine THEN
undefine VAR

########################################################################
# ifeq

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

ifeq (a,z,a,z)
include FAIL $(error ifeq (a,z,a,z))
endif

ifeq (,)a,,)a)
include FAIL $(error ifeq (a,z,a,z))
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

EXPECT=.if.eq
ifndef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should be defined)
endif

EXPECT=.ifeq
ifndef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should be defined)
endif

EXPECT=Then
undefine ACTUAL
$(call .ifeq,,,ACTUAL=Then,ACTUAL=Else)
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT=Else
undefine ACTUAL
$(call .ifeq,X,,ACTUAL=Then,ACTUAL=Else)
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

$(call .ifeq,\
	A\
	,\
	A\
	,\
	,\
	include FAIL $$(error Assertion failed: error should not happen)\
)

f=$(call .ifeq,\
	$(1)\
	,\
	$(2)\
	,\
	,\
	include FAIL $$(error Assertion failed: error should not happen)\
)
$(call f)
undefine f

VAR1=$(if X,AAA,$(error Assertion failed: VAR1))
VAR2=$(if X,AAA,$(error Assertion failed: VAR2))
THEN=$(if X,,$(error Assertion failed: THEN))
ELSE=$(error Assertion failed: ELSE)
test_eval_cond=$(call .if.eq,\
	$(value VAR1)\
	,\
	$(value VAR2)\
	,\
	$(value THEN)\
	,\
	$(value ELSE)\
)
$(eval $(test_eval_cond))
undefine test_eval_cond
undefine ELSE
undefine THEN
undefine VAR2
undefine VAR1

########################################################################
# ifneq

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

EXPECT=.if.neq
ifndef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should be defined)
endif

EXPECT=.ifneq
ifndef $(EXPECT)
include FAIL $(error Assertion failed: '$(EXPECT)' should be defined)
endif

EXPECT=Then
undefine ACTUAL
$(call .ifneq,A,Z,ACTUAL=Then,ACTUAL=Else)
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT=Else
undefine ACTUAL
$(call .ifneq,A,A,ACTUAL=Then,ACTUAL=Else)
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

$(call .ifneq,\
	A\
	,\
	Z\
	,\
	,\
	include FAIL $$(error Assertion failed: error should not happen)\
)

VAR1=$(if X,AAA,$(error Assertion failed: VAR1))
VAR2=$(if X,ZZZ,$(error Assertion failed: VAR2))
THEN=$(if X,,$(error Assertion failed: THEN))
ELSE=$(error Assertion failed: ELSE)
test_eval_cond=$(call .if.neq,\
	$(value VAR1)\
	,\
	$(value VAR2)\
	,\
	$(value THEN)\
	,\
	$(value ELSE)\
)
$(eval $(test_eval_cond))
undefine test_eval_cond
undefine ELSE
undefine THEN
undefine VAR2
undefine VAR1

# vim: set syntax=make:
