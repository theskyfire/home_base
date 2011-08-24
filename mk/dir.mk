##############################################################################
# Directory Information
##############################################################################
include $(guard.mk)
ifdef FIRST_INCLUDE
##############################################################################

PATH.dir		=$(PATH.mk)/dir
TMPL.dir		=$(PATH.dir)/dir.tmpl
LIST.dir		=$(call .get.list.from.dir,$(PATH.dir))

dir.LIST		=

##############################################################################
# Generated Paths

dirs			 =base
dirs			+=common
dirs			+=mk
dirs			+=stage
dirs			+=prj
dirs			+=tmp_base
dirs			+=tmp
dirs			+=build
dirs			+=src
dirs			+=bin
dirs			+=sbin
dirs			+=libexec
dirs			+=lib
dirs			+=etc
dirs			+=share
dirs			+=com
dirs			+=var
dirs			+=include
dirs			+=doc
dirs			+=info
dirs			+=man
dirs			+=locale

lnks			 =common
lnks			+=mk
lnks			+=src
lnks			+=com
lnks			+=share
lnks			+=man
lnks			+=GNUmakefile

# Generate Paths
dirs.PATHS		=$(foreach d,$(dirs),\
	$(eval $(d).DIR_NAME:=$(d) )\
	$(eval $(d).DIR_ROOT=$(base.DIR) )\
	$(eval $(d).DIR=$(value $(d).DIR_ROOT)/$(value $(d).DIR_NAME) )\
	$(eval $(d).LNK= )\
	$(eval $(d)=$$(or $$($(d).LNK),$$($(d).DIR)) )\
)
$(foreach l,$(lnks),\
	$(eval $(l).LNK_NAME:=$(l) )\
	$(eval $(l).LNK_ROOT=$$(base.DIR) )\
	$(eval $(l).LNK=$(value $(l).LNK_ROOT)/$(value $(l).LNK_NAME) )\
	$(eval $$($(l).LNK): TARGET=$$($(l).LNK_TARGET) )\
)
dirs.PATHS		=$(foreach d,$(dirs),$($(d).DIR))
lnks.PATHS		=$(foreach l,$(lnks),$($(l).LNK))

# Override some default values
base.DIR_NAME		=$(call .not.dir,$(BASE))
common.DIR_NAME		=$(call .not.dir,$(COMMON))
tmp_base.DIR_NAME	=$(call .not.dir,$(TMP_BASE))
base.DIR_ROOT		=$(call .dir,$(BASE))
common.DIR_ROOT		=$(call .dir,$(COMMON))
tmp_base.DIR_ROOT	=$(call .dir,$(TMP_BASE))
mk.DIR_ROOT		=$(common.DIR)
stage.DIR_ROOT		=$(mk.DIR)
prj.DIR_ROOT		=$(mk.DIR)
build.DIR_ROOT		=$(tmp.DIR)
src.DIR_ROOT		=$(common.DIR)
com.DIR_ROOT		=$(common.DIR)
share.DIR_ROOT		=$(common.DIR)
doc.DIR_ROOT		=$(share.LNK)
info.DIR_ROOT		=$(share.LNK)
locale.DIR_ROOT		=$(share.LNK)
man.DIR_ROOT		=$(share.LNK)
mk			=$(mk.DIR)

# Symlink Prerequisites
$(common.LNK):		| $(common.DIR)
$(mk.LNK):		| $(common.LNK) $(mk.DIR)
$(src.LNK):		| $(common.LNK) $(src.DIR)
$(com.LNK):		| $(common.LNK) $(com.DIR)
$(share.LNK):		| $(common.LNK) $(share.DIR)
$(man.LNK):		| $(share.LNK) $(man.DIR)
$(GNUmakefile.LNK):	| $(mk.LNK)

# Symlink Targets
common.LNK_TARGET	=$(common.DIR_ROOT)/$(common.DIR_NAME)
mk.LNK_TARGET		=$(common.LNK_NAME)/$(mk.DIR_NAME)
src.LNK_TARGET		=$(common.LNK_NAME)/$(src.DIR_NAME)
com.LNK_TARGET		=$(common.LNK_NAME)/$(com.DIR_NAME)
share.LNK_TARGET	=$(common.LNK_NAME)/$(share.DIR_NAME)
man.LNK_TARGET		=$(share.LNK_NAME)/$(man.DIR_NAME)
GNUmakefile.LNK_TARGET	=$(mk.LNK_NAME)/main.mk

bootstrap.mk		=$(mk)/boot.mk
stages.mk		:=$(wildcard $(stage)/*.mk)
stages			:=$(patsubst $(stage)/%.mk,%,$(stages.mk))
stage.tmpl		=$(stage)/stage.tmpl
prjs.mk			:=$(wildcard $(prj)/*.mk)
prjs			:=$(patsubst $(prj)/%.mk,%,$(prjs.mk))
prj.tmpl		=$(prj)/prj.tmpl


src.DIRS		=$(foreach p,$(prjs),$(src)/$(p))
build.DIRS		=$(foreach p,$(prjs),$(build)/$(p))

# Create Directories
dirs.MODE		=0710
.PRECIOUS: $(src.DIRS) $(build.DIRS)
$(dirs.EXPAND) $(src.DIRS) $(build.DIRS): | $$(@D)
	[ -d '$(@)' ] || mkdir -v --mode='$(dirs.MODE)' '$(@)'

# Create Symlinks
$(foreach l,$(lnks),$(eval $$($(l).LNK): TARGET=$$($(l).LNK_TARGET)))
$(lnks.EXPAND): | $$(@D)
	ln -vsT '$(TARGET)' '$(@)'



##############################################################################
endif # Include Guard
$(end_guard)
##############################################################################
