##############################################################################
# Install Stage
##############################################################################
# Include Guard
include $(GUARD)
ifdef FIRST_INCLUDE

include $(STAGE_DIR)/stage.tmpl

$(STAGE)_ENV		+=MAKELEVEL=0
$(STAGE)_ENV		+=MAKEFLAGS=
$(STAGE)_ENV		+=MAKEOVERRIDES=

$(STAGE)_PROG		=$(MY_MAKE)

$(STAGE)_ARG		=install

$(STAGE)_PATH		=$(BUILD_PATH)

# Path where zip command is run
INSTALL_PATH		=$(BUILD_PATH)

# install a prog
#install(%): build(%) ;

# INSTALL_prog depends on install log
#INSTALL_%: BUILD_%

#$(BUILD_DIR)/$(STAGE).%.log: $(BUILD_DIR)/build.%.log

endif # END Include Guard
include $(END_GUARD)
##############################################################################
