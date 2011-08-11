##############################################################################
# Install Stage
##############################################################################
include $(STAGE_TMPL)
ifdef FIRST_INCLUDE
##############################################################################

$(THIS)_ENV		+=MAKELEVEL=0
$(THIS)_ENV		+=MAKEFLAGS=
$(THIS)_ENV		+=MAKEOVERRIDES=

$(THIS)_PROG		=$(MY_MAKE)

$(THIS)_ARG		=install

$(THIS)_PATH		=$(BUILD_PATH)

# Path where zip command is run
INSTALL_PATH		=$(BUILD_PATH)

# install a prog
#install(%): build(%) ;

# INSTALL_prog depends on install log
#INSTALL_%: BUILD_%

#$(BUILD_DIR)/$(STAGE).%.log: $(BUILD_DIR)/build.%.log

endif # END Include Guard
include $(END_STAGE_TMPL)
##############################################################################
