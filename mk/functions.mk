########################################################################
# Functions
########################################################################
include $(guard)
ifdef $(.FIRST.INCLUDE)
########################################################################

LIB.mk			=$(PATH.mk)/lib

include $(LIB.mk)/check.mk

########################################################################
endif # .FIRST.INCLUDE
