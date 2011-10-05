$(call .assert.eq,AZ,A$(firstword)Z)
$(call .assert.eq,AZ,A$(firstword )Z)
$(call .assert.eq,AZ,A$(firstword	)Z)

$(call .assert.eq,AmZ,A$(firstword	m)Z)
$(call .assert.eq,AaZ,A$(firstword	a z)Z)
$(call .assert.eq,AaZ,A$(firstword	a	z)Z)

#.comma:=,
#$(call .assert.eq,Aa$(.comma)zZ,A$(firstword	a,z	)Z)

EXPECT:=Aa,zZ
ACTUAL:=A$(firstword	a,z	)Z
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

EXPECT:=AaZ
ACTUAL:=A$(firstword	a	,	z	)Z
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif

f=$(firstword	$(1)$(2))
EXPECT:=AaZ
ACTUAL:=A$(call f	, a , z )Z
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif
undefine f

f=$(firstword	$(1)$(2))
EXPECT:=AazZ
ACTUAL:=A$(call f	, a,z )Z
ifneq ($(EXPECT),$(ACTUAL))
include FAIL $(error Assertion failed: EXPECT='$(EXPECT)' ACTUAL='$(ACTUAL)')
endif
undefine f

# vim: set syntax=make:
