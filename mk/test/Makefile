tests:=$(wildcard *.t)

goals:=$(tests:%.t=%)

output:=$(addsuffix .out,$(tests))

.PHONY: all $(goals)

all: $(goals)

$(goals): % : %.t %.t.out Makefile

TEST_MK=test.mk

# from main.mk
PATH.mk			:=$(patsubst %/,%,$(dir \
	$(patsubst %/,%,$(dir $(realpath $(lastword $(MAKEFILE_LIST)))))\
))

MAKE_CMD=MAKEFILES='$(TEST_MK)' $(MAKE) -dpf '$<' TEST='$<' PATH.mk='$(PATH.mk)'

$(output): %.out : % Makefile
	@{\
		function err_trap () {\
			echo 'FAIL' ;\
			grep '\*\*\*' '$@' |\
				grep -v xIGNOREx ;\
			mv '$@' '$@.err' ;\
			exit 1 ;\
		} ;\
		trap err_trap ERR ;\
		echo -ne '$<: ' ;\
		echo -ne '$(MAKE_CMD)\n\n' > '$@' ;\
		$(MAKE_CMD) >> '$@' 2>&1 ;\
		echo PASS ;\
	}

clean:
	rm -f *.out

$(tests):: ;

Makefile:: ;
