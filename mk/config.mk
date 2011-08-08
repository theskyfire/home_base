##############################################################################
# Configuration
##############################################################################

# Set Default Goal
.DEFAULT_GOAL		=install

# only build serially
.NOTPARALLEL:

# Expand rules twice
.SECONDEXPANSION:

# all lines of a recipe are exec'ed by the same shell instance
# beware lines starting with '@' '-' '+'
.ONESHELL:

# use MY_SHELL
SHELL		=$(firstword $(wildcard $(MY_SHELL) /bin/bash /bin/sh))

# exit recipe shell on error if using bash
.SHELLFLAGS	=$(if $(findstring bash,$(SHELL)),-exc,-c)

##############################################################################
# MAKE commandline overrides

# Location of HomeBase
BASE_NAME		=base
BASE			=$(HOME)/$(BASE_NAME)

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


