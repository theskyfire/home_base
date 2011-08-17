##############################################################################
# Bash Project
##############################################################################
include $(guard)
ifdef FIRST_INCLUDE
include $(prj.tmpl)
##############################################################################

# require that dir is installed
get.$(this).DEP		=install(dir)

$(this).URL		 =$(gnu.url)/bash/bash-4.2.tar.gz
$(this).URL		+=$(gnu.url)/bash/bash-4.2-patches/bash42-001
$(this).URL		+=$(gnu.url)/bash/bash-4.2-patches/bash42-002
$(this).URL		+=$(gnu.url)/bash/bash-4.2-patches/bash42-003
$(this).URL		+=$(gnu.url)/bash/bash-4.2-patches/bash42-004
$(this).URL		+=$(gnu.url)/bash/bash-4.2-patches/bash42-005
$(this).URL		+=$(gnu.url)/bash/bash-4.2-patches/bash42-006
$(this).URL		+=$(gnu.url)/bash/bash-4.2-patches/bash42-007
$(this).URL		+=$(gnu.url)/bash/bash-4.2-patches/bash42-008
$(this).URL		+=$(gnu.url)/bash/bash-4.2-patches/bash42-009
$(this).URL		+=$(gnu.url)/bash/bash-4.2-patches/bash42-010

patch.$(this).PATH	=$(build)/bash/bash-4.2

#patch($(this)):		patch.PATH=$(build)/bash/bash-4.2
patch($(this)):		patch.REDIR_PRE=cat '$(src)'/bash/bash42* |

#config($(this)):	config.PATH=$(build)/bash/bash-4.2
#build($(this)):		build.PATH=$(build)/bash/bash-4.2
#stage($(this)):		stage.PATH=$(build)/bash/bash-4.2
#install($(this)):	install.PATH=$(build)/bash/bash-4.2

##############################################################################
endif # END Include Guard
$(end_guard)
##############################################################################
