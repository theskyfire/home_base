# Shell Configuration
my.SHELL_CMD		=bash
tmp.SHELL		=$(tmp_base)/$(bin)/$(my.SHELL_CMD)
base.SHELL		=$(bin)/$(my.SHELL_CMD)
my.SHELL		=$(firstword \
	$(wildcard $(base.SHELL) $(tmp.SHELL)) /bin/bash /bin/sh \
)
is.bash			=$(findstring bash,$(my.SHELL))
my.SHELLFLAGS		=$(if $(is.bash),-ec,-c)

SHELL			:=$(my.SHELL)
.SHELLFLAGS		:=$(my.SHELLFLAGS)

# all lines of a recipe are exec'ed by the same shell instance
# beware lines starting with '@' '-' '+'
$(and $(is.bash), .ONESHELL:)

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

patch($(this)):		patch.PROG_PRE=cat
patch($(this)):		patch.ARG_PRE='$(src)'/bash/bash42*
patch($(this)):		patch.PIPE_PRE=|

install($(this)):	install.PIPE=;
install($(this)):	install.PROG_POST=ln
install($(this)):	install.ARG_POST=-vsT
install($(this)):	install.ARG_POST+='../$(common.LNK_NAME)/conf/bashrc'
install($(this)):	install.ARG_POST+='$(etc)/bashrc'

##############################################################################
endif # END Include Guard
$(end_guard)
##############################################################################
