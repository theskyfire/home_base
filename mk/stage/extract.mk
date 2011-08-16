##############################################################################
# Extract Stage
##############################################################################
include $(stage_tmpl)
ifdef FIRST_INCLUDE
##############################################################################

$(this)_PROG		=tar
$(this)_ARG		=vxf$($(PRJ)_ZIP_FLAG) '$($(PRJ)_AR)'
$(this)_PATH		=$(build_PATH)/$(PRJ)

# Set defaults
$(foreach prj,$(prjs),$(eval \
	$(prj)_AR	?=$$(firstword $$(wildcard $(src_PATH)/$(prj)/*.tar.gz $(src_PATH)/$(prj)/*.bz2)))\
)
$(foreach prj,$(prjs),$(eval \
	$(prj)_ZIP_FLAG	?=$$(if $$(findstring .bz2,$$($(prj)_AR)),j,z))\
)

# extract -> get
$(this)($(prjs)): get($$(%))

##############################################################################
endif # END Include Guar
include $(end_stage_tmpl)
##############################################################################
