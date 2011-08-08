##############################################################################
# Include Guard END
##############################################################################

# Restore Guard variables
THIS_MAKEFILE		:=$(lastword $(THIS_MAKEFILE_LIST))
THIS_MAKEFILE_LIST	:=$(call POP_LIST,$(THIS_MAKEFILE_LIST))
