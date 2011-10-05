define TEST_DEFINE1
test
endef
$(call .assert.def,TEST_DEFINE1)
undefine TEST_DEFINE1
$(call .assert.ndef,TEST_DEFINE1)

define TEST_DEFINE2 =
test
endef
$(call .assert.def,TEST_DEFINE2)
undefine TEST_DEFINE2
$(call .assert.ndef,TEST_DEFINE2)

define TEST_DEFINE3 :=
test
endef
$(call .assert.def,TEST_DEFINE3)
undefine TEST_DEFINE3
$(call .assert.ndef,TEST_DEFINE3)

define TEST_DEFINE4 ?=
test
endef
$(call .assert.def,TEST_DEFINE4)
undefine TEST_DEFINE4
$(call .assert.ndef,TEST_DEFINE4)

define TEST_DEFINE5 +=
test
endef
$(call .assert.def,TEST_DEFINE5)
undefine TEST_DEFINE5
$(call .assert.ndef,TEST_DEFINE5)

define TEST_DEFINE6 ??
test
endef
$(call .assert.ndef,TEST_DEFINE6)

# vim: set syntax=make:
