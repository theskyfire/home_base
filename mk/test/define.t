##############################################################################
# define
##############################################################################

define TEST_DEFINE1
test
endef
ifndef TEST_DEFINE1
include FAIL $(error ifndef TEST_DEFINE1)
endif
undefine TEST_DEFINE1
ifdef TEST_DEFINE1
include FAIL $(error ifdef TEST_DEFINE1)
endif

define TEST_DEFINE2 =
test
endef
ifndef TEST_DEFINE2
include FAIL $(error ifndef TEST_DEFINE2)
endif
undefine TEST_DEFINE2
ifdef TEST_DEFINE2
include FAIL $(error ifdef TEST_DEFINE2)
endif

define TEST_DEFINE3 :=
test
endef
ifndef TEST_DEFINE3
include FAIL $(error ifndef TEST_DEFINE3)
endif
undefine TEST_DEFINE3
ifdef TEST_DEFINE3
include FAIL $(error ifdef TEST_DEFINE3)
endif

define TEST_DEFINE4 ?=
test
endef
ifndef TEST_DEFINE4
include FAIL $(error ifndef TEST_DEFINE4)
endif
undefine TEST_DEFINE4
ifdef TEST_DEFINE4
include FAIL $(error ifdef TEST_DEFINE4)
endif

PASS: ;

##############################################################################
# vim: set syntax=make:
