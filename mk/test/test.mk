#test.mk:: ;
#$(TEST):: ;

PATH.mk			:=\
$(patsubst %/,%,$(dir \
	$(patsubst %/,%,$(dir \
		$(realpath $(lastword $(MAKEFILE_LIST)))\
	))\
))

LIB.mk			=$(PATH.mk)/lib
guard			:=$(LIB.mk)/guard.mk
