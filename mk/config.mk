##############################################################################
# Configuration
##############################################################################
ifndef config_mk.INCLUDE
config_mk.INCLUDE	:=$(realpath $(lastword $(MAKEFILE_LIST)))
##############################################################################
# Set a trap for versions of make that don't support .DEFAULT_GOAL
.TRAP: FORCE
	@echo "Error: Please use a modern version of GNU Make!" >&2
	exit 1

FORCE:

# stop implicit rule search for this makefile
$(lastword $(MAKEFILE_LIST)): ;
##############################################################################
# Functions

comma			:=,
empty			:=
space			:=$(empty) $(empty)
slash			:=/
dot			:=.
under			:=_
nop			:=true

# Test for GNU Make feature
.test.make.for\
=$(if\
	$(findstring $(1),$(.FEATURES)),\
	$(empty),\
	$(warning Missing '$(1)': please use a modern version of GNU Make!)\
)

# Fix dir/notdir
.rm.slash		=$(patsubst %/,%,$(1))
.dir			=$(call .rm.slash,$(dir $(1)))
.not.dir		=$(notdir $(call .rm.slash,$(1)))
.rm.mk			=$(patsubst %.mk,%,$(1))

# Return LIST without its last N items
.pop.list.N\
=$(wordlist \
	1,\
	$(shell echo \
		"$$(( $$(( X = - $(2) + $(words $(1)) )) >=0 ? X : 0))"\
	),\
	$(1)\
)
.pop.list		=$(call .pop.list.N,$(1),1)

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
.stop.rule.search	=$(eval $$(this.MAKEFILE): ;)

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
# Test for modern GNU Make
$(call .test.make.for,else-if)
$(call .test.make.for,target-specific)
$(call .test.make.for,order-only)
$(call .test.make.for,second-expansion)
$(call .test.make.for,archives)
$(call .test.make.for,jobserver)
$(call .test.make.for,check-symlink)

# Require .DEFAULT_GOAL
ifndef .DEFAULT_GOAL
$(error Please use a modern version of GNU Make!)
endif

# only build serially
.NOTPARALLEL:

# Expand rules twice
.SECONDEXPANSION:

##############################################################################
# MAKE commandline overrides

USER			?=$(shell whoami)
HOME			?=$(shell cd ; pwd)
TMPDIR			?=/tmp

BASE			=$(HOME)/base
COMMON			=$(call .dir,$(call .dir,$(my.real.MAKEFILE)))
TMP_BASE		=$(TMPDIR)/homebase.$(USER)

##############################################################################
# Generated Paths

dirs			 =base
dirs			+=common
dirs			+=mk
dirs			+=stage
dirs			+=prj
dirs			+=tmp_base
dirs			+=tmp
dirs			+=build
dirs			+=src
dirs			+=bin
dirs			+=sbin
dirs			+=libexec
dirs			+=lib
dirs			+=etc
dirs			+=share
dirs			+=com
dirs			+=var
dirs			+=include
dirs			+=doc
dirs			+=info
dirs			+=man
dirs			+=locale

lnks			 =common
lnks			+=mk
lnks			+=src
lnks			+=com
lnks			+=share
lnks			+=man
lnks			+=GNUmakefile

# x.DIR_NAME=x / x.LNK_NAME=x
$(foreach d,$(dirs),$(eval $(d).DIR_NAME:=$(d)))
$(foreach l,$(lnks),$(eval $(l).LNK_NAME:=$(l)))
base.DIR_NAME		=$(call .not.dir,$(BASE))
common.DIR_NAME		=$(call .not.dir,$(COMMON))
tmp_base.DIR_NAME	=$(call .not.dir,$(TMP_BASE))

# Root directories
base.DIR_ROOT		=$(call .dir,$(BASE))
common.DIR_ROOT		=$(call .dir,$(COMMON))
mk.DIR_ROOT		=$(common.DIR)
stage.DIR_ROOT		=$(mk.DIR)
prj.DIR_ROOT		=$(mk.DIR)
tmp_base.DIR_ROOT	=$(call .dir,$(TMP_BASE))
tmp.DIR_ROOT		=$(base.DIR)
build.DIR_ROOT		=$(tmp.DIR)
src.DIR_ROOT		=$(common.DIR)
include.DIR_ROOT	=$(base.DIR)
bin.DIR_ROOT		=$(base.DIR)
sbin.DIR_ROOT		=$(base.DIR)
libexec.DIR_ROOT	=$(base.DIR)
lib.DIR_ROOT		=$(base.DIR)
etc.DIR_ROOT		=$(base.DIR)
com.DIR_ROOT		=$(common.DIR)
var.DIR_ROOT		=$(base.DIR)
share.DIR_ROOT		=$(common.DIR)
doc.DIR_ROOT		=$(share.LNK)
info.DIR_ROOT		=$(share.LNK)
locale.DIR_ROOT		=$(share.LNK)
man.DIR_ROOT		=$(share.LNK)

# Just so happens all links are under base.DIR
$(foreach l,$(lnks),$(eval $(l).LNK_ROOT=$$(base.DIR)))

# x.DIR=x.DIR_ROOT/x.DIR_NAME / x.LNK=x.LNK_ROOT/x.LNK_NAME
$(foreach d,$(dirs),\
	$(eval $(d).DIR=$(value $(d).DIR_ROOT)/$(value $(d).DIR_NAME))\
)
$(foreach d,$(dirs),$(eval $(d).LNK=))
$(foreach l,$(lnks),\
	$(eval $(l).LNK=$(value $(l).LNK_ROOT)/$(value $(l).LNK_NAME))\
)

# Symlink Prerequisites
$(common.LNK):		| $(common.DIR)
$(mk.LNK):		| $(common.LNK) $(mk.DIR)
$(src.LNK):		| $(common.LNK) $(src.DIR)
$(com.LNK):		| $(common.LNK) $(com.DIR)
$(share.LNK):		| $(common.LNK) $(share.DIR)
$(man.LNK):		| $(share.LNK) $(man.DIR)
$(GNUmakefile.LNK):	| $(mk.LNK)

# Symlink Targets
common.LNK_TARGET	=$(common.DIR_ROOT)/$(common.DIR_NAME)
mk.LNK_TARGET		=$(common.LNK_NAME)/$(mk.DIR_NAME)
src.LNK_TARGET		=$(common.LNK_NAME)/$(src.DIR_NAME)
com.LNK_TARGET		=$(common.LNK_NAME)/$(com.DIR_NAME)
share.LNK_TARGET	=$(common.LNK_NAME)/$(share.DIR_NAME)
man.LNK_TARGET		=$(share.LNK_NAME)/$(man.DIR_NAME)
GNUmakefile.LNK_TARGET	=$(mk.LNK_NAME)/main.mk

# The prefered path for an item (either x.DIR or x.LNK)
$(foreach d,$(dirs),$(eval $(d)=$$(or $$($(d).LNK),$$($(d).DIR))))
mk			=$(mk.DIR)

bootstrap.mk		=$(mk)/boot.mk
stages.mk		:=$(wildcard $(stage)/*.mk)
stages			:=$(patsubst $(stage)/%.mk,%,$(stages.mk))
stage.tmpl		=$(stage)/stage.tmpl
prjs.mk			:=$(wildcard $(prj)/*.mk)
prjs			:=$(patsubst $(prj)/%.mk,%,$(prjs.mk))
prj.tmpl		=$(prj)/prj.tmpl

dirs.EXPAND		=$(foreach d,$(dirs),$($(d).DIR))
lnks.EXPAND		=$(foreach l,$(lnks),$($(l).LNK))

src.DIRS		=$(foreach p,$(prjs),$(src)/$(p))
build.DIRS		=$(foreach p,$(prjs),$(build)/$(p))

# add $(base) checks
.PHONY: base_checks
#$(base_DIR):		base_checks
base_checks:
	[ -r '$(my.MAKEFILE)' ]
	[ ! -e '$(base.DIR)' ]
	[ -d '$(common.DIR)' ]

# Create Directories
dirs.MODE		=0710
.PRECIOUS: $(src.DIRS) $(build.DIRS)
$(dirs.EXPAND) $(src.DIRS) $(build.DIRS): | $$(@D)
	[ -d '$(@)' ] || mkdir -v --mode='$(dirs.MODE)' '$(@)'

# Create Symlinks
$(foreach l,$(lnks),$(eval $$($(l).LNK): TARGET=$$($(l).LNK_TARGET)))
$(lnks.EXPAND): | $$(@D)
	ln -vsT '$(TARGET)' '$(@)'

# Create src and build sub-dirs as needed
#.PRECIOUS: $(src)/% $(build)/%
#$(src)/%: | $$(@D)
#	[ -d '$(@)' ] || mkdir -v --mode='$(dirs.MODE)' '$(@)'

#$(build)/%: | $$(@D)
#	[ -d '$(@)' ] || mkdir -v --mode='$(dirs.MODE)' '$(@)'

##############################################################################
# Shell Configuration

my.SHELL_CMD		=bash
tmp.SHELL		=$(tmp_base)/$(bin)/$(my.SHELL_CMD)
base.SHELL		=$(bin)/$(my.SHELL_CMD)
my.SHELL		=$(firstword \
	$(wildcard $(base.SHELL) $(tmp.SHELL)) /bin/bash /bin/sh \
)
is.bash			=$(findstring bash,$(my.SHELL))
my.SHELLFLAGS		=$(if $(is.bash),-ec,-c)

SHELL			:=$(my.SHELL)
.SHELLFLAGS		:=$(my.SHELLFLAGS)

# all lines of a recipe are exec'ed by the same shell instance
# beware lines starting with '@' '-' '+'
$(and $(is.bash), .ONESHELL:)

##############################################################################
# Make Configuration

my.MAKE_CMD		=make
tmp.MAKE		=$(tmp_base)/$(bin)/$(my.MAKE_CMD)
base.MAKE		=$(bin)/$(my.MAKE_CMD)
my.MAKE			=$(firstword \
	$(wildcard $(base.MAKE) $(tmp.MAKE)) $(MAKE)\
)
my.MAKEFLAGS		=
my.MAKEFLAGS		+=--warn-undefined-variables
my.MAKEFLAGS		+=$(if $(DEBUG),-wRrpd,-wRr)
my.CURDIR		=-C $(CURDIR)
my.MAKECMDGOALS		=$(subst 'bootstrap',,\
	$(foreach goal,$(or $(MAKECMDGOALS),$(.DEFAULT_GOAL)),'$(goal)')\
)
define EscGoals =
{ 
	shopt -s extglob ;
	goals='  $(strip $(or $(MAKECMDGOALS),$(.DEFAULT_GOAL)))' ;
	while [[ -n "$${goals}" ]]; do
		goals="$${goals##+( )}" ;
		if [[ "$${goals}" =~ ^[^\(\ ]+\   ]]; then
			cmd="'$${BASH_REMATCH[0]}'"
			goals=' ' ;
		else
			cmd="'$${goals}'"
			goals='' ;
		fi ;
	done ;
	echo "$${cnd}" ;
}
endef
#my.MAKECMDGOALS		:=$(shell $(EscGoals))
my.MAKEOVERRIDES	=$(MAKEOVERRIDES)
my.MAKE_ENV		=
my.MAKE_ENV		+=MAKELEVEL=0
my.MAKE_ENV		+=MAKEFLAGS=''
my.MAKE_ENV		+=MAKEOVERRIDES=''

bootstrap		 =$(my.MAKE_ENV)
bootstrap		+=$(my.MAKE)
bootstrap		+=-f '$(my.MAKEFILE)'
bootstrap		+=$(my.MAKEFLAGS)
bootstrap		+=$(my.CURDIR)
bootstrap		+=$(my.MAKECMDGOALS)
bootstrap		+=$(my.MAKEOVERRIDES)

$(MAKE)			=$(my.MAKE)

# Set Default Goal
.DEFAULT_GOAL		=install

##############################################################################
endif # END Include Guard
##############################################################################


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
