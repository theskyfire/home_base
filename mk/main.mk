########################################################################
# HOME/base 0.1
########################################################################
# Locate makefiles
MAIN.mk			:=$(lastword $(MAKEFILE_LIST))
REAL.mk			:=$(realpath $(MAIN.mk))
PATH.mk			:=$(patsubst %/,%,$(dir $(REAL.mk)))
LIB.mk			=$(PATH.mk)/lib
guard			=$(LIB.mk)/guard.mk

include $(guard)
ifdef $(.FIRST.INCLUDE)
########################################################################

#include $(PATH.mk)/functions.mk

## Standard Environment
#USER			?=$(call .get.user)
#HOME			?=$(call .get.home)
#TMPDIR			?=$(call .get.tmp)

## Make command-line overrides
#BASE_NAME		=base
#BASE_DIR		=$(HOME)
#BASE			=$(BASE_DIR)/$(BASE_NAME)
#COMMON			=$(call .dir,$(PATH.mk))
#TMP_BASE		=$(TMPDIR)/homebase.$(USER)

#include $(directories.mk)

#include $(commands.mk)

#include $(projects.mk)

#include $(bootstrap.mk)

########################################################################
endif # .FIRST.INCLUDE
