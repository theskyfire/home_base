##############################################################################
# HomeBase Directory Project
##############################################################################
include $(guard)
ifdef FIRST_INCLUDE
include $(prj.tmpl)
##############################################################################
# Basic HomeBase Layout

# Nop all stage commands
get($(this)):		get.CMD=$(nop)
get($(this)):		CMD=$(nop)
extract($(this)):	extract.CMD=$(nop)
patch($(this)):		patch.CMD=$(nop)
config($(this)):	config.CMD=$(nop)
build($(this)):		build.CMD=$(nop)
stage($(this)):		stage.CMD=$(nop)
install($(this)):	install.CMD=$(nop)

install.$(this).ORDER =$(dirs.EXPAND)
install.$(this).ORDER+=$(lnks.EXPAND)

##############################################################################
endif # END Include Guard
$(end_guard)
##############################################################################
