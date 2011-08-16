##############################################################################
# Bash Project
##############################################################################
include $(prj_tmpl)
ifdef FIRST_INCLUDE
##############################################################################

get($(this)): install(dir)

#extract($(this)):	extract_CMD=$(Nop)
install($(this)):	install_CMD=$(Nop)

$(this)_URL		 =$(gnu_url)/bash/bash-4.2.tar.gz
$(this)_URL		+=$(gnu_url)/bash/bash-4.2-patches/bash42-001
$(this)_URL		+=$(gnu_url)/bash/bash-4.2-patches/bash42-002
$(this)_URL		+=$(gnu_url)/bash/bash-4.2-patches/bash42-003
$(this)_URL		+=$(gnu_url)/bash/bash-4.2-patches/bash42-004
$(this)_URL		+=$(gnu_url)/bash/bash-4.2-patches/bash42-005
$(this)_URL		+=$(gnu_url)/bash/bash-4.2-patches/bash42-006
$(this)_URL		+=$(gnu_url)/bash/bash-4.2-patches/bash42-007
$(this)_URL		+=$(gnu_url)/bash/bash-4.2-patches/bash42-008
$(this)_URL		+=$(gnu_url)/bash/bash-4.2-patches/bash42-009
$(this)_URL		+=$(gnu_url)/bash/bash-4.2-patches/bash42-010

##############################################################################
#MY_SHELL		=$(BIN_DIR)/$(MY_SHELL_CMD)
#MY_SHELL_CMD		=bash

#%_bash:			SHELL=/bin/bash
#%_bash:			.SHELLFLAGS=-c
#
#GET_bash:		GET_SRC=$(GNU_URL)/bash/bash-4.2.tar.gz
#GET_bash:		GET_SRC+=$(GNU_URL)/bash/bash-4.2-patches/bash42-001
#GET_bash:		GET_SRC+=$(GNU_URL)/bash/bash-4.2-patches/bash42-002
#GET_bash:		GET_SRC+=$(GNU_URL)/bash/bash-4.2-patches/bash42-003
#GET_bash:		GET_SRC+=$(GNU_URL)/bash/bash-4.2-patches/bash42-004
#GET_bash:		GET_SRC+=$(GNU_URL)/bash/bash-4.2-patches/bash42-005
#GET_bash:		GET_SRC+=$(GNU_URL)/bash/bash-4.2-patches/bash42-006
#GET_bash:		GET_SRC+=$(GNU_URL)/bash/bash-4.2-patches/bash42-007
#GET_bash:		GET_SRC+=$(GNU_URL)/bash/bash-4.2-patches/bash42-008
#GET_bash:		GET_SRC+=$(GNU_URL)/bash/bash-4.2-patches/bash42-009
#GET_bash:		GET_SRC+=$(GNU_URL)/bash/bash-4.2-patches/bash42-010
##GET_bash:		GET_DEST=bash-4.2.tar.gz
#
#EXTRACT_bash:		EXTRACT_SRC=$(SRC_DIR)/bash/bash-4.2.tar.gz
#
#PATCH_bash:		PATCH_PATH=$(EXTRACT_PATH)/bash-4.2
#PATCH_bash:		PATCH_PRE=cat '$(SRC_DIR)'/bash/bash42* |
#
#CONFIG_bash:		CONFIG_PATH=$(EXTRACT_PATH)/bash-4.2
#
#BUILD_bash:		BUILD_PATH=$(EXTRACT_PATH)/bash-4.2
#
#INSTALL_bash:		INSTALL_PATH=$(EXTRACT_PATH)/bash-4.2

#$(MY_SHELL): $(SRC_DIR)/bash/bash-4.2.tar.gz | $(BUILD_DIR)
#	mkdir -vp "$(BUILD_DIR)/bash"
#	cd "$(BUILD_DIR)/bash" &&\
#	tar vxzf "$(SRC_DIR)/bash/bash-4.2.tar.gz" &&\
#	cd "$(BUILD_DIR)/bash/bash-4.2" &&\
#	patch -p0 < "$(SRC_DIR)/bash/bash42-001" &&\
#	patch -p0 < "$(SRC_DIR)/bash/bash42-002" &&\
#	patch -p0 < "$(SRC_DIR)/bash/bash42-003" &&\
#	patch -p0 < "$(SRC_DIR)/bash/bash42-004" &&\
#	patch -p0 < "$(SRC_DIR)/bash/bash42-005" &&\
#	patch -p0 < "$(SRC_DIR)/bash/bash42-006" &&\
#	patch -p0 < "$(SRC_DIR)/bash/bash42-007" &&\
#	patch -p0 < "$(SRC_DIR)/bash/bash42-008" &&\
#	patch -p0 < "$(SRC_DIR)/bash/bash42-009" &&\
#	patch -p0 < "$(SRC_DIR)/bash/bash42-010" &&\
#	sh ./configure --prefix="$(BASE_DIR)" &&\
#	$(MAKE) &&\
#	$(MAKE) install
#
#$(SRC_DIR)/bash/bash-4.2.tar.gz: | $(SRC_DIR)
#	mkdir -vp "$(SRC_DIR)/bash"
#	cd "$(SRC_DIR)/bash" &&\
#	wget "ftp://ftp.gnu.org/pub/gnu/bash/bash-4.2-patches/bash42-001" &&\
#	wget "ftp://ftp.gnu.org/pub/gnu/bash/bash-4.2-patches/bash42-002" &&\
#	wget "ftp://ftp.gnu.org/pub/gnu/bash/bash-4.2-patches/bash42-003" &&\
#	wget "ftp://ftp.gnu.org/pub/gnu/bash/bash-4.2-patches/bash42-004" &&\
#	wget "ftp://ftp.gnu.org/pub/gnu/bash/bash-4.2-patches/bash42-005" &&\
#	wget "ftp://ftp.gnu.org/pub/gnu/bash/bash-4.2-patches/bash42-006" &&\
#	wget "ftp://ftp.gnu.org/pub/gnu/bash/bash-4.2-patches/bash42-007" &&\
#	wget "ftp://ftp.gnu.org/pub/gnu/bash/bash-4.2-patches/bash42-008" &&\
#	wget "ftp://ftp.gnu.org/pub/gnu/bash/bash-4.2-patches/bash42-009" &&\
#	wget "ftp://ftp.gnu.org/pub/gnu/bash/bash-4.2-patches/bash42-010" &&\
#	wget "ftp://ftp.gnu.org/pub/gnu/bash/bash-4.2.tar.gz"


endif # END Include Guard
include $(end_prj_tmpl)
##############################################################################
