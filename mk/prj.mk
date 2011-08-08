##############################################################################
# Project Makefiles
##############################################################################
# Include Guard
include $(dir $(lastword $(MAKEFILE_LIST)))guard.mk
ifeq ($(THIS_MAKEFILE),$(NOT_YET_INCLUDED))


# Project Directory
PRJ_DIR			=$(MK_DIR)/prj

# List of projects
PRJS			:=$(wildcard $(PRJ_DIR)/*.mk)

# Programs
PROGS			:=$(patsubst $(PRJ_DIR)/%.mk,%,$(PRJS))

START_PRJ		=\
	$(eval include $(MK_DIR)/guard.mk)\
	$(eval ifeq ($(THIS_MAKEFILE),$(NOT_YET_INCLUDED)))\
	$(eval PRJ	:=$(lastword $(MAKEFILE_LIST)))\
	$(eval PRJ	:=$(patsubst $(PRJ_DIR)/%.mk,%,$(PRJ)))

END_PRJ			=\
	endif

#$(foreach P,$(PRJS),\
#	$(eval START_PRJ:=)\
#	$(eval PRJ	:=$(patsubst $(PRJ_DIR)/%.mk,%,$(P)))\
#	$(eval include $(P))\
#)

# Include Projects
include $(PRJS)

##############################################################################
endif # END Include Guard
