##############################################################################
# Bootstrap Make with out Options and Definitions
##############################################################################
include $(GUARD)
ifdef FIRST_INCLUDE

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
MY_MAKE			=$(firstword $(wildcard $(BASE_MAKE) $(TMP_MAKE) $(MAKE)))
MY_MAKE			=$(wildcard $(BASE_MAKE) $(TMP_MAKE) $(MAKE))
MY_MAKE			=$(BASE_MAKE) $(TMP_MAKE) $(MAKE)
$(warning {$(MY_MAKE)})

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

##############################################################################
# Bootstrap

# BOOTSTRAP marks proper bootstrap
ifndef BOOTSTRAP
$(warning Bootstrapping)

# Set Default Goal
.DEFAULT_GOAL		=bootstrap

# run MY_MAKE my way
.PHONY: bootstrap
bootstrap:
	$(MY_MAKE_ENV) $(MY_MAKE) -f '$(MY_MAKEFILE)' $(MY_MAKEFLAGS) $(MY_CURDIR) $(MY_MAKE_GOALS) $(MY_OVERRIDES)

# Mark Bootstrap Complete
MY_OVERRIDES		+=BOOTSTRAP='COMPLETE'

# force bootstrap
$(MAKECMDGOALS): bootstrap

%:: bootstrap ;

# Bootstrap Complete
else
$(warning Bootstrap Complete)

# END Bootstrap 
endif

##############################################################################
$(warning [$(THIS_MAKEFILE)] [$(THIS_MAKEFILE_LIST)])
include $(END_GUARD)
$(warning [$(THIS_MAKEFILE)] [$(THIS_MAKEFILE_LIST)])
endif # END Include Guard
$(warning [$(THIS_MAKEFILE)] [$(THIS_MAKEFILE_LIST)])
