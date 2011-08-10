##############################################################################
# Git Project
##############################################################################
# Include Guard
include $(GUARD)
ifdef FIRST_INCLUDE

include $(PRJ_DIR)/prj.tmpl

get_$(PRJ):		install(bash)
get_$(PRJ):		get_URL=http://www.kernel.org/pub/software/scm/git/git-1.7.6.tar.bz2

MY_GIT			=$(BIN_DIR)/git

include $(END_GUARD)
endif # END Include Guard
##############################################################################
EXTRACT_git:	EXTRACT_SRC=$(SRC_DIR)/git/git-1.7.6.tar.bz2
EXTRACT_git:	EXTRACT_ZIP_OPT=$(EXTRACT_BZIP2_OPT)
PATCH_git:	PATCH=
CONFIG_git:	CONFIG_PATH=$(EXTRACT_PATH)/git-1.7.6
BUILD_git:	BUILD_PATH=$(EXTRACT_PATH)/git-1.7.6
INSTALL_git:	INSTALL_PATH=$(EXTRACT_PATH)/git-1.7.6
