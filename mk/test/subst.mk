##############################################################################
# subst
##############################################################################

# subst
EXPECT:=XX
ACTUAL:=$(subst x,,xXxXx)
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=XX
ACTUAL:=$(subst xx,XX,xx)
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=XX
ACTUAL:=$(subst xx,XX,xx)
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=XX
ACTUAL:=$(subst\
	xx,\
	XX,\
	xx\
)
ifeq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

.subst=$(subst $(1),$(2),$(3))
EXPECT:=XX
ACTUAL:=$(call .subst,\
	xx,\
	XX,\
	xx\
)
ifeq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

.subst=$(subst $(strip $(1)),$(strip $(2)),$(strip $(3)))
EXPECT:=XX
ACTUAL:=$(call .subst,\
	xx,\
	XX,\
	xx\
)
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

##############################################################################
