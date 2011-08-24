##############################################################################
# define
##############################################################################

define TEST_DEFINE1
test
endef
ifndef TEST_DEFINE1
include FAIL $(error Does define work? Please use a modern GNU Make!)
endif
undefine TEST_DEFINE1
ifdef TEST_DEFINE1
include FAIL $(error Does undefine work? Please use a modern GNU Make!)
endif

define TEST_DEFINE2 =
test
endef
ifndef TEST_DEFINE2
include FAIL $(error Does define= work? Please use a modern GNU Make!)
endif
undefine TEST_DEFINE2
ifdef TEST_DEFINE2
include FAIL $(error Does undefine work? Please use a modern GNU Make!)
endif

define TEST_DEFINE3 :=
test
endef
ifndef TEST_DEFINE3
include FAIL $(error Does define:= work? Please use a modern GNU Make!)
endif
undefine TEST_DEFINE3
ifdef TEST_DEFINE3
include FAIL $(error Does undefine work? Please use a modern GNU Make!)
endif

define TEST_DEFINE4 ?=
test
endef
ifndef TEST_DEFINE4
include FAIL $(error Does define?= work? Please use a modern GNU Make!)
endif
undefine TEST_DEFINE4
ifdef TEST_DEFINE4
include FAIL $(error Does undefine work? Please use a modern GNU Make!)
endif

##############################################################################
