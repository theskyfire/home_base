##############################################################################
# HomeBase 0.1
##############################################################################
# Configuration
guard			:=$(lastword $(MAKEFILE_LIST))
guard			:=$(realpath $(guard))
guard			:=$(dir $(guard))
guard			:=$(guard)config.mk
include $(guard)
ifdef FIRST_INCLUDE

include $(bootstrap.mk)
ifdef BOOTSTRAP

include $(stages.mk)

include $(prjs.mk)

endif # END Bootstrap Guard

endif
$(end_guard)
##############################################################################
