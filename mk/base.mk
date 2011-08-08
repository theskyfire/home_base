##############################################################################
# HomeBase 0.1
##############################################################################
CFG			:=$(dir $(abspath $(MAKEFILE_LIST)))config.mk
include $(CFG)

# Include Guard
GUARD			:=$(dir $(abspath $(MAKEFILE_LIST)))guard.mk
include $(GUARD)
ifdef FIRST_INCLUDE

##############################################################################
# Bootstrap Make
include $(MK_DIR)/boot.mk
ifdef BOOTSTRAP

##############################################################################
# load stages
#include $(MK_DIR)/stage.mk

##############################################################################
# load projects
#include $(MK_DIR)/prj.mk

##############################################################################
# END Bootstrap Guard
endif 

##############################################################################
include $(END_GUARD)
endif # END Include Guard
