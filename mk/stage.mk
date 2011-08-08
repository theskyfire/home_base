##############################################################################
# Load stage makefiles
##############################################################################

# Stage Directory
STAGE_DIR		=$(MK_DIR)/stage

# Stage files
STAGES			:=$(wildcard $(STAGE_DIR)/*)

# Steps
STEPS			:=$(patsubst $(STAGE_DIR)/%.mk,%,$(STAGES))

# Include Stages
include $(STAGES)

# Stop rebuild of Stage files
$(STAGES): ;
