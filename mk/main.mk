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

include $(bootstrap_mk)
ifdef BOOTSTRAP

include $(stages_mk)

include $(prjs_mk)

# Record action in prj.stage.log
#$(tmp)/%.log: | $$(@D) $$($$(STAGE)_PATH)
#	# LOG [$@] [$*] [$%] S{$(STAGE)} P{$(PRJ)}


endif # END Bootstrap Guard

endif
$(end_guard)
##############################################################################
