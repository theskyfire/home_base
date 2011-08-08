#### vim
$(START_PRJ)

MY_VIM		=$(BIN_DIR)/vim

#GET_vim: install(bash)
GET_$(PRJ):	install(dir)
GET_$(PRJ):	install(bash)

GET_$(PRJ):	GET_SRC=ftp://ftp.vim.org/pub/vim/unix/vim-7.3.tar.bz2
#GET_vim: 	GET_DEST=vim-7.3.tar.bz2

EXTRACT_vim:	EXTRACT_SRC=$(SRC_DIR)/vim/vim-7.3.tar.bz2
EXTRACT_vim:	EXTRACT_ZIP_OPT=$(EXTRACT_BZIP2_OPT)

PATCH_vim:	PATCH=

CONFIG_vim:	CONFIG_PATH=$(EXTRACT_PATH)/vim73/src
CONFIG_vim:	CONFIG_OPT+=--enable-cscope
CONFIG_vim:	CONFIG_OPT+=--enable-multibyte
CONFIG_vim:	CONFIG_OPT+=--enable-hangulinput
CONFIG_vim:	CONFIG_OPT+=--enable-fontset
CONFIG_vim:	CONFIG_OPT+=--without-local-dir
CONFIG_vim:	CONFIG_OPT+=--with-modified-by=lester
CONFIG_vim:	CONFIG_OPT+=--with-features=huge
CONFIG_vim:	CONFIG_OPT+=--with-compiledby=lester

BUILD_vim:	BUILD_PATH=$(EXTRACT_PATH)/vim73/src

INSTALL_vim:	INSTALL_PATH=$(EXTRACT_PATH)/vim73/src

$(END_PRJ)
