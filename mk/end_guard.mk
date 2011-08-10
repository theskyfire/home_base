##############################################################################
# Include Guard END
##############################################################################

# Configuration
include $(MK_DIR)/config.mk

# POP last item off THIS_MAKEFILE_LIST
THIS_MAKEFILE_LIST	:=$(call POP_LIST,$(THIS_MAKEFILE_LIST))

# Include Guard
ifndef INCLUDE_end_guard_mk
INCLUDE_end_guard_mk	:=$(abspath $(lastword $(MAKEFILE_LIST)))

# Stop rebuild of End Guard Makefile
$(lastword $(call POP_LIST,$(MAKEFILE_LIST))): ;

endif # END Include Guard for End Include Guard
##############################################################################
