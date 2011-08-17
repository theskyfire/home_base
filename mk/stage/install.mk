##############################################################################
# Install Stage
##############################################################################
include $(guard)
ifdef FIRST_INCLUDE
include $(stage.tmpl)
##############################################################################

# install -> stage
include $(stage)/stage.mk
$(this).DEP_STAGE	=stage($(PRJ))

$(this).ENV		+=MAKELEVEL=0
$(this).ENV		+=MAKEFLAGS=
$(this).ENV		+=MAKEOVERRIDES=
$(this).PROG		=$(my.MAKE)
$(this).ARG		=install
$(this).PATH		=$(stage.$(PRJ).PATH)

##############################################################################
endif # END Include Guard
$(end_guard)
##############################################################################
