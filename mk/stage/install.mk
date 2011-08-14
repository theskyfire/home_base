##############################################################################
# Install Stage
##############################################################################
include $(stage_tmpl)
ifdef FIRST_INCLUDE
##############################################################################

$(this)_ENV		+=MAKELEVEL=0
$(this)_ENV		+=MAKEFLAGS=
$(this)_ENV		+=MAKEOVERRIDES=
$(this)_PROG		=$(my_MAKE)
$(this)_ARG		=install
$(this)_PATH		=$(build_PATH)

# Path where zip command is run
#INSTALL_PATH		=$(BUILD_PATH)
# install a prog
#install(%): build(%) ;
# INSTALL_prog depends on install log
#INSTALL_%: BUILD_%
#$(BUILD_DIR)/$(STAGE).%.log: $(BUILD_DIR)/build.%.log
##############################################################################
endif # END Include Guard
include $(end_stage_tmpl)
##############################################################################
