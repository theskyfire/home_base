##############################################################################
# Configuration
##############################################################################
ifndef config_mk.INCLUDE
config_mk.INCLUDE	:=$(realpath $(lastword $(MAKEFILE_LIST)))
##############################################################################
##############################################################################
##############################################################################
endif # END Include Guard
##############################################################################


##############################################################################
# Setup Include Guard for including Makefile  "Quis custodiet ipsos custodes?"
##############################################################################
$(call .push.this.MAKEFILE_LIST,$(my.last.MAKEFILE))

$(call .unset.FIRST_INCLUDE)

ifndef $(this.include.marker)
$(call .set.this.include.marker)

$(call .set.FIRST_INCLUDE)

$(call .stop.rule.search)
endif # end Include Guard setup for including Makefile
##############################################################################
