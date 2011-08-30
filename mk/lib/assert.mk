########################################################################
# Assert macros
########################################################################
include $(guard)
ifdef $(.FIRST.INCLUDE)
########################################################################

define .assert.if.def =
$(1)
endef

#.assert.value		:=
#.assert.error		:=
#.assert			=\
#$(.debug.2)\
#$(eval .assert.value:=$$(strip $$(1)))\
#$(eval .assert.error:=$$(strip $$(2)))\
#$(if $(.assert.value),,include FAIL $(eval $$(error $(.assert.error))))
#
#.assert.needle		:=
#.assert.haystack	:=
#.assert.in		=\
#$(.debug.3)\
#$(eval .assert.needle:=$$(strip $$(1)))\
#$(eval .assert.haystack:=$$(strip $$(2)))\
#$(call .assert,\
#	$(call .in,\
#		$(.assert.needle),\
#		$(.assert.haystack)\
#	),\
#	$(3)\
#)
#
#.assert.expect		:=
#.assert.actual		:=
#.assert.eq		=\
#$(.debug.3)\
#$(eval .assert.expect:=$$(strip $$(1)))\
#$(eval .assert.actual:=$$(strip $$(1)))\
#$(call .assert,\
#	$(call .eq,\
#		$(.assert.expect),\
#		$(.assert.actual)\
#	),\
#	$(3)\
#)
########################################################################
endif # .FIRST.INCLUDE
