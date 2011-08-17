##############################################################################
# Extract Stage
##############################################################################
include $(guard)
ifdef FIRST_INCLUDE
include $(stage_tmpl)
##############################################################################

# extract -> get
include $(stage)/get.mk
$(this)_S_DEP		=get($(PRJ))

$(this)_PROG		=tar
$(this)_ARG		=vxf$($(PRJ)_ZIP_FLAG) '$($(PRJ)_AR)'
$(this)_PATH		=$(build)/$(PRJ)

# Set defaults
$(foreach p,$(prjs),$(eval \
	$(p)_AR	?=$$(firstword $$(wildcard $(src)/$(p)/*.tar.gz $(src)/$(p)/*.bz2)))\
)
$(foreach p,$(prjs),$(eval \
	$(p)_ZIP_FLAG	?=$$(if $$(findstring .bz2,$$($(p)_AR)),j,z))\
)

##############################################################################
endif # END Include Guar
$(end_guard)
##############################################################################
