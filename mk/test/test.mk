PASS: ;

FAIL: ; false

.DEFAULT_GOAL:=PASS

PATH.mk			:=\
$(patsubst %/,%,$(dir \
	$(patsubst %/,%,$(dir \
		$(realpath $(lastword $(MAKEFILE_LIST)))\
	))\
))

LIB.mk			=$(PATH.mk)/lib
guard			:=$(LIB.mk)/guard.mk

SUBMAKE=MAKEFILES='' MAKEFLAGS='' $(MAKE) -d -f '$(TEST)t' '$@'=DEFINED LIB.mk='$(LIB.mk)'

test.mk:: ;
#$(TEST):: ;

ifneq ($(findstring guard.t,$(TEST)),guard.t)

include $(LIB.mk)/assert.mk

include $(guard)
THIS.mk:=$(TEST)
ifdef $(.FIRST.INCLUDE)
endif

-include $(TEST:%.t=$(LIB.mk)/%.mk)

endif # $(TEST) != guard.t
