##############################################################################
# Setup Make

include $(directories.mk)

NAME.make		=make
TMP.make		=$(tmp_base)/$(bin)/$(NAME.make)
BASE.make		=$(bin)/$(NAME.make)
PATH.make		=\
	$(call .first.of,\
		$(wildcard $(BASE.make)) \
		$(wildcard $(TMP.make)) \
		$(MAKE) \
	)
FLAGS.make		=
CURDIR.make		=
GOALS.make		=
OVERRIDES.make		=
ENV.make		=

# only build serially
.NOTPARALLEL:

# Expand prereq's twice
.SECONDEXPANSION:

# Make Configuration

my.MAKE_CMD		=make
tmp.MAKE		=$(tmp_base)/$(bin)/$(my.MAKE_CMD)
base.MAKE		=$(bin)/$(my.MAKE_CMD)
my.MAKE			=$(firstword \
	$(wildcard $(base.MAKE) $(tmp.MAKE)) $(MAKE)\
)
my.MAKEFLAGS		=
my.MAKEFLAGS		+=--warn-undefined-variables
my.MAKEFLAGS		+=$(if $(DEBUG),-wRrpd,-wRr)
my.CURDIR		=-C $(CURDIR)
my.MAKECMDGOALS		=$(subst 'bootstrap',,\
	$(foreach goal,$(or $(MAKECMDGOALS),$(.DEFAULT_GOAL)),'$(goal)')\
)
define EscGoals =
{ 
	shopt -s extglob ;
	goals='  $(strip $(or $(MAKECMDGOALS),$(.DEFAULT_GOAL)))' ;
	while [[ -n "$${goals}" ]]; do
		goals="$${goals##+( )}" ;
		if [[ "$${goals}" =~ ^[^\(\ ]+\   ]]; then
			cmd="'$${BASH_REMATCH[0]}'"
			goals=' ' ;
		else
			cmd="'$${goals}'"
			goals='' ;
		fi ;
	done ;
	echo "$${cnd}" ;
}
endef
#my.MAKECMDGOALS		:=$(shell $(EscGoals))
my.MAKEOVERRIDES	=$(MAKEOVERRIDES)
my.MAKE_ENV		=
my.MAKE_ENV		+=MAKELEVEL=0
my.MAKE_ENV		+=MAKEFLAGS=''
my.MAKE_ENV		+=MAKEOVERRIDES=''

bootstrap		 =$(my.MAKE_ENV)
bootstrap		+=$(my.MAKE)
bootstrap		+=-f '$(my.MAKEFILE)'
bootstrap		+=$(my.MAKEFLAGS)
bootstrap		+=$(my.CURDIR)
bootstrap		+=$(my.MAKECMDGOALS)
bootstrap		+=$(my.MAKEOVERRIDES)

$(MAKE)			=$(my.MAKE)

##############################################################################
# Make Project
##############################################################################
# Include Guard
include $(GUARD)
ifdef FIRST_INCLUDE

include $(PRJ_DIR)/prj.tmpl

$(get_$(PRG)): dir


install_$(PRJ):

#.PHONY: make
#make: installdirs $(MY_MAKE)

#$(MY_MAKE): installdi/tmp/homebase/$(BASE_DIR)/bin/make
#	$(MAKE) -C '$(COMMON_DIR)' install BASE='$(BASE_DIR)'

#/tmp/homebase/$(BASE_DIR)/bin/make:
#	$(MAKE) -C '$(COMMON_DIR)' BASE='$(BASE_DIR)'


endif # END Include Guard
include $(END_GUARD)
##############################################################################
