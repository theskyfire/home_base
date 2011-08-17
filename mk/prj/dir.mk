##############################################################################
# HomeBase Directory Project
##############################################################################
include $(guard)
ifdef FIRST_INCLUDE
include $(prj_tmpl)
##############################################################################
# Basic HomeBase Layout

DIRS			:=$(foreach d,$(dirs),$($(d)_DIR))
DIRS			:=$(filter-out $(base_DIR),$(DIRS))
LNKS			:=$(foreach l,$(lnks),$($(l)_LNK))
INSTALLDIRS		=$(DIRS) $(LNKS)

get($(this)):		get_CMD=$(Nop)
extract($(this)):	extract_CMD=$(Nop)
patch($(this)):		patch_CMD=$(Nop)
config($(this)):	config_CMD=$(Nop)
build($(this)):		build_CMD=$(Nop)
stage($(this)):		stage_CMD=$(Nop)
install($(this)):	install_CMD=$(Nop)

install_$(this)_SP_ODEP	=$(INSTALLDIRS)

# Directory Permissions
DIR_MODE		=0710

$(base):
	[ -r '$(my_MAKEFILE)' ]
	[ ! -e '$(base_DIR)' ]
	[ -d '$(common_DIR)' ]
	mkdir -vp --mode='$(DIR_MODE)' '$(@)'

$(DIRS): | $$(@D)
	[ -d '$(@)' ] || mkdir -v --mode='$(DIR_MODE)' '$(@)'

$(foreach l,$(lnks),$(eval $$($(l)_LNK): TARGET=$$($(l)_LNK_TARGET)))

$(common_LNK):		| $(common_DIR)
$(mk_LNK):		| $(common_LNK) $(mk_DIR)
$(src_LNK):		| $(common_LNK) $(src_DIR)
$(com_LNK):		| $(common_LNK) $(com_DIR)
$(share_LNK):		| $(common_LNK) $(share_DIR)
$(man_LNK):		| $(share_LNK) $(man_DIR)
$(GNUmakefile_LNK):	| $(mk_LNK)

$(LNKS): | $$(@D)
	ln -vsT '$(TARGET)' '$(@)'

.PRECIOUS: $(src)/% $(build)/%
$(src)/%: | $$(@D)
	[ -d '$(@)' ] || mkdir -v --mode='$(DIR_MODE)' '$(@)'

$(build)/%: | $$(@D)
	[ -d '$(@)' ] || mkdir -v --mode='$(DIR_MODE)' '$(@)'

##############################################################################
endif # END Include Guard
$(end_guard)
##############################################################################
