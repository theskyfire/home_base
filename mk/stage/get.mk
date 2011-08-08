##############################################################################
# Get PROG 
##############################################################################

# Download command and options
GET_PRE			=
GET_POST		=
GET_ENV			=
GET_CMD			=
GET_OPT			=
GET_SRC_PRE		=
GET_SRC_POST		=
GET_SRC_OPT		=
GET_SRC			=
GET_DEST_PRE		=
GET_DEST_POST		=
GET_DEST_OPT		=
GET_DEST		=
GET_BODY		=$(GET_DEST_) $(GET_SRC_)
GET_SRC_		=$(GET_SRC_PRE) $(GET_SRC_OPT) $(GET_SRC) $(GET_SRC_POST)
GET_DEST_		=$(GET_DEST_PRE) $(GET_DEST_OPT) $(GET_DEST) $(GET_DEST_POST)

define GET =
$(GET_PRE) $(GET_ENV) $(GET_CMD) $(GET_OPT) $(GET_BODY) $(GET_POST)
endef

# wget options
GET_CMD			=wget

# Path where get command is run
GET_PATH		=$(SRC_DIR)/$(PROG)

# Set PROG
$(foreach prog,$(PROGS),$(eval GET_$(prog): PROG=$(prog)))

# get all progs
.PHONY: get
get: $(foreach prog,$(PROGS),get($(prog)))

# get a prog
get(%): GET_% ;

# GET_prog depends on get log
GET_%: $(SRC_DIR)/$$(*)/$$(*).get.log ;

# Get log does command
.PRECIOUS: $(SRC_DIR)/%.get.log
$(SRC_DIR)/%.get.log: | $$(dir $$(@))
	{
		trap "mv '$(@)' '$(@).err'" ERR ;
		cd '$(GET_PATH)' ;
		$(GET) ;
	} |& tee '$(@)'

# $(SRC_DIR)/$(PROJ)
.PRECIOUS: $(SRC_DIR)/%/
$(SRC_DIR)/%/: | $(SRC_DIR)
	mkdir -vp '$(@)'


