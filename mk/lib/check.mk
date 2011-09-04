########################################################################
# Check for GNU Make
########################################################################
include $(guard)
ifdef $(.FIRST.INCLUDE)
########################################################################
# This must be the first target to test support for .DEFAULT_GOAL

FAIL: FORCE
	@echo "Error: Please use a modern version of GNU Make!" >&2
	false

PASS: FORCE
	true

FORCE:

.PHONY: FAIL PASS FORCE

# Require .DEFAULT_GOAL
ifndef .DEFAULT_GOAL
include FAIL $(error Please use a modern version of GNU Make!)
endif
.DEFAULT_GOAL=FAIL
##############################################################################
# Test for modern GNU Make

include $(LIB.mk)/assert.mk

.test.feature		=\
$(call .assert,\
	$(findstring $(strip $(1)),$(.FEATURES)),\
	Feature '$(strip $(1))' missing: Please use a modern GNU Make$(2)\
)

$(call .test.feature, else-if )
$(call .test.feature, target-specific )
$(call .test.feature, order-only )
$(call .test.feature, second-expansion )
$(call .test.feature, archives )
$(call .test.feature, jobserver )
$(call .test.feature, check-symlink )
##############################################################################

########################################################################
endif # .FIRST.INCLUDE
