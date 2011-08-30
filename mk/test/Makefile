tests:=$(wildcard *.t)

goals:=$(tests:%.t=%)

output:=$(addsuffix .out,$(tests))

.PHONY: all $(goals)

all: $(goals)

$(goals): % : %.t %.t.out Makefile test.mk

TEST_MK=test.mk

# from main.mk
MAKE_CMD=MAKEFILES='$(TEST_MK)' $(MAKE) -dpf '$<' TEST='$<'

$(output): %.out : % Makefile test.mk
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
	rm -f *.out.err

$(tests):: ;

Makefile:: ;
