#### git
MY_GIT		=$(BIN_DIR)/git

GET_git: install(bash)

GET_git:	GET_SRC=http://www.kernel.org/pub/software/scm/git/git-1.7.6.tar.bz2
#GET_git:	GET_DEST=git-1.7.6.tar.bz2

EXTRACT_git:	EXTRACT_SRC=$(SRC_DIR)/git/git-1.7.6.tar.bz2
EXTRACT_git:	EXTRACT_ZIP_OPT=$(EXTRACT_BZIP2_OPT)

PATCH_git:	PATCH=

CONFIG_git:	CONFIG_PATH=$(EXTRACT_PATH)/git-1.7.6

BUILD_git:	BUILD_PATH=$(EXTRACT_PATH)/git-1.7.6

INSTALL_git:	INSTALL_PATH=$(EXTRACT_PATH)/git-1.7.6


