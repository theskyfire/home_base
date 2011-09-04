$(call .assert.eq,FAIL,$(.DEFAULT_GOAL))
.DEFAULT_GOAL=PASS
$(call .assert.eq,PASS,$(.DEFAULT_GOAL))

$(call .assert.def,.test.feature)

$(call .test.feature, else-if )
$(call .test.feature, target-specific )
$(call .test.feature, order-only )
$(call .test.feature, second-expansion )
$(call .test.feature, archives )
$(call .test.feature, jobserver )
$(call .test.feature, check-symlink )

# These tests MUST all fail, so they are run in a sub-make
tests			=
tests			+=fake_feature

.PHONY: $(tests)
$(tests):
	{\
		function err_trap () {\
			echo 'FAIL' ;\
			mv '$(TEST)t.out' '$(TEST)t.out.err' ;\
			exit 1 ;\
		} ;\
		trap err_trap ERR ;\
		echo -ne '$(TEST)t $@: ' ;\
		echo -ne '$(SUBMAKE)\n\n' > '$(TEST)t.out' ;\
		$(SUBMAKE) >> '$(TEST)t.out' 2>&1 ||: ;\
		grep -q -s '{EXPECTED FAILURE}' '$(TEST)t.out' ;\
		echo PASS ;\
	}

PASS: $(tests)
# vim: set syntax=make:
