##############################################################################
# HomeBase 0.1
##############################################################################
# Configuration
config			:=$(lastword $(MAKEFILE_LIST))
config			:=$(realpath $(config))
config			:=$(dir $(config))
config			:=$(config)config.mk
include $(config)
ifdef FIRST_INCLUDE
##############################################################################
include $(bootstrap_mk)
ifdef BOOTSTRAP

include $(stages_mk)

#include $(prjs_mk)

endif # END Bootstrap Guard
##############################################################################
endif
$(end_guard)
##############################################################################
