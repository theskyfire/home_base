##############################################################################
# Bash Project
##############################################################################
include $(guard)
ifdef FIRST_INCLUDE
include $(prj_tmpl)
##############################################################################

# require that dir is installed
get_$(this)_SP_DEP	=install(dir)

$(this)_URL		 =$(gnu_url)/bash/bash-4.2.tar.gz
$(this)_URL		+=$(gnu_url)/bash/bash-4.2-patches/bash42-001
$(this)_URL		+=$(gnu_url)/bash/bash-4.2-patches/bash42-002
$(this)_URL		+=$(gnu_url)/bash/bash-4.2-patches/bash42-003
$(this)_URL		+=$(gnu_url)/bash/bash-4.2-patches/bash42-004
$(this)_URL		+=$(gnu_url)/bash/bash-4.2-patches/bash42-005
$(this)_URL		+=$(gnu_url)/bash/bash-4.2-patches/bash42-006
$(this)_URL		+=$(gnu_url)/bash/bash-4.2-patches/bash42-007
$(this)_URL		+=$(gnu_url)/bash/bash-4.2-patches/bash42-008
$(this)_URL		+=$(gnu_url)/bash/bash-4.2-patches/bash42-009
$(this)_URL		+=$(gnu_url)/bash/bash-4.2-patches/bash42-010

patch($(this)):		patch_PATH=$(build)/bash/bash-4.2
patch($(this)):		patch_REDIR_PRE=cat '$(src)'/bash/bash42* |

config($(this)):	config_PATH=$(build)/bash/bash-4.2
build($(this)):		build_PATH=$(build)/bash/bash-4.2
stage($(this)):		stage_PATH=$(build)/bash/bash-4.2
install($(this)):	install_PATH=$(build)/bash/bash-4.2

##############################################################################
endif # END Include Guard
$(end_guard)
##############################################################################
