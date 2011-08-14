##############################################################################
# Extract Stage
##############################################################################
include $(stage_tmpl)
ifdef FIRST_INCLUDE
##############################################################################

$(this)_PROG		=tar
$(this)_ARG		=vxf$($(prj)_ZIP_FLAG) '$($(prj)_AR)'
$(this)_PATH		=$(build_PATH)/$(prj)

# Depend on get
$(this)_DEP		+=get($(*))
$(this)_DEP		+=$($(*)_PATH)

# %.$(this).log: get(%)

# $(build_PATH)/$(prj)
.PRECIOUS: $(build_PATH)/%
$(build_PATH)/%: | $$(@D)
	mkdir -vp '$(@)'
##############################################################################
endif # END Include Guar
include $(end_stage_tmpl)
##############################################################################
