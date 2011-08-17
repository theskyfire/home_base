##############################################################################
# Bootstrap Make with out Options and Definitions
##############################################################################
include $(guard)
ifdef FIRST_INCLUDE
##############################################################################
# BOOTSTRAP marks proper bootstrap
ifndef BOOTSTRAP
$(warning Bootstrapping)

.PHONY: bootstrap
bootstrap:		my.MAKEOVERRIDES+=BOOTSTRAP='Complete'
bootstrap:
	$(bootstrap)

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
