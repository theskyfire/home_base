tests:=$(wildcard *.t)
subtests:=$(wildcard *.tt)
goals:=$(tests:%.t=%)

TEST_MK=test.mk
MAKE_CMD=MAKEFILES='$(TEST_MK)' $(MAKE) -dpf '$<' TEST='$<'

.PHONY: all $(goals)
all: $(goals)
$(goals): % : %.t.out

.SECONDEXPANSION:
$(addsuffix .out,$(tests)): %.out : % Makefile test.mk $$(wildcard $$(*)t)
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
$(subtests):: ;
$(TEST_MK):: ;
Makefile:: ;
