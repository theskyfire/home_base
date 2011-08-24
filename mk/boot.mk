##############################################################################
# Bootstrap Make with our Options and Definitions
##############################################################################
include $(guard.mk)
ifdef FIRST_INCLUDE
##############################################################################
# BOOTSTRAP marks proper bootstrap
ifndef BOOTSTRAP
$(warning Bootstrapping)

.PHONY: bootstrap
bootstrap:		my.MAKEOVERRIDES+=BOOTSTRAP='Complete'
bootstrap:
	$(MAKE) -f '$(INCLUDE.main.mk)' -C '$(CURDIR)' BOOTSTRAP='complete'

#	$(bootstrap)

#	$(make.CMD_SEQ)

# force bootstrap
.DEFAULT_GOAL		=bootstrap
$(MAKECMDGOALS):	bootstrap ;
%::			bootstrap ;

else # Bootstrap Complete
$(warning Bootstrap Complete)

endif # END Bootstrap
##############################################################################
endif # END Include Guard
$(end_guard)
##############################################################################
