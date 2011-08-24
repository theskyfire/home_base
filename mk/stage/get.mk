##############################################################################
# Get Stage
##############################################################################
include $(guard)
ifdef FIRST_INCLUDE
include $(stage.tmpl)
##############################################################################

# URL's
#gnu.url			=ftp://ftp.gnu.org/pub/gnu
gnu.url			=http://mirrors.kernel.org/gnu

$(this).PROG		=wget
$(this).ARG		 =-N
$(this).ARG		+=$($(PRJ).URL)
$(this).PATH		=$(src)/$(PRJ)

$(this)($(prjs)):	CMD=env

# Set defaults
$(foreach p,$(prjs),$(eval $(p).URL?=))

##############################################################################
endif # END Include Guard
$(end_guard)
##############################################################################
