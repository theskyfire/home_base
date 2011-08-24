##############################################################################
# Create Command Sequence

#define CMD_SEQ =
#{
#	trap "mv '$($(STAGE).LOG)' '$($(STAGE).LOG).err'" ERR ;
#	set -x ;
#	cd '$($(STAGE).$(PRJ).PATH)' ;
#	$(CMD_PRE) $(CMD) $(CMD_POST) ;
#} 2>&1 | tee '$(@)' ; exit $${PIPESTATUS[0]}
#endef
#
#ENV_PRE		=
#PROG_PRE	=
#ARG_PRE		=
#PIPE_PRE	=
#CMD_PRE		 =$(ENV_PRE)
#CMD_PRE		+=$(PROG_PRE)
#CMD_PRE		+=$(ARG_PRE)
#CMD_PRE		+=$(PIPE_PRE)
#
#ENV		=
#PROG		=$(nop)
#ARG		=
#PIPE		=
#CMD		 =$(ENV)
#CMD		+=$(PROG)
#CMD		+=$(ARG)
#CMD		+=$(PIPE)
#
#ENV_POST	=
#PROG_POST	=
#ARG_POST	=
#PIPE_POST	=
#CMD_POST	 =$(ENV_POST)
#CMD_POST	+=$(PROG_POST)
#CMD_POST	+=$(ARG_POST)
#CMD_POST	+=$(PIPE_POST)

##############################################################################

