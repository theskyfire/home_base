##############################################################################
# ifeq / ifneq
##############################################################################

ifeq (X,)
include FAIL $(error Does ifeq work? Please use a modern GNU Make!)
endif
ifeq (,X)
include FAIL $(error Does ifeq work? Please use a modern GNU Make!)
endif
ifeq (0,1)
include FAIL $(error Does ifeq work? Please use a modern GNU Make!)
endif
ifeq (x,X)
include FAIL $(error Does ifeq work? Please use a modern GNU Make!)
endif
ifeq "x" "X"
include FAIL $(error Does ifeq work? Please use a modern GNU Make!)
endif
ifeq '0' "O"
include FAIL $(error Does ifeq work? Please use a modern GNU Make!)
endif
ifeq "1" '0'
include FAIL $(error Does ifeq work? Please use a modern GNU Make!)
endif
ifeq '' ' '
include FAIL $(error Does ifeq work? Please use a modern GNU Make!)
endif

ifneq (,)
include FAIL $(error Does ifneq work? Please use a modern GNU Make!)
endif
ifneq (x,x)
include FAIL $(error Does ifneq work? Please use a modern GNU Make!)
endif
ifneq "X" "X"
include FAIL $(error Does ifneq work? Please use a modern GNU Make!)
endif
ifneq '0' "0"
include FAIL $(error Does ifneq work? Please use a modern GNU Make!)
endif
ifneq "1" '1'
include FAIL $(error Does ifneq work? Please use a modern GNU Make!)
endif
ifneq '' ''
include FAIL $(error Does ifneq work? Please use a modern GNU Make!)
endif

##############################################################################
