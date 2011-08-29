FAIL:
	false

PASS:
	true

test.mk:: ;

.PHONY: FAIL PASS test

.DEFAULT_GOAL:=FAIL

#$(TEST):: ;

NOTHING:=
TAB:=$(NOTHING)	$(NOTHING)
SPACE:=$(NOTHING) $($NOTING)
