##############################################################################
# Extract Stage
##############################################################################
include $(guard)
ifdef FIRST_INCLUDE
include $(stage.tmpl)
##############################################################################

# extract -> get
include $(stage)/get.mk
$(this).DEP_STAGE	=get($(PRJ))

$(this).PROG		=tar
$(this).ARG		=vxf$($(PRJ).ZIP_FLAG) '$($(PRJ).AR)'
$(this).PATH		=$(build)/$(PRJ)

# Set defaults
$(foreach p,$(prjs),\
	$(eval $(p).AR?=$$(firstword $$(wildcard $(src)/$(p)/*.tar.gz $(src)/$(p)/*.bz2)))\
	$(eval $(p).ZIP_FLAG?=$$(if $$(findstring .bz2,$$($(p).AR)),j,z))\
)

##############################################################################
endif # END Include Guar
$(end_guard)
##############################################################################
