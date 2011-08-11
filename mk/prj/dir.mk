##############################################################################
# HomeBase Directory Project
##############################################################################
# Include Guard
include $(GUARD)
ifdef FIRST_INCLUDE

include $(PRJ_DIR)/prj.tmpl

##############################################################################

# Directory Permissions
DIR_MODE		=0710

# List of Directories
DIRS			=

# List of Symlinks
LNKS			=

# List 
INSTALLDIRS		=
INSTALLDIRS		+=$(DIRS)
INSTALLDIRS		+=$(LNKS)

# HomeBase
BASE_DIR		=$(BASE)

#### Symlinks
# X_LNK= Path to Symlink's target [either Absolute or Relative to $(BASE_DIR)]
# $(X_LNK):  Prereq's for 
# DIRS: Append either Absolute $(X_LNK) or $(BASE_DIR)/$(X_LNK)
# X_DIR: Relative Path to Symlink from $(BASE_DIR)
# X_ROOT: Absolute Path to Symlink. [Use the Relative Path in X_DIR]
# LNKS: Append Absolute $(X_ROOT) Symlink
# $(X_DIR): | $(X_ROOT)  [X_DIR should delagate to X_ROOT]

# Common directory: symlink to mount, share, etc.
COMMON_DIR_BASE		=
COMMON_DIR		=$(COMMON)
DIRS			+=$(COMMON_DIR)
$(COMMON_DIR):
.PHONY: $(COMMON_DIR_BASE)
#$(COMMON_DIR_BASE):	| $(COMMON_DIR)

COMMON_LNK_BASE		=$(COMMON_NAME)
COMMON_LNK		=$(BASE_DIR)/$(COMMON_LNK_BASE)
LNKS			+=$(COMMON_LNK)
$(COMMON_LNK):		| $(BASE_DIR) $(COMMON_DIR)
.PHONY: $(COMMON_LNK_BASE)
$(COMMON_LNK_BASE):	| $(COMMON_LNK)

# Source Code Repository
SRC_DIR_BASE		=$(COMMON_LNK_BASE)/$(SRC_NAME)
SRC_DIR			=$(COMMON_LNK)/$(SRC_NAME)
DIRS			+=$(SRC_DIR)
$(SRC_DIR):		| $(COMMON_LNK)
.PHONY: $(SRC_DIR_BASE)
$(SRC_DIR_BASE):	| $(SRC_DIR)

SRC_LNK_BASE		=$(SRC_NAME)
SRC_LNK			=$(BASE_DIR)/$(SRC_LNK_BASE)
LNKS			+=$(SRC_LNK)
$(SRC_LNK):		| $(BASE_DIR) $(SRC_DIR_BASE)
.PHONY: $(SRC_LNK_BASE)
$(SRC_LNK_BASE):	| $(SRC_LNK)

# Shared State Directory
COM_DIR_BASE		=$(COMMON_LNK_BASE)/$(COM_NAME)
COM_DIR			=$(COMMON_LNK)/$(COM_NAME)
DIRS			+=$(COM_DIR)
$(COM_DIR):		| $(COMMON_LNK)
.PHONY: $(COM_DIR_BASE)
$(COM_DIR_BASE):	| $(COM_DIR)

COM_LNK_BASE		=$(COM_NAME)
COM_LNK			=$(BASE_DIR)/$(COM_LNK_BASE)
LNKS			+=$(COM_LNK)
$(COM_LNK):		| $(BASE_DIR) $(COM_DIR_BASE)
.PHONY: $(COM_LNK_BASE)
$(COM_LNK_BASE):	| $(COM_LNK)

# Data Root
SHARE_DIR_BASE		=$(COMMON_LNK_BASE)/$(SHARE_NAME)
SHARE_DIR		=$(COMMON_LNK)/$(SHARE_NAME)
DIRS			+=$(SHARE_DIR)
$(SHARE_DIR):		| $(COMMON_LNK)
.PHONY: $(SHARE_DIR_BASE)
$(SHARE_DIR_BASE):	| $(SHARE_DIR)

SHARE_LNK_BASE		=$(SHARE_NAME)
SHARE_LNK		=$(BASE_DIR)/$(SHARE_LNK_BASE)
LNKS			+=$(SHARE_LNK)
$(SHARE_LNK):		| $(BASE_DIR) $(SHARE_DIR_BASE)
.PHONY: $(SHARE_LNK_BASE)
$(SHARE_LNK_BASE):	| $(SHARE_LNK)

# Man Root
MAN_DIR_BASE		=$(SHARE_LNK_BASE)/$(MAN_NAME)
MAN_DIR			=$(SHARE_LNK)/$(MAN_NAME)
DIRS			+=$(MAN_DIR)
$(MAN_DIR):		| $(SHARE_LNK)
.PHONY: $(MAN_DIR_BASE)
$(MAN_DIR_BASE):	| $(MAN_DIR)

MAN_LNK_BASE		=$(MAN_NAME)
MAN_LNK			=$(BASE_DIR)/$(MAN_LNK_BASE)
LNKS			+=$(MAN_LNK)
$(MAN_LNK):		| $(BASE_DIR) $(MAN_DIR_BASE)
.PHONY: $(MAN_LNK_BASE)
$(MAN_LNK_BASE):	| $(MAN_LNK)

# GNU Makefile
MK_FILE_BASE		=
MK_FILE			=$(COMMON_LNK_BASE)/homebase.mk
$(MK_FILE):		| $(COMMON_LNK) ;
.PHONY: $(MK_FILE_BASE)
#$(MK_FILE_BASE):	| $(MK_FILE)

MK_FILE_LNK_BASE	=GNUmakefile
MK_FILE_LNK		=$(BASE_DIR)/$(MK_FILE_LNK_BASE)
LNKS			+=$(MK_FILE_LNK)
$(MK_FILE_LNK):		| $(BASE_DIR) $(MK_FILE)
.PHONY: $(MK_FILE_LNK_BASE)
$(MK_FILE_LNK_BASE):	| $(MK_FILE_LNK)

# Temp Location
TMP_DIR			=$(BASE_DIR)/$(TMP_NAME)
DIRS			+=$(TMP_DIR)
$(TMP_DIR):		| $(BASE_DIR)

# Build Root
BUILD_DIR		=$(TMP_DIR)/$(BUILD_NAME)
DIRS			+=$(BUILD_DIR)
$(BUILD_DIR):		| $(TMP_DIR)

# Install Locations
BIN_DIR			=$(BASE_DIR)/$(BIN_NAME)
DIRS			+=$(BIN_DIR)
$(BIN_DIR):		| $(BASE_DIR)

SBIN_DIR		=$(BASE_DIR)/$(SBIN_NAME)
DIRS			+=$(SBIN_DIR)
$(SBIN_DIR):		| $(BASE_DIR)

LIBEXEC_DIR		=$(BASE_DIR)/$(LIBEXEC_NAME)
DIRS			+=$(LIBEXEC_DIR)
$(LIBEXEC_DIR):		| $(BASE_DIR)

ETC_DIR			=$(BASE_DIR)/$(ETC_NAME)
DIRS			+=$(ETC_DIR)
$(ETC_DIR):		| $(BASE_DIR)

VAR_DIR			=$(BASE_DIR)/$(VAR_NAME)
DIRS			+=$(VAR_DIR)
$(VAR_DIR):		| $(BASE_DIR)

INCLUDE_DIR		=$(BASE_DIR)/$(INCLUDE_NAME)
DIRS			+=$(INCLUDE_DIR)
$(INCLUDE_DIR):		| $(BASE_DIR)

LIB_DIR			=$(BASE_DIR)/$(LIB_NAME)
DIRS			+=$(LIB_DIR)
$(LIB_DIR):		| $(BASE_DIR)

DOC_DIR			=$(SHARE_DIR)/$(DOC_NAME)
DIRS			+=$(DOC_DIR)
$(DOC_DIR):		| $(SHARE_DIR)

INFO_DIR		=$(SHARE_DIR)/$(INFO_NAME)
DIRS			+=$(INFO_DIR)
$(INFO_DIR):		| $(SHARE_DIR)

LOCALE_DIR		=$(SHARE_DIR)/$(LOCALE_NAME)
DIRS			+=$(LOCALE_DIR)
$(LOCALE_DIR):		| $(SHARE_DIR)

# URL's
#GNU_URL			=ftp://ftp.gnu.org/pub/gnu
GNU_URL			=http://mirrors.kernel.org/gnu


##############################################################################
# Basic HomeBase Layout

$(get_$(PRJ)):		get_CMD=$(NOP)

$(install_$(PRJ)):	install_CMD=$(NOP)

$(install_$(PRJ)):	$(INSTALLDIRS)

.PHONY: installdirs
installdirs: $(PRJ)

$(BASE_DIR):
	[ -r '$(MY_MAKEFILE)' ]
	[ ! -e '$(BASE_DIR)' ]
	[ -d '$(COMMON_DIR)' ]
	mkdir -vp '$(@)'

$(DIRS):
	[ -d '$(@)' ] || mkdir -v --mode='$(DIR_MODE)' '$(@)'

$(LNKS):
	ln -vsT '$(lastword $(|))' '$(@)'

##############################################################################
# GNU Install Paths [Should not be overriden]
# PREFIX			=$(BASE)
# EXEC_PREFIX		=$(PREFIX)
# BINDIR			=$(EXEC_PREFIX)/$(BIN_NAME)
# SBINDIR			=$(EXEC_PREFIX)/$(SBIN_NAME)
# LIBEXECDIR		=$(EXEC_PREFIX)/$(LIBEXEC_NAME)
# DATAROOTDIR		=$(PREFIX)/$(SHARE_NAME)
# DATADIR			=$(DATAROOTDIR)
# SYSCONFDIR		=$(PREFIX)/$(ETC_NAME)
# SHAREDSTATEDIR		=$(PREFIX)/$(COM_NAME)
# LOCALSTATEDIR		=$(PREFIX)/$(VAR_NAME)
# INCLUDEDIR		=$(PREFIX)/$(INCLUDE_NAME)
# OLDINCLUDEDIR		=
# DOCDIR			=$(DATAROOTDIR)/$(DOC_NAME)
# INFODIR			=$(DATAROOTDIR)/$(INFO_NAME)
# LIBDIR			=$(EXEC_PREFIX)/$(LIB_NAME)
# LOCALEDIR		=$(DATAROOTDIR)/$(LOCALE_NAME)
# SRCDIR			=$(PREFIX)/$(SRC_NAME)
# MANDIR			=$(DATAROOTDIR)/$(MAN_NAME)
# MAN1DIR			=$(MAN_DIR)/$(MAN_NAME)1
# MAN2DIR			=$(MAN_DIR)/$(MAN_NAME)2
# MAN3DIR			=$(MAN_DIR)/$(MAN_NAME)3
# MAN4DIR			=$(MAN_DIR)/$(MAN_NAME)4
# MAN5DIR			=$(MAN_DIR)/$(MAN_NAME)5
# MAN6DIR			=$(MAN_DIR)/$(MAN_NAME)6
# MAN7DIR			=$(MAN_DIR)/$(MAN_NAME)7
# MAN8DIR			=$(MAN_DIR)/$(MAN_NAME)8
# MANEXT			=$(MAN1EXT)
# MAN1EXT			=.1
# MAN2EXT			=.2
# MAN3EXT			=.3
# MAN4EXT			=.4
# MAN5EXT			=.5
# MAN6EXT			=.6
# MAN7EXT			=.7
# MAN8EXT			=.8

endif # END Include Guard
include $(END_GUARD)
##############################################################################
