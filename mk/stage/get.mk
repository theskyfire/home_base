##############################################################################
# Get Stage
##############################################################################
include $(stage_tmpl)
ifdef FIRST_INCLUDE
##############################################################################

$(this)_PROG		=wget
$(this)_ARG		 =-N
$(this)_ARG		+=$($(PRJ)_URL)
$(this)_PATH		=$(src_PATH)/$(PRJ)

##############################################################################
endif # END Include Guard
include $(end_stage_tmpl)
##############################################################################
