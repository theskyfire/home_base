##############################################################################
# Install PROG 

# install command and options
INSTALL_PRE		=
INSTALL_POST		=
INSTALL_ENV		=
INSTALL_CMD		=
INSTALL_OPT		=
INSTALL_SRC_PRE		=
INSTALL_SRC_POST	=
INSTALL_SRC_OPT		=
INSTALL_SRC		=
INSTALL_DEST_PRE	=
INSTALL_DEST_POST	=
INSTALL_DEST_OPT	=
INSTALL_DEST		=
INSTALL_BODY		=$(INSTALL_SRC_) $(INSTALL_DEST_)
INSTALL_SRC_		=$(INSTALL_SRC_PRE) $(INSTALL_SRC_OPT) $(INSTALL_SRC) $(INSTALL_SRC_POST)
INSTALL_DEST_		=$(INSTALL_DEST_PRE) $(INSTALL_DEST_OPT) $(INSTALL_DEST) $(INSTALL_DEST_POST)

define INSTALL 
$(INSTALL_PRE) $(INSTALL_ENV) $(INSTALL_CMD) $(INSTALL_OPT) $(INSTALL_BODY) $(INSTALL_POST)
endef

# tar gzip options
INSTALL_ENV		=MAKELEVEL=0 MAKEFLAGS= MAKEOVERRIDES=
INSTALL_CMD		=$(MY_MAKE)
INSTALL_OPT		=install

# Path where zip command is run
INSTALL_PATH		=$(BUILD_PATH)

# Set PROG
$(foreach prog,$(PROGS),$(eval INSTALL_$(prog): PROG=$(prog)))

# install all progs
.PHONY: install
install: build $(foreach prog,$(PROGS),install($(prog)))

# install a prog
install(%): build(%) INSTALL_% ;

# INSTALL_prog depends on install log
INSTALL_%: BUILD_% $(BUILD_DIR)/$$(*)/$$(*).install.log ;

# Extract log does command
.PRECIOUS: $(BUILD_DIR)/%.install.log
$(BUILD_DIR)/%.install.log: $(BUILD_DIR)/%.build.log | $$(dir $$(@))
	{
		trap "mv '$(@)' '$(@).err'" ERR ;
		cd '$(INSTALL_PATH)' ;
		$(INSTALL) ;
	} |& tee '$(@)'


