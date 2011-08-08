##############################################################################
# Build PROG 

# Build command and options
BUILD_PRE		=
BUILD_POST		=
BUILD_ENV		=
BUILD_CMD		=
BUILD_OPT		=
BUILD_SRC_PRE		=
BUILD_SRC_POST		=
BUILD_SRC_OPT		=
BUILD_SRC		=
BUILD_DEST_PRE		=
BUILD_DEST_POST		=
BUILD_DEST_OPT		=
BUILD_DEST		=
BUILD_BODY		=$(BUILD_SRC_) $(BUILD_DEST_)
BUILD_SRC_		=$(BUILD_SRC_PRE) $(BUILD_SRC_OPT) $(BUILD_SRC) $(BUILD_SRC_POST)
BUILD_DEST_		=$(BUILD_DEST_PRE) $(BUILD_DEST_OPT) $(BUILD_DEST) $(BUILD_DEST_POST)

define BUILD =
$(BUILD_PRE) $(BUILD_ENV) $(BUILD_CMD) $(BUILD_OPT) $(BUILD_BODY) $(BUILD_POST)
endef

# tar gzip options
BUILD_ENV		=MAKELEVEL=0 MAKEFLAGS= MAKEOVERRIDES=
BUILD_CMD		=$(MY_MAKE)

# Path where zip command is run
BUILD_PATH		=$(CONFIG_PATH)

# Set PROG
$(foreach prog,$(PROGS),$(eval BUILD_$(prog): PROG=$(prog)))

# build all progs
.PHONY: build
build: config $(foreach prog,$(PROGS),build($(prog)))

# build a prog
build(%): config(%) BUILD_% ;

# BUILD_prog depends on build log
BUILD_%: CONFIG_% $(BUILD_DIR)/$$(*)/$$(*).build.log ;

# Extract log does command
.PRECIOUS: $(BUILD_DIR)/%.build.log
$(BUILD_DIR)/%.build.log: $(BUILD_DIR)/%.config.log | $$(dir $$(@))
	{
		trap "mv '$(@)' '$(@).err'" ERR ;
		cd '$(BUILD_PATH)' ;
		$(BUILD) ;
	} |& tee '$(@)'


