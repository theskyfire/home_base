##############################################################################
# Config PROG 

# configure command and options
CONFIG_PRE		=
CONFIG_POST		=
CONFIG_ENV		=
CONFIG_CMD		=
CONFIG_OPT		=
CONFIG_SRC_PRE		=
CONFIG_SRC_POST		=
CONFIG_SRC_OPT		=
CONFIG_SRC		=
CONFIG_DEST_PRE		=
CONFIG_DEST_POST	=
CONFIG_DEST_OPT		=
CONFIG_DEST		=
CONFIG_BODY		=$(CONFIG_SRC_) $(CONFIG_DEST_)
CONFIG_SRC_		=$(CONFIG_SRC_PRE) $(CONFIG_SRC_OPT) $(CONFIG_SRC) $(CONFIG_SRC_POST)
CONFIG_DEST_		=$(CONFIG_DEST_PRE) $(CONFIG_DEST_OPT) $(CONFIG_DEST) $(CONFIG_DEST_POST)

define CONFIG =
$(CONFIG_PRE) $(CONFIG_ENV) $(CONFIG_CMD) $(CONFIG_OPT) $(CONFIG_BODY) $(CONFIG_POST)
endef

# tar gzip options
CONFIG_CMD		=./configure
CONFIG_OPT		=--prefix='$(BASE_DIR)'

# Path where zip command is run
CONFIG_PATH		=$(EXTRACT_PATH)

# Set PROG
$(foreach prog,$(PROGS),$(eval CONFIG_$(prog): PROG=$(prog)))

# config all progs
.PHONY: config
config: patch $(foreach prog,$(PROGS),config($(prog)))

# config a prog
config(%): patch(%) CONFIG_% ;

# CONFIG_prog depends on config log
CONFIG_%: EXTRACT_% $(BUILD_DIR)/$$(*)/$$(*).config.log ;

# Extract log does command
.PRECIOUS: $(BUILD_DIR)/%.config.log
$(BUILD_DIR)/%.config.log: $(BUILD_DIR)/%.patch.log | $$(dir $$(@))
	{
		set -ex
		trap "mv '$(@)' '$(@).err'; exit 1" ERR
		cd '$(CONFIG_PATH)'
		$(CONFIG)
	} |& tee '$(@)'


