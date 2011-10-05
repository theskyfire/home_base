########################################################################
# Assert macros
########################################################################
include $(guard)
ifdef $(.FIRST.INCLUDE)
########################################################################

include $(LIB.mk)/cond.mk

.assert.msg.prefix	=Assertion failed: $(strip )
.assert.msg.suffix	=$(strip )
.assert.msg		=$(.assert.msg.prefix)$(1)$(.assert.msg.suffix)
.assert.pass		=$(strip )
.assert.fail		=include FAIL $$(error $(call .assert.msg,$(1)))
.assert			=\
$(call .ifneq,\
	$(1)\
	,\
	$(strip )\
	,\
	$(.assert.pass)\
	,\
	$(call .assert.fail,$(2),$(1))\
)

.assert.eq.msg.prefix	=Equal assertion failed: $(strip )
.assert.eq.msg.suffix	=$(strip )
.assert.eq.msg		=$(.assert.eq.msg.prefix)Expected='$(1)' Actual='$(2)' $(3)$(.assert.eq.msg.suffix)
.assert.eq.pass		=$(strip )
.assert.eq.fail		=include FAIL $$(error $(call .assert.eq.msg,$(1),$(2),$(3)))
.assert.eq		=\
$(call .ifeq,\
	$(value 1)\
	,\
	$(value 2)\
	,\
	$(.assert.eq.pass)\
	,\
	$(call .assert.eq.fail,$(value 1),$(value 2),$(value 3))\
)

.assert.neq.msg.prefix	=Not equal assertion failed: $(strip )
.assert.neq.msg.suffix	=$(strip )
.assert.neq.msg		=$(.assert.neq.msg.prefix)'$(1)'=='$(2)' $(3)$(.assert.neq.msg.suffix)
.assert.neq.pass	=$(strip )
.assert.neq.fail	=include FAIL $$(error $(call .assert.neq.msg,$(1),$(2),$(3)))
.assert.neq		=\
$(call .ifneq,\
	$(1)\
	,\
	$(2)\
	,\
	$(.assert.neq.pass)\
	,\
	$(call .assert.neq.fail,$(1),$(2),$(3))\
)

.assert.def.msg.prefix	=Define assertion failed: $(strip )
.assert.def.msg.suffix	=$(strip )
.assert.def.msg		=$(.assert.def.msg.prefix)'$(1)' not defined $(2)$(.assert.def.msg.suffix)
.assert.def.pass	=$(strip )
.assert.def.fail	=include FAIL $$(error $(call .assert.def.msg,$(1),$(2)))
.assert.def		=\
$(call .ifdef,\
	$(1)\
	,\
	$(.assert.def.pass)\
	,\
	$(call .assert.def.fail,$(1),$(2))\
)

.assert.ndef.msg.prefix	=Undefine assertion failed: $(strip )
.assert.ndef.msg.suffix	=$(strip )
.assert.ndef.msg		=$(.assert.ndef.msg.prefix)'$(1)' defined $(2)$(.assert.ndef.msg.suffix)
.assert.ndef.pass	=$(strip )
.assert.ndef.fail	=include FAIL $$(error $(call .assert.ndef.msg,$(1),$(2)))
.assert.ndef		=\
$(call .ifndef,\
	$(1)\
	,\
	$(.assert.ndef.pass)\
	,\
	$(call .assert.ndef.fail,$(1),$(2))\
)

########################################################################
endif # .FIRST.INCLUDE
