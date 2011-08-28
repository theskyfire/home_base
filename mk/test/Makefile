all: test ;

tests:=$(wildcard *.t)

output:=$(addsuffix .out,$(tests))

test: $(output)

TEST_MK=test.mk

MAKE_CMD=MAKEFILES='$(TEST_MK)' $(MAKE) -dpf '$<'

$(output): %.out : % Makefile
	@{\
		trap "echo 'FAIL'; grep '\*\*\*' '$@'; exit 1" ERR ;\
		echo -ne '$<: ' ;\
		echo -ne '$(MAKE_CMD)\n\n' > '$@' ;\
		$(MAKE_CMD) >> '$@' 2>&1 ;\
		echo PASS ;\
	}

clean:
	rm -f *.out

Makefile:: ;
