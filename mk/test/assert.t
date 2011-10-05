include $(LIB.mk)/cond.mk
include $(LIB.mk)/assert.mk

########################################################################
# .assert

$(call .ifndef,.assert.msg.prefix,\
	include FAIL $$(error Assertion failed: '$$(1)' should be defined)\
)
$(call .ifneq,\
	xAssertion failed: x\
	,\
	x$(.assert.msg.prefix)x\
	,\
	include FAIL $$(error Assertion failed: EXPECT='$$(1)' ACTUAL='$$(2)')\
)

$(call .ifndef,.assert.msg.suffix,\
	include FAIL $$(error Assertion failed: '$$(1)' should be defined)\
)
$(call .ifneq,\
	xx\
	,\
	x$(.assert.msg.suffix)x\
	,\
	include FAIL $$(error Assertion failed: EXPECT='$$(1)' ACTUAL='$$(2)')\
)

$(call .ifndef,.assert.msg,\
	include FAIL $$(error Assertion failed: '$$(1)' should be defined)\
)
$(call .ifneq,\
	$$(.assert.msg.prefix)$$(1)$$(.assert.msg.suffix)\
	,\
	$(value .assert.msg)\
	,\
	include FAIL $$(error Assertion failed: EXPECT='$$(1)' ACTUAL='$$(2)')\
)

$(call .ifndef,.assert.pass,\
	include FAIL $$(error Assertion failed: '$$(1)' should be defined)\
)
$(call .ifneq,\
	xx\
	,\
	x$(.assert.pass)x\
	,\
	include FAIL $$(error Assertion failed: EXPECT='$$(1)' ACTUAL='$$(2)')\
)

$(call .ifndef,.assert.fail,\
	include FAIL $$(error Assertion failed: '$$(1)' should be defined)\
)
EXPECT=include FAIL $$(error $(.assert.msg))
$(call .ifneq,\
	$(value EXPECT)\
	,\
	$(value .assert.fail)\
	,\
	include FAIL $$(error Assertion failed: EXPECT='$$(1)' ACTUAL='$$(2)')\
)

$(call .ifndef,.assert,\
	include FAIL $$(error Assertion failed: '$$(1)' should be defined)\
)
$(call .assert,X,assert failure)
.comma:=,
$(call .assert,$(.comma),assert failure)

########################################################################
# .assert.eq

$(call .ifndef,.assert.eq.msg.prefix,\
	include FAIL $$(error Assertion failed: '$$(1)' should be defined)\
)
$(call .ifneq,\
	Equal assertion failed:\
	,\
	$(.assert.eq.msg.prefix)\
	,\
	include FAIL $$(error Assertion failed: EXPECT='$$(1)' ACTUAL='$$(2)')\
)

$(call .ifndef,.assert.eq.msg.suffix,\
	include FAIL $$(error Assertion failed: '$$(1)' should be defined)\
)
$(call .ifneq,\
	x$(.assert.msg.suffix)x\
	,\
	x$(.assert.eq.msg.suffix)x\
	,\
	include FAIL $$(error Assertion failed: EXPECT='$$(1)' ACTUAL='$$(2)')\
)

$(call .ifndef,.assert.eq.msg,\
	include FAIL $$(error Assertion failed: '$$(1)' should be defined)\
)
$(call .ifneq,\
	$$(.assert.eq.msg.prefix)Expected='$$(1)' Actual='$$(2)' $$(3)$$(.assert.eq.msg.suffix)\
	,\
	$(value .assert.eq.msg)\
	,\
	include FAIL $$(error Assertion failed: EXPECT='$$(1)' ACTUAL='$$(2)')\
)

$(call .ifndef,.assert.eq.pass,\
	include FAIL $$(error Assertion failed: '$$(1)' should be defined)\
)
$(call .ifneq,\
	xx\
	,\
	x$(.assert.eq.pass)x\
	,\
	include FAIL $$(error Assertion failed: EXPECT='$$(1)' ACTUAL='$$(2)')\
)

$(call .ifndef,.assert.eq.fail,\
	include FAIL $$(error Assertion failed: '$$(1)' should be defined)\
)
EXPECT=include FAIL $$(error $(.assert.eq.msg))
$(call .ifneq,\
	$(value EXPECT)\
	,\
	$(value .assert.eq.fail)\
	,\
	include FAIL $$(error Assertion failed: EXPECT='$$(1)' ACTUAL='$$(2)')\
)

$(call .ifndef,.assert.eq,\
	include FAIL $$(error Assertion failed: '$$(1)' should be defined)\
)
$(call .assert.eq,X,X,assert failure)
$(call .assert.eq,,,assert failure)
$(call .assert.eq, ,,assert failure)
$(call .assert.eq, ,	,assert failure)
.comma:=,
$(call .assert.eq,A$(.comma)Z,A$(.comma)Z,assert failure)

########################################################################
# .assert.neq

$(call .ifndef,.assert.neq.msg.prefix,\
	include FAIL $$(error Assertion failed: '$$(1)' should be defined)\
)
$(call .ifneq,\
	Not equal assertion failed:\
	,\
	$(.assert.neq.msg.prefix)\
	,\
	include FAIL $$(error Assertion failed: EXPECT='$$(1)' ACTUAL='$$(2)')\
)

$(call .ifndef,.assert.neq.msg.suffix,\
	include FAIL $$(error Assertion failed: '$$(1)' should be defined)\
)
$(call .ifneq,\
	x$(.assert.msg.suffix)x\
	,\
	x$(.assert.neq.msg.suffix)x\
	,\
	include FAIL $$(error Assertion failed: EXPECT='$$(1)' ACTUAL='$$(2)')\
)

$(call .ifndef,.assert.neq.msg,\
	include FAIL $$(error Assertion failed: '$$(1)' should be defined)\
)
$(call .ifneq,\
	$$(.assert.neq.msg.prefix)'$$(1)'=='$$(2)' $$(3)$$(.assert.neq.msg.suffix)\
	,\
	$(value .assert.neq.msg)\
	,\
	include FAIL $$(error Assertion failed: EXPECT='$$(1)' ACTUAL='$$(2)')\
)

$(call .ifndef,.assert.neq.pass,\
	include FAIL $$(error Assertion failed: '$$(1)' should be defined)\
)
$(call .ifneq,\
	xx\
	,\
	x$(.assert.neq.pass)x\
	,\
	include FAIL $$(error Assertion failed: EXPECT='$$(1)' ACTUAL='$$(2)')\
)

$(call .ifndef,.assert.neq.fail,\
	include FAIL $$(error Assertion failed: '$$(1)' should be defined)\
)
EXPECT=include FAIL $$(error $(.assert.neq.msg))
$(call .ifneq,\
	$(value EXPECT)\
	,\
	$(value .assert.neq.fail)\
	,\
	include FAIL $$(error Assertion failed: EXPECT='$$(1)' ACTUAL='$$(2)')\
)

$(call .ifndef,.assert.neq,\
	include FAIL $$(error Assertion failed: '$$(1)' should be defined)\
)
$(call .assert.neq,x,X,assert failure)
$(call .assert.neq,x,,assert failure)
$(call .assert.neq,,x,assert failure)
$(call .assert.neq,a,A,assert failure)
$(call .assert.neq,A,Z,assert failure)

########################################################################
# .assert.def

$(call .ifndef,.assert.def.msg.prefix,\
	include FAIL $$(error Assertion failed: '$$(1)' should be defined)\
)
$(call .ifneq,\
	xDefine assertion failed: x\
	,\
	x$(.assert.def.msg.prefix)x\
	,\
	include FAIL $$(error Assertion failed: EXPECT='$$(1)' ACTUAL='$$(2)')\
)

$(call .ifndef,.assert.def.msg.suffix,\
	include FAIL $$(error Assertion failed: '$$(1)' should be defined)\
)
$(call .ifneq,\
	xx\
	,\
	x$(.assert.def.msg.suffix)x\
	,\
	include FAIL $$(error Assertion failed: EXPECT='$$(1)' ACTUAL='$$(2)')\
)

$(call .ifndef,.assert.def.msg,\
	include FAIL $$(error Assertion failed: '$$(1)' should be defined)\
)
$(call .ifneq,\
	$$(.assert.def.msg.prefix)'$$(1)' not defined $$(2)$$(.assert.def.msg.suffix)\
	,\
	$(value .assert.def.msg)\
	,\
	include FAIL $$(error Assertion failed: EXPECT='$$(1)' ACTUAL='$$(2)')\
)

$(call .ifndef,.assert.def.pass,\
	include FAIL $$(error Assertion failed: '$$(1)' should be defined)\
)
$(call .ifneq,\
	xx\
	,\
	x$(.assert.def.pass)x\
	,\
	include FAIL $$(error Assertion failed: EXPECT='$$(1)' ACTUAL='$$(2)')\
)

$(call .ifndef,.assert.def.fail,\
	include FAIL $$(error Assertion failed: '$$(1)' should be defined)\
)
EXPECT=include FAIL $$(error $(.assert.def.msg))
$(call .ifneq,\
	$(value EXPECT)\
	,\
	$(value .assert.def.fail)\
	,\
	include FAIL $$(error Assertion failed: EXPECT='$$(1)' ACTUAL='$$(2)')\
)

$(call .ifndef,.assert.def,\
	include FAIL $$(error Assertion failed: '$$(1)' should be defined)\
)
DEFINED=defined
$(call .assert.def,DEFINED,assert.def failure)

########################################################################
# .assert.ndef

$(call .ifndef,.assert.ndef.msg.prefix,\
	include FAIL $$(error Assertion failed: '$$(1)' should be defined)\
)
$(call .ifneq,\
	xUndefine assertion failed: x\
	,\
	x$(.assert.ndef.msg.prefix)x\
	,\
	include FAIL $$(error Assertion failed: EXPECT='$$(1)' ACTUAL='$$(2)')\
)

$(call .ifndef,.assert.ndef.msg.suffix,\
	include FAIL $$(error Assertion failed: '$$(1)' should be defined)\
)
$(call .ifneq,\
	xx\
	,\
	x$(.assert.ndef.msg.suffix)x\
	,\
	include FAIL $$(error Assertion failed: EXPECT='$$(1)' ACTUAL='$$(2)')\
)

$(call .ifndef,.assert.ndef.msg,\
	include FAIL $$(error Assertion failed: '$$(1)' should be defined)\
)
$(call .ifneq,\
	$$(.assert.ndef.msg.prefix)'$$(1)' defined $$(2)$$(.assert.ndef.msg.suffix)\
	,\
	$(value .assert.ndef.msg)\
	,\
	include FAIL $$(error Assertion failed: EXPECT='$$(1)' ACTUAL='$$(2)')\
)

$(call .ifndef,.assert.ndef.pass,\
	include FAIL $$(error Assertion failed: '$$(1)' should be defined)\
)
$(call .ifneq,\
	xx\
	,\
	x$(.assert.ndef.pass)x\
	,\
	include FAIL $$(error Assertion failed: EXPECT='$$(1)' ACTUAL='$$(2)')\
)

$(call .ifndef,.assert.ndef.fail,\
	include FAIL $$(error Assertion failed: '$$(1)' should be defined)\
)
EXPECT=include FAIL $$(error $(.assert.ndef.msg))
$(call .ifneq,\
	$(value EXPECT)\
	,\
	$(value .assert.ndef.fail)\
	,\
	include FAIL $$(error Assertion failed: EXPECT='$$(1)' ACTUAL='$$(2)')\
)

$(call .ifndef,.assert.ndef,\
	include FAIL $$(error Assertion failed: '$$(1)' should be defined)\
)
undefine UNDEFINED
$(call .assert.ndef,UNDEFINED,assert.ndef failure)

########################################################################
# These tests MUST all fail, so they are run in a sub-make
tests			=
tests			+=basic_assert
tests			+=basic_space
tests			+=basic_tab
tests			+=empty_var
tests			+=eq_blank
tests			+=eq_case
tests			+=eq_alpha
tests			+=neq_blank
tests			+=neq_case
tests			+=neq_alpha
tests			+=def
tests			+=undef

.PHONY: $(tests)
$(tests):
	{\
		function err_trap () {\
			echo 'FAIL' ;\
			mv 'assert.tt.out' 'assert.tt.out.err' ;\
			exit 1 ;\
		} ;\
		trap err_trap ERR ;\
		echo -ne 'assert.tt $@: ' ;\
		echo -ne '$(SUBMAKE)\n\n' > 'assert.tt.out' ;\
		$(SUBMAKE) >> 'assert.tt.out' 2>&1 ||: ;\
		grep -q -s '{EXPECTED FAILURE}' 'assert.tt.out' ;\
		echo PASS ;\
	}

PASS: $(tests)
# vim: set syntax=make:
