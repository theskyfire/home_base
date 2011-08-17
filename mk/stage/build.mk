##############################################################################
# Build Stage
##############################################################################
include $(guard)
ifdef FIRST_INCLUDE
include $(stage.tmpl)
##############################################################################

# build -> config
include $(stage)/config.mk
$(this).DEP_STAGE	=config($(PRJ))

$(this).ENV		+=MAKELEVEL=0
$(this).ENV		+=MAKEFLAGS=
$(this).ENV		+=MAKEOVERRIDES=
$(this).PROG		=$(my.MAKE)
$(this).PATH		=$(patch.$(PRJ).PATH)

##############################################################################
endif # END Include Guar
$(end_guard)
##############################################################################
