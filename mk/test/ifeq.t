##############################################################################
# ifeq / ifneq
##############################################################################

ifeq (X,)
include FAIL $(error ifeq (X,))
endif

ifeq (,X)
include FAIL $(error ifeq (,X))
endif

ifeq (0,1)
include FAIL $(error ifeq (0,1))
endif

ifeq (x,X)
include FAIL $(error ifeq (x,X))
endif

ifeq "x" "X"
include FAIL $(error ifeq "x" "X")
endif

ifeq '0' "O"
include FAIL $(error ifeq '0' "O")
endif

ifeq "1" '0'
include FAIL $(error ifeq "1" '0')
endif

ifeq '' ' '
include FAIL $(error ifeq '' ' ')
endif


ifneq (,)
include FAIL $(error ifneq (,))
endif

ifneq (x,x)
include FAIL $(error ifneq (x,x))
endif

ifneq "X" "X"
include FAIL $(error ifneq "X" "X")
endif

ifneq '0' "0"
include FAIL $(error ifneq '0' "0")
endif

ifneq "1" '1'
include FAIL $(error ifneq "1" '1')
endif

ifneq '' ''
include FAIL $(error ifneq '' '')
endif


.DEFAULT_GOAL:=PASS

##############################################################################
# vim: set syntax=make:
