define testx =

if$(strip )eq '' ''

$$(warning def '$$1')

end$(strip )if

endef

$(eval $(call testx,A))

A=a

.DEFAULT_GOAL:=PASS

# vim: set syntax=make:
