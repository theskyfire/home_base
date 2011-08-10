##############################################################################
# Bootstrap Make with out Options and Definitions
##############################################################################
include $(GUARD)
ifdef FIRST_INCLUDE

##############################################################################
# Bootstrap

# BOOTSTRAP marks proper bootstrap
ifndef BOOTSTRAP
$(warning Bootstrapping)

# Set Default Goal
.DEFAULT_GOAL		=bootstrap

# force bootstrap
$(MAKECMDGOALS): bootstrap ;

# bootstrap
.PHONY: bootstrap
bootstrap:		MY_OVERRIDES+=BOOTSTRAP='COMPLETE'
bootstrap:
	$(MAKE_BOOT)

# Bootstrap Complete
else
$(warning Bootstrap Complete)

endif # END Bootstrap

##############################################################################
endif # END Include Guard
include $(END_GUARD)
