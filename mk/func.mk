##############################################################################
# Functions
##############################################################################
ifndef INCLUDE.func.mk
INCLUDE.func.mk		:=$(lastword $(MAKEFILE_LIST))
##############################################################################
# This must be the first target to test support for .DEFAULT_GOAL

FAIL: FORCE
	@echo "Error: Please use a modern version of GNU Make!" >&2
	false

PASS: FORCE
	true

FORCE:

.PHONY: FAIL PASS FORCE

# Require .DEFAULT_GOAL
ifndef .DEFAULT_GOAL
include FAIL $(error Please use a modern version of GNU Make!)
endif
.DEFAULT_GOAL=FAIL
##############################################################################

# Simple values
.nothing		:=
.true			:=1
.false			:=$(.nothing)
.pass			:=true
.fail			:=false
.nop			:=$(.pass)
.space			:=$(.nothing) $(.nothing)
.comma			:=,
.slash			:=/
.dot			:=.
.under			:=_
.dollar			:=$$
.l.paren		:=(
.r.paren		:=)
.l.brace		:={
.r.brace		:=}
.l.bracket		:=[
.r.bracket		:=]
.percent		:=%
.colon			:=:

ifneq (,$(DEBUG))
.debug.0		=$(warning [$(0)])
.debug.1		=$(warning [$(0)]($(1)))
.debug.2		=$(warning [$(0)]($(1))($(2)))
.debug.3		=$(warning [$(0)]($(1))($(2))($(3)))
else
.debug.0		=
.debug.1		=
.debug.2		=
.debug.3		=
endif

x=if A B C

.uncurry		=\
$(strip \
$(eval .uncurry.foo:=)\
$(eval .uncurry.tmp=$$$(.l.paren)call )\
$(eval .uncurry.tmp+=$(firstword $(1)))\
$(eval .uncurry.tmp+=$$$(.l.paren).uncurry.foo)\
$(foreach arg,$(wordlist 2,$(words $(1)),$(1)),$(eval .uncurry.tmp+=$(.r.paren),$$$(.l.paren)strip $(arg)))\
$(eval .uncurry.tmp+=$(.r.paren))\
$(eval .uncurry.tmp+=$(.r.paren))\
$(call .uncurry.tmp)\
)


.if			=\
$(.debug.3)\
$(if $(strip $(1)),$(strip $(2)),$(strip $(3)))

.test			=\
$(.debug.1)\
$(call .if,\
	$(1),\
	$(.true),\
	$(.false)\
)

.not			=\
$(.debug.1)\
$(call .if,\
	$(1),\
	$(.false),\
	$(.true)\
)

.or			=\
$(.debug.2)\
$(call .test,\
	$(or $(strip $(1)),$(strip $(2)))\
)

.and			=\
$(.debug.2)\
$(call .test,\
	$(and $(strip $(1)),$(strip $(2)))\
)

.nor			=\
$(.debug.2)\
$(call .not,\
	$(call .or,$(1),$(2))\
)

.nand			=\
$(.debug.2)\
$(call .not,\
	$(call .and,$(1),$(2))\
)

.xor			=\
$(.debug.2)\
$(call .and,\
	$(call .or,$(1),$(2)),\
	$(call .nand,$(1),$(2))\
)

.iff			=\
$(.debug.2)\
$(call .not,\
	$(call .xor,$(1),$(2))\
)

.oif		=\
$(.debug.2)\
$(call .and,\
	$(call .not,$(1)),\
	$(2)\
)


.noif		=\
$(.debug.2)\
$(call .not,\
	$(call .oif,$(1),$(2))\
)

.when			=\
$(.debug.2)\
$(call .if,\
	$(1),\
	$(2),\
	$(.nothing)\
)

.unless			=\
$(.debug.2)\
$(call .if,\
	$(1),\
	$(.nothing),\
	$(2)\
)

.findstring		=\
$(.debug.2)\
$(findstring $(strip $(1)),$(strip $(2)))

.in			=\
$(.debug.2)\
$(call .findstring,\
	$(1),\
	$(2)\
)


.eq			=\
$(.debug.2)\
$(call .or,\
	$(call .not,\
		$(call .or,$(1),$(2))\
	),\
	$(call .and,\
		$(call .in,$(1),$(2)),\
		$(call .in,$(2),$(1))\
	)\
)

.neq			=\
$(.debug.2)\
$(call .not,\
	$(call .eq,$(1),$(1))\
)

.rm.suffix		=\
$(.debug.2)\
$(patsubst %$(strip $(1)),%,$(strip $(2)))

.rm.prefix		=\
$(.debug.2)\
$(patsubst $(strip $(1))%,%,$(strip $(2)))

.fix.dir		=\
$(.debug.1)\
$(call .rm.suffix,$(.slash),$(1))

.dir			=\
$(.debug.1)\
$(call .fix.dir,$(dir $(strip $(1))))

.notdir			=\
$(.debug.1)\
$(notdir $(call .fix.dir,$(strip $(1))))

.math			=\
$(.debug.2)\
$(shell echo $$(( $(1) )) )

.add			=\
$(.debug.2)\
$(call .math,$(1) + $(2))

.sub			=\
$(.debug.2)\
$(call .math,$(1) - $(2))

.mul			=\
$(.debug.2)\
$(call .math,$(1) * $(2))

.div			=\
$(.debug.2)\
$(call .math,$(1) / $(2))

.mod			=\
$(.debug.2)\
$(call .math,$(1) % $(2))

.neg			=\
$(.debug.1)\
$(call .math, - $(1))

.neg.is.0		=\
$(.debug.1)\
$(call .math,\
	( $$(( X = $(1) )) > 0 ) ? X : 0 \
)

.words			=\
$(.debug.1)\
$(words $(strip $(1)))

.size			=\
$(.debug.1)\
$(call .words,$(1))

.word			=\
$(.debug.2)\
$(word $(strip $(1)),$(strip $(2)))

.at			=\
$(.debug.2)\
$(call .word,$(1),$(2))

.wordlist		=\
$(.debug.3)\
$(wordlist $(strip $(1)),$(strip $(2)),$(strip $(3)))

.slice			=\

.firstword		=\
$(.debug.1)\
$(firstword $(strip $(1)))

.front			=\
$(.debug.1)\
$(call .firstword,$(1))

.lastword		=\
$(.debug.1)\
$(lastword $(strip $(1)))

.back			=\
$(.debug.1)\
$(call .lastword,$(1))

.pop.front		=\
$(.debug.1)\
$(call .slice,1,-2,$(1))

.pop.back		=\
$(.debug.1)\
$(call .slice,2,-1,$(1))

.foreach		=\
$(.debug.3)\
$(foreach $(strip $(1)),$(strip $(3)),$(strip $(3)))

.map			=\
$(.debug.2)\
$(call .foreach,.arg.1,$(2),$(call $(strip $(3)),$(.arg.1)))

.zip			=\

.reduce			=\

.reverse		=\
$(.debug.1)\

.sort			=\
$(.debug.1)\
$(sort $(strip $(1)))

.unique			=\
$(.debug.1)\
$(call .sort,$(1))


# Return LIST without its last N items
.pop.list.N\
=$(wordlist \
	1,\
	$(call .neg.is.0,\
		$(call .sub,\
			$(words $(1)),\
			$(2)\
		)\
	)\
)


.assert.value		:=
.assert.error		:=
.assert			=\
$(.debug.2)\
$(eval .assert.value:=$$(strip $$(1)))\
$(eval .assert.error:=$$(strip $$(2)))\
$(if $(.assert.value),,include FAIL $(eval $$(error $(.assert.error))))

.assert.needle		:=
.assert.haystack	:=
.assert.in		=\
$(.debug.3)\
$(eval .assert.needle:=$$(strip $$(1)))\
$(eval .assert.haystack:=$$(strip $$(2)))\
$(call .assert,\
	$(call .in,\
		$(.assert.needle),\
		$(.assert.haystack)\
	),\
	$(3)\
)

.assert.expect		:=
.assert.actual		:=
.assert.eq		=\
$(.debug.3)\
$(eval .assert.expect:=$$(strip $$(1)))\
$(eval .assert.actual:=$$(strip $$(1)))\
$(call .assert,\
	$(call .eq,\
		$(.assert.expect),\
		$(.assert.actual)\
	),\
	$(3)\
)


##############################################################################
# Include Guard

.include.guard.list	=

.include.guard.start	=\
$(eval .include.guard.list+=)\
$(eval undefine FIRST_INCLUDE)\

.include.guard.stop	=\

##############################################################################
# Test for modern GNU Make
.test.feature		=\
$(.debug.1)\
$(call .assert.in,\
	$(1),\
	$(.FEATURES),\
	Feature '$$(.assert.needle)' missing: Please use a modern GNU Make\
)

$(call .test.feature, else-if )
$(call .test.feature, target-specific )
$(call .test.feature, order-only )
$(call .test.feature, second-expansion )
$(call .test.feature, archives )
$(call .test.feature, jobserver )
$(call .test.feature, check-symlink )
##############################################################################

#ifndef INCLUDE.main.mk
#INCLUDE.main.mk		:=$(lastword $(MAKEFILE_LIST))

# Fix builtin's
.subst			=$(subst $(strip $(1)),$(strip $(2)),$(strip $(3)))
.patsubst		=$(patsubst $(strip $(1)),$(strip $(2)),$(strip $(3)))
.filter			=\
$(filter $(strip $(1)),$(strip $(2)))
.filter-out		=\
$(filter-out $(strip $(1)),$(strip $(2)))
.suffix			=\
$(suffix $(strip $(1)))
.basename		=\

.addsuffix		=\

.addprefix		=\

.join			=\

.wildcard		=\

.realpath		=\

.abspath		=\

.get.user		=\
$(or\
	$(LOGNAME),\
	$(USER),\
	$(LNAME),\
	$(USERNAME),\
	$(shell whoami 2>/dev/null ),\
	$(shell id -u -n 2>/dev/null ),\
	$(shell who am i 2>/dev/null )\
)
.get.home		=\
$(or\
	$(HOME),\
	$(shell cd 2>/dev/null && pwd )\
)
.get.tmp		=\
$(or\
	$(TMPDIR),\
	$(TEMP),\
	$(TMP),\
	/tmp \
)

.rm.mk			=$(patsubst %.mk,%,$(1))

.get.list.from.dir\
=$(call .rm.prefix,$(1)/,$(call .rm.mk,\
)


####

# Name of Makefile including current Makefile
my.MAKEFILE_LIST	=$(MAKEFILE_LIST)
my.pop.MAKEFILE_LIST	=$(call .pop.list,$(my.MAKEFILE_LIST))
my.last.MAKEFILE	=$(lastword $(my.pop.MAKEFILE_LIST))

.esc.name\
=$(subst $(slash),$(under),$(subst $(dot),$(under),$(1)))


# Stack of Makefiles who use include guard
this.MAKEFILE_LIST	:=
this.pop.MAKEFILE_LIST	=$(call .pop.list,$(this.MAKEFILE_LIST))
this.MAKEFILE		=$(lastword $(this.MAKEFILE_LIST))
this.abs.MAKEFILE	=$(abspath $(this.MAKEFILE))
this.mk.MAKEFILE	=$(patsubst $(mk)/%,%,$(this.abs.MAKEFILE))
this.esc.MAKEFILE	=$(call .esc.name,$(this.mk.MAKEFILE))
this.include.marker	=$(this.esc.MAKEFILE).INCLUDE
this.real.MAKEFILE	=$(realpath $(this.MAKEFILE))
this.name.MAKEFILE	=$(call .not.dir,$(this.MAKEFILE))
this			=$(call .rm.mk,$(this.name.MAKEFILE))

.set.this.include.marker\
=$(eval $(this.include.marker):=$$(this.real.MAKEFILE))
.set.FIRST_INCLUDE	=$(eval FIRST_INCLUDE:=yes)
.unset.FIRST_INCLUDE	=$(eval undefine FIRST_INCLUDE)
.stop.rule.search	=$(eval $$(this.MAKEFILE):: ;)

.push.this.MAKEFILE_LIST=$(eval this.MAKEFILE_LIST+=$(1))
.pop.this.MAKEFILE_LIST\
=$(eval this.MAKEFILE_LIST:=$$(this.pop.MAKEFILE_LIST))

guard			=$(mk)/config.mk
end_guard		=$(call .pop.this.MAKEFILE_LIST)

my.MAKEFILE		=$(firstword $(MAKEFILE_LIST))
my.abs.MAKEFILE		=$(abspath $(my.MAKEFILE))
my.real.MAKEFILE	=$(realpath $(my.MAKEFILE))
my.name.MAKEFILE	=$(call .not.dir,$(my.MAKEFILE))


##############################################################################
endif # INCLUDE.func.mk

##############################################################################
# Setup Include Guard for including Makefile  "Quis custodiet ipsos custodes?"
##############################################################################
$(call .push.this.MAKEFILE_LIST,$(my.last.MAKEFILE))

$(call .unset.FIRST_INCLUDE)

ifndef $(this.include.marker)
$(call .set.this.include.marker)

$(call .set.FIRST_INCLUDE)

$(call .stop.rule.search)
endif # end Include Guard setup for including Makefile
##############################################################################
