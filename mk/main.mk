##############################################################################
# HOME/base 0.1
##############################################################################
# Locate makefiles
MAIN.mk			:=$(lastword $(MAKEFILE_LIST))
REAL.mk			:=$(realpath $(MAIN.mk))
PATH.mk			:=$(patsubst %/,%,$(dir $(REAL.mk)))
functions.mk		=$(PATH.mk)/func.mk
test.mk			=$(PATH.mk)/test.mk
guard.mk		=$(PATH.mk)/guard.mk
bootstrap.mk		=$(PATH.mk)/boot.mk
commands.mk		=$(PATH.mk)/cmd.mk
projects.mk		=$(PATH.mk)/prj.mk
directories.mk		=$(PATH.mk)/dir.mk

include $(functions.mk)

$(call .include.guard.start)
include $(guard)
ifdef FIRST_INCLUDE
##############################################################################
# Standard Environment
USER			?=$(call .get.user)
HOME			?=$(call .get.home)
TMPDIR			?=$(call .get.tmp)

# Make command-line overrides
BASE_NAME		=base
BASE_DIR		=$(HOME)
BASE			=$(BASE_DIR)/$(BASE_NAME)
COMMON			=$(call .dir,$(PATH.mk))
TMP_BASE		=$(TMPDIR)/homebase.$(USER)

include $(directories.mk)

include $(commands.mk)

include $(projects.mk)

include $(bootstrap.mk)

##############################################################################
endif # FIRST_INCLUDE
$(call .include.guard.stop)
