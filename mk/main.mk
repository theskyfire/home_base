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

include $(LIB.mk)/check.mk

## Standard Environment
include $(LIB.mk)/env.mk
USER			?=$(call .get.env.USER)
HOME			?=$(call .get.env.HOME)
TMPDIR			?=$(call .get.env.TMPDIR)

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
