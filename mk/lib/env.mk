########################################################################
# Environment macros
########################################################################
include $(guard)
ifdef $(.FIRST.INCLUDE)
########################################################################

.get.env.HOME		=\
$(or\
	$(HOME),\
	$(shell cd 2>/dev/null ; pwd)\
)

.get.env.USER		=\
$(or\
	$(LOGNAME),\
	$(USER),\
	$(LNAME),\
	$(USERNAME),\
	$(shell whoami),\
	$(shell id -u -n 2>/dev/null ),\
	$(shell who am i 2>/dev/null ),\
)

.get.env.TMPDIR		=\
$(or\
	$(TMPDIR),\
	$(TEMP),\
	$(TMP),\
	/tmp,\
)

########################################################################
endif # .FIRST.INCLUDE
