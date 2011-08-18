##############################################################################
# Vim Project
##############################################################################
include $(guard)
ifdef FIRST_INCLUDE
include $(prj.tmpl)
##############################################################################

get.$(this).DEP		=install(bash)
$(this).URL		=ftp://ftp.vim.org/pub/vim/unix/vim-7.3.tar.bz2

patch.$(this).PATH	=$(build)/$(PRJ)/vim73/src
patch($(this)):		patch.CMD=$(nop)

config($(this)):	config.ARG+=--enable-cscope
config($(this)):	config.ARG+=--enable-multibyte
config($(this)):	config.ARG+=--enable-hangulinput
config($(this)):	config.ARG+=--enable-fontset
config($(this)):	config.ARG+=--without-local-dir
config($(this)):	config.ARG+=--with-modified-by=lester
config($(this)):	config.ARG+=--with-features=huge
config($(this)):	config.ARG+=--with-compiledby=lester


##############################################################################
endif # END Include Guard
$(end_guard)
##############################################################################
