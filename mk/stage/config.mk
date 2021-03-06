##############################################################################
# Config Stage
##############################################################################
include $(guard)
ifdef FIRST_INCLUDE
include $(stage.tmpl)
##############################################################################

# config -> patch
include $(stage)/patch.mk
$(this).DEP_STAGE	=patch($(PRJ))

$(this).PROG		=sh ./configure
$(this).ARG		=--prefix='$(base)'
$(this).PATH		=$(patch.$(PRJ).PATH)

##############################################################################
endif # END Include Guar
$(end_guard)
##############################################################################
