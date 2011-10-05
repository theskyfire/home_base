$(call .assert.def,.get.env.HOME)
$(call .assert.eq,$(HOME),$(.get.env.HOME))
undefine HOME
$(call .assert.ndef,HOME)
$(call .assert.eq,$(shell cd 2>/dev/null ; pwd),$(.get.env.HOME))

$(call .assert.def,.get.env.USER)
$(call .assert.eq,$(USER),$(.get.env.USER))
undefine USER
$(call .assert.ndef,USER)
$(call .assert.eq,$(shell whoami),$(.get.env.USER))

$(call .assert.def,.get.env.TMPDIR)
$(call .assert.eq,/tmp,$(.get.env.TMPDIR))
undefine TMPDIR
$(call .assert.ndef,TMPDIR)
$(call .assert.eq,/tmp,$(.get.env.TMPDIR))

# vim: set syntax=make:
