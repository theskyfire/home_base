##############################################################################
# Include Guard END
##############################################################################

# POP last item off THIS_MAKEFILE_LIST
#$(warning <$(THIS_MAKEFILE_LIST)>)
THIS_MAKEFILE_LIST	:=$(call POP_LIST,$(THIS_MAKEFILE_LIST))
#$(warning <$(THIS_MAKEFILE_LIST)>)

# Include Guard
ifndef INCLUDE_end_guard_mk
INCLUDE_end_guard_mk	:=$(abspath $(lastword $(MAKEFILE_LIST)))

# Stop rebuild of End Guard Makefile
$(lastword $(MAKEFILE_LIST)): ;

endif # END Include Guard for End Include Guard
##############################################################################
