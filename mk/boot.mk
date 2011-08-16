##############################################################################
# Bootstrap Make with out Options and Definitions
##############################################################################
include $(guard)
ifdef FIRST_INCLUDE
##############################################################################
# BOOTSTRAP marks proper bootstrap
ifndef BOOTSTRAP
$(warning Bootstrapping)

.DEFAULT_GOAL		=bootstrap

# force bootstrap
$(MAKECMDGOALS): bootstrap ;
(%):: bootstrap ;
%:: bootstrap ;

.PHONY: bootstrap
bootstrap:		my_MAKEOVERRIDES+=BOOTSTRAP='Complete'
bootstrap:
	$(bootstrap)

else # Bootstrap Complete
$(warning Bootstrap Complete)

endif # END Bootstrap
##############################################################################
endif # END Include Guard
$(end_guard)
##############################################################################
