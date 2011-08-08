#### screen
MY_SCREEN	=$(BIN_DIR)/screen

GET_screen: install(bash)

GET_screen:	INSTALL_git
GET_screen:	GET_CMD=$(MY_GIT)
GET_screen:	GET_SRC_OPT=clone
GET_screen:	GET_SRC=http://git.savannah.gnu.org/r/screen.git
GET_screen:	GET_DEST_OPT=

EXTRACT_screen:	EXTRACT_CMD=cp
EXTRACT_screen:	EXTRACT_SRC_OPT=-av
EXTRACT_screen:	EXTRACT_SRC=$(GET_PATH)/screen
EXTRACT_screen:	EXTRACT_DEST=.

PATCH_screen:	PATCH=

CONFIG_screen:	CONFIG_PATH=$(EXTRACT_PATH)/screen/src
CONFIG_screen:	CONFIG_PRE=./autogen.sh &&
CONFIG_screen:	CONFIG_OPT+=--with-socket-dir='$(BASE_DIR)/screen'
CONFIG_screen:	CONFIG_OPT+=--with-sys-screenrc='$(BASE_DIR)/etc/screenrc'

BUILD_screen:	BUILD_PATH=$(EXTRACT_PATH)/screen/src

INSTALL_screen:	INSTALL_PATH=$(EXTRACT_PATH)/screen/src


