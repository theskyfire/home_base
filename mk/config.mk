##############################################################################
# Configuration
##############################################################################
# Include Guard
ifndef INCLUDE_config_mk
INCLUDE_config_mk	:=$(abspath $(lastword $(MAKEFILE_LIST)))
##############################################################################
# MAKE commandline overrides

# Location of HomeBase
BASE_NAME		=base
BASE			=$(HOME)/$(BASE_NAME)

TMP_BASE_NAME		=$(USER).$(BASE_NAME)
TMP			=/tmp
TMP_BASE		=$(TMP)/$(TMP_BASE_NAME)

# Path to "common" dir.  $(BASE_DIR)/common is a symlink to this location.
COMMON_NAME		=common
COMMON			=$(patsubst %/,%,$(dir $(realpath $(MY_MAKEFILE))))

# Temporary files
TMP_NAME		=tmp
TMPDIR			=$(BASE_DIR)/$(TMP_NAME)

# Build Root
BUILD_NAME		=build
BUILDDIR		=$(TMPDIR)/$(BUILD_NAME)

# Names
BIN_NAME		=bin
SBIN_NAME		=sbin
LIBEXEC_NAME		=libexec
SHARE_NAME		=share
ETC_NAME		=etc
COM_NAME		=com
VAR_NAME		=var
INCLUDE_NAME		=include
DOC_NAME		=doc
INFO_NAME		=info
LIB_NAME		=lib
LOCALE_NAME		=locale
SRC_NAME		=src
MAN_NAME		=man
##############################################################################

# Include Guard
GUARD			=$(MK_DIR)/guard.mk
END_GUARD		=$(MK_DIR)/end_guard.mk

# Projects
PRJ_DIR			=$(MK_DIR)/prj
MK_PRJS			:=$(wildcard $(PRJ_DIR)/*.mk)
PRJS			:=$(patsubst $(PRJ_DIR)/%.mk,%,$(MK_PRJS))
PRJ_TMPL		=$(PRJ_DIR)/prj.tmpl
END_PRJ_TMPL		=$(PRJ_DIR)/end_prj.tmpl

# Stages
STAGE_DIR		=$(MK_DIR)/stage
MK_STAGES		:=$(wildcard $(STAGE_DIR)/*.mk)
STAGES			:=$(patsubst $(STAGE_DIR)/%.mk,%,$(MK_STAGES))
STAGE_TMPL		=$(STAGE_DIR)/stage.tmpl
END_STAGE_TMPL		=$(STAGE_DIR)/end_stage.tmpl

##############################################################################
# Make Settings

# Set Default Goal
.DEFAULT_GOAL		=install

# only build serially
.NOTPARALLEL:

# Expand rules twice
.SECONDEXPANSION:

# all lines of a recipe are exec'ed by the same shell instance
# beware lines starting with '@' '-' '+'
.ONESHELL:

# MY_SHELL
MY_SHELL_CMD		=bash
MY_MAKE_CMD		=make

# use MY_SHELL
SHELL		=$(firstword $(wildcard $(MY_SHELL) /bin/bash /bin/sh))

# exit recipe shell on error if using bash
.SHELLFLAGS	=$(if $(findstring bash,$(SHELL)),-exc,-c)

##############################################################################
# Functions

# No Op
NOP			=true

# Return LIST without its last N items
POP_LIST_N		=$(wordlist 1,$(shell echo "$$(( $$(( X = $(words $(1)) - $(2) )) >=0 ? X : 0))" ),$(1))
POP_LIST		=$(call POP_LIST_N,$(1),1)

# Generate Include Marker for given makefile
GET_MARKER		=$(subst /,_,$(subst .,_,$(patsubst $(MK_DIR)/%,%,$(abspath $(1)))))

# Name of Makefile including current Makefile
INCLUDING_MAKEFILE	=$(lastword $(call POP_LIST_N,$(MAKEFILE_LIST),$(1)))
ORIG_INCLUDING_MAKEFILE	=$(lastword $(call POP_LIST_N,$(MAKEFILE_LIST),$(1)))

##############################################################################
# Default Make Configuration
##############################################################################

# This file
MY_MAKEFILE		=$(firstword $(MAKEFILE_LIST))

# Name of GNU Make command
MY_MAKE_CMD		=make

# Temp MAKE for bootstrap
TMP_MAKE_DIR		=/tmp/homebase
TMP_MAKE		=$(TMP_MAKE_DIR)/$(BASE)/bin/$(MY_MAKE_CMD)

# HomeBase MAKE
BASE_MAKE		=$(BASE)/$(BIN_NAME)/$(MY_MAKE_CMD)

# Select best Make
MY_MAKE			=$(firstword $(wildcard $(BASE_MAKE) $(TMP_MAKE)) $(MAKE))

# My MAKE Options
#MY_MAKE_OPTS		=
#MY_MAKE_OPTS		+=--print-directory
#MY_MAKE_OPTS		+=--no-builtin-variables
#MY_MAKE_OPTS		+=--no-builtin-rules
#MY_MAKE_OPTS		+=--warn-undefined-variables
#MY_MAKE_OPTS		+=--debug=a
#MY_MAKE_OPTS		+=--print-data-base
MY_MAKEFLAGS		=
MY_MAKEFLAGS		+=--warn-undefined-variables

# Debug MAKE
DEBUG			=
ifneq (,$(DEBUG))
MY_MAKEFLAGS		+=-wRrpd
else
MY_MAKEFLAGS		+=-wRr
endif

# MAKE working dir
MY_CURDIR		=-C $(CURDIR)

# MAKE Goals
ifdef MAKECMDGOALS
MY_GOALS		=$(foreach goal,$(MAKECMDGOALS),'$(goal)')
else
MY_GOALS		='$(.DEFAULT_GOAL)'
endif
MY_MAKE_GOALS		=$(subst 'bootstrap',,$(MY_GOALS))

# Commandline Variable Overrides
MY_OVERRIDES		=$(MAKEOVERRIDES)

# MAKE's Environment
MY_MAKE_ENV		=
MY_MAKE_ENV		+=MAKELEVEL=0
MY_MAKE_ENV		+=MAKEFLAGS=''
MY_MAKE_ENV		+=MAKEOVERRIDES=''

MAKE_BOOT		=$(MY_MAKE_ENV)
MAKE_BOOT		+=$(MY_MAKE)
MAKE_BOOT		+=-f '$(MY_MAKEFILE)'
MAKE_BOOT		+=$(MY_MAKEFLAGS)
MAKE_BOOT		+=$(MY_CURDIR)
MAKE_BOOT		+=$(MY_MAKE_GOALS)
MAKE_BOOT		+=$(MY_OVERRIDES)

##############################################################################
# Stop rebuild of Config Makefile
$(lastword $(MAKEFILE_LIST)): ;

endif # END Include Guard
