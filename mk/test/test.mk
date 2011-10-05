PASS: ;

FAIL: ; false

test.mk:: ;

.DEFAULT_GOAL:=PASS

SUBMAKE=MAKEFILES='' MAKEFLAGS='' $(MAKE) -dp -f '$(TEST)t' '$@'=DEFINED guard='$(guard)'

ifneq ($(findstring guard.t,$(TEST)),guard.t)

include ../lib/guard.mk
THIS.mk:=$(TEST)
ifdef $(.FIRST.INCLUDE)
endif

include $(LIB.mk)/assert.mk

-include $(wildcard $(TEST:%.t=$(LIB.mk)/%.mk))

endif # $(TEST) != guard.t
