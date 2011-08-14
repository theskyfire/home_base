##############################################################################
# Configuration
##############################################################################
ifndef INCLUDE_config_mk
INCLUDE_config_mk	:=$(abspath $(lastword $(MAKEFILE_LIST)))
##############################################################################
# Set a trap for versions of make that don't support .DEFAULT_GOAL
_TRAP_: FORCE
	@echo "Error: Please use a modern version of GNU Make!" >&2
	exit 1

# Define FORCE target
.PHONY: _TRAP_ FORCE
FORCE:

##############################################################################
# Functions

comma			:=,
empty			:=
space			:=$(empty) $(empty)
slash			:=/
dot			:=.
under			:=_

TestMakeFor		=$(if\
	$(findstring $(1),$(.FEATURES)),\
	$(empty),\
	$(warning Missing '$(1)': please use a modern version of GNU Make!)\
)

# No Op
Nop			=true

# Fix dir/notdir
Dir			=$(patsubst %/,%,$(dir $(1)))
NotDir			=$(notdir $(patsubst %/,%,$(1)))

# Return LIST without its last N items
PopList_N		=$(wordlist \
	1,\
	$(shell echo "$$(( $$(( X = - $(2) + $(words $(1)) )) >=0 ? X : 0))" ),\
	$(1)\
)
PopList			=$(call PopList_N,$(1),1)

# Generate Include Marker for given makefile
GetMarker		=$(subst /,_,$(subst .,_,$(patsubst $(MK_PATH)/%,%,$(abspath $(1)))))

# Name of Makefile including current Makefile
OrigIncludingMakefile	=$(lastword $(call PopList,$(MAKEFILE_LIST)))
IncludingMakefile	=$(OrigIncludingMakefile)

IncludeMarker		=INCLUDE_$(subst $(slash),$(under),$(strip \
	$(subst $(dot),$(under),$(strip \
		$(patsubst $(mk_PATH)/%,%,$(abspath $(this_MAKEFILE)))\
	))\
))

# Stack of Makefiles who use include guard
this_MAKEFILE_LIST	:=

# this_MAKEFILE valid between "include $(guard)" and "include $(end_guard)"
this_MAKEFILE		=$(lastword $(this_MAKEFILE_LIST))

# Set "this" for stage and prj Makefiles
this			=$(patsubst %.mk,%,$(call NotDir,$(this_MAKEFILE)))

guard			=$(mk_PATH)/config.mk
end_guard		=\
$(eval $$(warning <$$(this_MAKEFILE_LIST)>))\
$(eval \
	this_MAKEFILE_LIST:=$$(call PopList,$$(this_MAKEFILE_LIST))\
)\
$(eval $$(warning <$$(this_MAKEFILE_LIST)>))

my_MAKEFILE		=$(firstword $(MAKEFILE_LIST))
##############################################################################
# Test for modern GNU Make
$(call TestMakeFor,else-if)
$(call TestMakeFor,target-specific)
$(call TestMakeFor,order-only)
$(call TestMakeFor,second-expansion)
$(call TestMakeFor,archives)
$(call TestMakeFor,jobserver)
$(call TestMakeFor,check-symlink)

# Require .DEFAULT_GOAL
ifndef .DEFAULT_GOAL
$(error Please use a modern version of GNU Make!)
endif

##############################################################################
# MAKE commandline overrides

USER			?=$(shell whoami)
HOME			?=$(shell cd ; pwd)
TMPDIR			?=/tmp

BASE			=$(HOME)/base
COMMON			=$(call Dir,$(call Dir,$(realpath $(my_MAKEFILE))))
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

# dir_DIR_NAME=dir
$(foreach d,$(dirs),$(eval $(d)_DIR_NAME:=$(d)))

# lnk_LNK_NAME=lnk
$(foreach l,$(lnks),$(eval $(l)_LNK_NAME:=$(l)))

# override
base_DIR_NAME		=$(call NotDir,$(BASE))
common_DIR_NAME		=$(call NotDir,$(COMMON))
tmp_base_DIR_NAME	=$(call NotDir,$(TMP_BASE))

# Root directories
base_DIR_ROOT		=$(call Dir,$(BASE))
common_DIR_ROOT		=$(call Dir,$(COMMON))
mk_DIR_ROOT		=$(common_DIR)
stage_DIR_ROOT		=$(mk_PATH)
prj_DIR_ROOT		=$(mk_PATH)
tmp_base_DIR_ROOT	=$(call Dir,$(TMP_BASE))
tmp_DIR_ROOT		=$(base_PATH)
build_DIR_ROOT		=$(tmp_PATH)
src_DIR_ROOT		=$(common_DIR)
include_DIR_ROOT	=$(base_PATH)
bin_DIR_ROOT		=$(base_PATH)
sbin_DIR_ROOT		=$(base_PATH)
libexec_DIR_ROOT	=$(base_PATH)
lib_DIR_ROOT		=$(base_PATH)
etc_DIR_ROOT		=$(base_PATH)
com_DIR_ROOT		=$(common_DIR)
var_DIR_ROOT		=$(base_PATH)
share_DIR_ROOT		=$(common_DIR)
doc_DIR_ROOT		=$(share_PATH)
info_DIR_ROOT		=$(share_PATH)
locale_DIR_ROOT		=$(share_PATH)
man_DIR_ROOT		=$(share_PATH)

common_LNK_ROOT		=$(base_PATH)
mk_LNK_ROOT		=$(base_PATH)
src_LNK_ROOT		=$(base_PATH)
com_LNK_ROOT		=$(base_PATH)
share_LNK_ROOT		=$(base_PATH)
man_LNK_ROOT		=$(base_PATH)
GNUmakefile_LNK_ROOT	=$(base_PATH)

$(foreach d,$(dirs),\
	$(eval $(d)_DIR=$(value $(d)_DIR_ROOT)/$(value $(d)_DIR_NAME))\
)
$(foreach l,$(lnks),\
	$(eval $(l)_LNK=$(value $(l)_LNK_ROOT)/$(value $(l)_LNK_NAME))\
)

common_LNK_TARGET	=$(common_DIR_ROOT)/$(common_DIR_NAME)
mk_LNK_TARGET		=$(common_LNK_NAME)/$(mk_DIR_NAME)
src_LNK_TARGET		=$(common_LNK_NAME)/$(src_DIR_NAME)
com_LNK_TARGET		=$(common_LNK_NAME)/$(com_DIR_NAME)
share_LNK_TARGET	=$(common_LNK_NAME)/$(share_DIR_NAME)
man_LNK_TARGET		=$(share_LNK_NAME)/$(man_DIR_NAME)
GNUmakefile_LNK_TARGET	=$(mk_LNK_NAME)/main.mk

# Locations
base_PATH		=$(base_DIR)
common_PATH		=$(common_LNK)
mk_PATH			=$(mk_DIR)
stage_PATH		=$(stage_DIR)
prj_PATH		=$(prj_DIR)
tmp_base_PATH		=$(tmp_base_DIR)
tmp_PATH		=$(tmp_DIR)
build_PATH		=$(build_DIR)
src_PATH		=$(src_LNK)
include_PATH		=$(include_DIR)
bin_PATH		=$(bin_DIR)
sbin_PATH		=$(sbin_DIR)
libexec_PATH		=$(libexec_DIR)
lib_PATH		=$(lib_DIR)
etc_PATH		=$(etc_DIR)
com_PATH		=$(com_LNK)
var_PATH		=$(var_DIR)
share_PATH		=$(share_LNK)
doc_PATH		=$(doc_DIR)
info_PATH		=$(info_DIR)
locale_PATH		=$(locale_DIR)
man_PATH		=$(man_DIR)

##############################################################################
# Make Configuration

my_MAKE_CMD		=make
tmp_MAKE		=$(tmp_base_PATH)/$(bin_PATH)/$(my_MAKE_CMD)
base_MAKE		=$(bin_PATH)/$(my_MAKE_CMD)
my_MAKE			=$(firstword \
	$(wildcard $(base_MAKE) $(tmp_MAKE)) $(MAKE)\
)
my_MAKEFLAGS		=
my_MAKEFLAGS		+=--warn-undefined-variables
my_MAKEFLAGS		+=$(if $(DEBUG),-wRrpd,-wRr)
my_CURDIR		=-C $(CURDIR)
my_MAKECMDGOALS		=$(subst 'bootstrap',,\
	$(foreach goal,$(or $(MAKECMDGOALS),$(.DEFAULT_GOAL)),'$(goal)')\
)
my_MAKEOVERRIDES	=$(MAKEOVERRIDES)
my_MAKE_ENV		=
my_MAKE_ENV		+=MAKELEVEL=0
my_MAKE_ENV		+=MAKEFLAGS=''
my_MAKE_ENV		+=MAKEOVERRIDES=''

bootstrap		 =$(my_MAKE_ENV)
bootstrap		+=$(my_MAKE)
bootstrap		+=-f '$(my_MAKEFILE)'
bootstrap		+=$(my_MAKEFLAGS)
bootstrap		+=$(my_CURDIR)
bootstrap		+=$(my_MAKECMDGOALS)
bootstrap		+=$(my_MAKEOVERRIDES)

$(MAKE)			=$(my_MAKE)

# Set Default Goal
.DEFAULT_GOAL		=install

# only build serially
.NOTPARALLEL:

# Expand rules twice
.SECONDEXPANSION:

##############################################################################
# Shell Configuration

my_SHELL_CMD		=bash
tmp_SHELL		=$(tmp_base_PATH)/$(bin_PATH)/$(my_SHELL_CMD)
base_SHELL		=$(bin_PATH)/$(my_SHELL_CMD)
my_SHELL		=$(firstword \
	$(wildcard $(base_SHELL) $(tmp_SHELL)) /bin/bash /bin/sh \
)
my_SHELLFLAGS		=$(if $(findstring bash,$(my_SHELL)),-exc,-c)

SHELL			=$(my_SHELL)
.SHELLFLAGS		=$(my_SHELLFLAGS)

# all lines of a recipe are exec'ed by the same shell instance
# beware lines starting with '@' '-' '+'
$(and $(findstring bash,$(my_SHELL)), .ONESHELL:)

##############################################################################
# Bootstrap
bootstrap_mk		=$(mk_PATH)/boot.mk

# Stages
stages_mk		:=$(wildcard $(stage_PATH)/*.mk)
stages			:=$(patsubst $(stage_PATH)/%.mk,%,$(stages_mk))
stage_tmpl		=$(stage_PATH)/stage.tmpl
end_stage_tmpl		=$(stage_PATH)/end_stage.tmpl

# Projects
prjs_mk			:=$(wildcard $(prj_PATH)/*.mk)
prjs			:=$(patsubst $(prj_PATH)/%.mk,%,$(prjs_mk))
prj_tmpl		=$(prj_PATH)/prj.tmpl
end_prj_tmpl		=$(prj_PATH)/end_prj.tmpl
##############################################################################
# URL's
#gnu_url			=ftp://ftp.gnu.org/pub/gnu
gnu_url			=http://mirrors.kernel.org/gnu
##############################################################################
$(lastword $(MAKEFILE_LIST)): ;
endif # END Include Guard
##############################################################################
# Include Guard   "Quis custodiet ipsos custodes?"
##############################################################################
# Append calling makefile to THIS_MAKEFILE_LIST
$(warning [$(this_MAKEFILE_LIST)])
this_MAKEFILE_LIST	+=$(IncludingMakefile)
$(warning [$(this_MAKEFILE_LIST)])

# Undefine FIRST_INCLUDE NOTE: only use directly after including this file
undefine FIRST_INCLUDE

# This is first include
ifndef $(IncludeMarker)

# Set INCLUDE_foo_mk = /Full/Path/To/mk/foo.mk
$(IncludeMarker)	:=$(abspath $(this_MAKEFILE))

# Define FIRST_INCLUDE on first include
FIRST_INCLUDE		=yes

# Stop implicit rule search for including Makefile
$(this_MAKEFILE): ;

endif # end Include Guard setup for including Makefile
##############################################################################
