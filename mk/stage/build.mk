##############################################################################
# Build Stage
##############################################################################
include $(guard)
ifdef FIRST_INCLUDE
include $(stage_tmpl)
##############################################################################

# build -> config
include $(stage)/config.mk
$(this)_S_DEP		=config($(PRJ))

$(this)_ENV		+=MAKELEVEL=0
$(this)_ENV		+=MAKEFLAGS=
$(this)_ENV		+=MAKEOVERRIDES=
$(this)_PROG		=$(my_MAKE)
$(this)_PATH		=$(patch_PATH)

##############################################################################
endif # END Include Guar
$(end_guard)
##############################################################################
