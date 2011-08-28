########################################################################
# HOME/base 0.1
########################################################################
# Locate makefiles
MAIN.mk			:=$(lastword $(MAKEFILE_LIST))
REAL.mk			:=$(realpath $(MAIN.mk))
PATH.mk			:=$(patsubst %/,%,$(dir $(REAL.mk)))
functions.mk		=$(PATH.mk)/func.mk
bootstrap.mk		=$(PATH.mk)/boot.mk
commands.mk		=$(PATH.mk)/cmd.mk
projects.mk		=$(PATH.mk)/prj.mk
directories.mk		=$(PATH.mk)/dir.mk
guard			=$(functions.mk)

include $(guard)
ifdef $(FIRST.INCLUDE)
$(warning AAA)
########################################################################
## Standard Environment
#USER			?=$(call .get.user)
#HOME			?=$(call .get.home)
#TMPDIR			?=$(call .get.tmp)
#
## Make command-line overrides
#BASE_NAME		=base
#BASE_DIR		=$(HOME)
#BASE			=$(BASE_DIR)/$(BASE_NAME)
#COMMON			=$(call .dir,$(PATH.mk))
#TMP_BASE		=$(TMPDIR)/homebase.$(USER)
#
#include $(directories.mk)
#
#include $(commands.mk)
#
#include $(projects.mk)
#
#include $(bootstrap.mk)
#
########################################################################
endif # FIRST.INCLUDE
ifdef $(FIRST.INCLUDE)
$(warning BBB)
endif # FIRST.INCLUDE
$(warning ZZZ)
$(warning {$(FIRST.INCLUDE)})
