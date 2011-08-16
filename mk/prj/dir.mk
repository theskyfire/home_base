##############################################################################
# HomeBase Directory Project
##############################################################################
include $(prj_tmpl)
ifdef FIRST_INCLUDE
##############################################################################
# Basic HomeBase Layout

DIRS			:=$(foreach d,$(dirs),$($(d)_DIR))
DIRS			:=$(filter-out $(base_DIR),$(DIRS))
LNKS			:=$(foreach l,$(lnks),$($(l)_LNK))
INSTALLDIRS		=$(DIRS) $(LNKS)

get($(this)):		get_CMD=$(Nop)
extract($(this)):	extract_CMD=$(Nop)
install($(this)):	install_CMD=$(Nop)

install($(this)):	| $(INSTALLDIRS)

# Directory Permissions
DIR_MODE		=0710

$(base_DIR):
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

##############################################################################
endif # END Include Guard
include $(end_prj_tmpl)
##############################################################################
