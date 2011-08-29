########################################################################
# Include Guard   "Quis custodiet ipsos custodes?"
########################################################################

# Set THIS.mk to including makefile
THIS.mk			:=\
$(lastword\
	$(wordlist\
		1,\
		$(words \
			$(wordlist \
				2,\
				$(words $(MAKEFILE_LIST)),\
				$(MAKEFILE_LIST)\
			)\
		),\
		$(MAKEFILE_LIST)\
	)\
)

THIS.mk.abs		=$(abspath $(THIS.mk))
THIS.mk.real		=$(realpath $(THIS.mk))
THIS.mk.name		=$(notdir $(THIS.mk.real))
THIS.mk.relative	=$(patsubst $(PATH.mk)/%,%,$(THIS.mk.real))
THIS.mk.esc		=$(subst .,_,$(subst /,_,$(THIS.mk.relative)))
THIS.mk.marker		=INCLUDE.$(THIS.mk.esc)

.FIRST.INCLUDE		=\
$(strip FIRST_INCLUDE\
	$(eval $$(THIS.mk.marker)+=X)\
	$(eval $$(THIS.mk.marker):=$$(subst $$(strip ) $$(strip ),_,$$($$(THIS.mk.marker))))\
	$(if \
		$(findstring X_X,$($(THIS.mk.marker)))\
		,\
		$(eval undefine FIRST_INCLUDE)\
		,\
		$(eval FIRST_INCLUDE=FIRST_INCLUDE)\
	)\
)

########################################################################
