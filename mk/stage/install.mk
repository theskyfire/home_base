##############################################################################
# Install Stage
##############################################################################
include $(guard)
ifdef FIRST_INCLUDE
include $(stage_tmpl)
##############################################################################

# install -> stage
include $(stage)/stage.mk
$(this)_S_DEP		=stage($(PRJ))

$(this)_ENV		+=MAKELEVEL=0
$(this)_ENV		+=MAKEFLAGS=
$(this)_ENV		+=MAKEOVERRIDES=
$(this)_PROG		=$(my_MAKE)
$(this)_ARG		=install
$(this)_PATH		=$(stage_PATH)

##############################################################################
endif # END Include Guard
$(end_guard)
##############################################################################
