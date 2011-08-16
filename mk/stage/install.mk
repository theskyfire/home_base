##############################################################################
# Install Stage
##############################################################################
include $(stage_tmpl)
ifdef FIRST_INCLUDE
##############################################################################

$(this)_ENV		+=MAKELEVEL=0
$(this)_ENV		+=MAKEFLAGS=
$(this)_ENV		+=MAKEOVERRIDES=
$(this)_PROG		=$(my_MAKE)
$(this)_ARG		=install
$(this)_PATH		=$(build_PATH)/$(PRJ)

# install -> stage
#$(this)($(prjs)): stage($$(%))


##############################################################################
endif # END Include Guard
include $(end_stage_tmpl)
##############################################################################
