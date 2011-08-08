##############################################################################
# Extract PROG 

# Unzip command and options
EXTRACT_PRE		=
EXTRACT_POST		=
EXTRACT_ENV		=
EXTRACT_CMD		=
EXTRACT_OPT		=
EXTRACT_SRC_PRE		=
EXTRACT_SRC_POST	=
EXTRACT_SRC_OPT		=
EXTRACT_SRC		=
EXTRACT_DEST_PRE	=
EXTRACT_DEST_POST	=
EXTRACT_DEST_OPT	=
EXTRACT_DEST		=
EXTRACT_BODY		=$(EXTRACT_SRC_) $(EXTRACT_DEST_)
EXTRACT_SRC_		=$(EXTRACT_SRC_PRE) $(EXTRACT_SRC_OPT) $(EXTRACT_SRC) $(EXTRACT_SRC_POST)
EXTRACT_DEST_		=$(EXTRACT_DEST_PRE) $(EXTRACT_DEST_OPT) $(EXTRACT_DEST) $(EXTRACT_DEST_POST)

define EXTRACT =
$(EXTRACT_PRE) $(EXTRACT_ENV) $(EXTRACT_CMD) $(EXTRACT_OPT) $(EXTRACT_BODY) $(EXTRACT_POST)
endef

# tar gzip options
EXTRACT_CMD		=tar
EXTRACT_GZIP_OPT	=z
EXTRACT_BZIP2_OPT	=j
EXTRACT_ZIP_OPT		=$(EXTRACT_GZIP_OPT)
EXTRACT_SRC_OPT		=vx$(EXTRACT_ZIP_OPT)f

# Path where zip command is run
EXTRACT_PATH		=$(BUILD_DIR)/$(PROG)

# Set PROG
$(foreach prog,$(PROGS),$(eval EXTRACT_$(prog): PROG=$(prog)))

# extract all progs
.PHONY: extract
extract: get $(foreach prog,$(PROGS),extract($(prog)))

# extract a prog
extract(%): get(%) EXTRACT_% ;

# EXTRACT_prog depends on extract log
EXTRACT_%: GET_% $$(BUILD_DIR)/$$(*)/$$(*).extract.log ;

# Extract log does command
.PRECIOUS: $(BUILD_DIR)/%.extract.log
$(BUILD_DIR)/%.extract.log: $(SRC_DIR)/%.get.log | $$(dir $$(@))
	{
		trap "mv '$(@)' '$(@).err'" ERR ;
		cd '$(EXTRACT_PATH)' ;
		$(EXTRACT) ;
	} |& tee '$(@)'

# $(BUILD_DIR)/$(PROJ)
.PRECIOUS: $(BUILD_DIR)/%/
$(BUILD_DIR)/%/: | $(BUILD_DIR)
	mkdir -vp '$(@)'


