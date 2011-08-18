##############################################################################
# Screen Project
##############################################################################
include $(guard)
ifdef FIRST_INCLUDE
include $(prj.tmpl)
##############################################################################

# XXX NOTE this get.PROG was overridding git's default get.PROG
get.$(this).DEP		=install(git)
get($(this)):		get.PROG=$(bin)/git
get($(this)):		get.ARG=clone http://git.savannah.gnu.org/r/screen.git

extract($(this)):	extract.PROG=cp
extract($(this)):	extract.ARG=-av $(src)/screen/screen .

patch.$(this).PATH	=$(build)/$(PRJ)/screen/src
patch($(this)):		patch.CMD=$(nop)

config($(this)):	config.REDIR_PRE=./autogen.sh &&
config($(this)):	config.ARG+=--with-socket-dir='$(base)/screen'
config($(this)):	config.ARG+=--with-sys-screenrc='$(etc)/screenrc'
##############################################################################
endif # END Include Guard
$(end_guard)
##############################################################################