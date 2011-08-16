##############################################################################
# Extract Stage
##############################################################################
include $(stage_tmpl)
ifdef FIRST_INCLUDE
##############################################################################

$(this)_PROG		=patch
$(this)_ARG		=-p0
$(this)_PATH		=$(extract_PATH)

# patch -> extract
$(this)($(prjs)): get($$(%))

##############################################################################
endif # END Include Guar
include $(end_stage_tmpl)
##############################################################################
##############################################################################
# Patch PROG 

# patch command and options
PATCH_PRE		=
PATCH_POST		=
PATCH_ENV		=
PATCH_CMD		=
PATCH_OPT		=
PATCH_SRC_PRE		=
PATCH_SRC_POST		=
PATCH_SRC_OPT		=
PATCH_SRC		=
PATCH_DEST_PRE		=
PATCH_DEST_POST		=
PATCH_DEST_OPT		=
PATCH_DEST		=
PATCH_BODY		=$(PATCH_SRC_) $(PATCH_DEST_)
PATCH_SRC_		=$(PATCH_SRC_PRE) $(PATCH_SRC_OPT) $(PATCH_SRC) $(PATCH_SRC_POST)
PATCH_DEST_		=$(PATCH_DEST_PRE) $(PATCH_DEST_OPT) $(PATCH_DEST) $(PATCH_DEST_POST)

define PATCH =
$(PATCH_PRE) $(PATCH_ENV) $(PATCH_CMD) $(PATCH_OPT) $(PATCH_BODY) $(PATCH_POST)
endef

# tar gzip options
PATCH_CMD		=patch
PATCH_OPT		=-p0

# Path where zip command is run
PATCH_PATH		=$(BUILD_DIR)/$(PROG)

# Set PROG
$(foreach prog,$(PROGS),$(eval PATCH_$(prog): PROG=$(prog)))

# patch all progs
.PHONY: patch
patch: extract $(foreach prog,$(PROGS),patch($(prog)))

# patch a prog
patch(%): extract(%) PATCH_% ;

# PATCH_prog depends on patch log
PATCH_%: EXTRACT_% $$(BUILD_DIR)/$$(*)/$$(*).patch.log ;

# patch log does command
.PRECIOUS: $(BUILD_DIR)/%.patch.log
$(BUILD_DIR)/%.patch.log: $(BUILD_DIR)/%.extract.log | $$(dir $$(@))
	{
		trap "mv '$(@)' '$(@).err'" ERR ;
		cd '$(PATCH_PATH)' ;
		$(PATCH) ;
	} |& tee '$(@)'


