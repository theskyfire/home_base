########################################################################
# Conditional macros
########################################################################
include $(guard)
ifdef $(.FIRST.INCLUDE)
########################################################################

.ifdef			=$(eval $(.if.def))
define .if.def =
if$(strip )def $(strip $(1))
$(2)
el$(strip )se
$(3)
end$(strip )if
endef

.ifndef			=$(eval $(.if.ndef))
define .if.ndef =
if$(strip )ndef $(strip $(1))
$(2)
el$(strip )se
$(3)
end$(strip )if
endef

.ifeq			=$(eval $(.if.eq))
define .if.eq =
if$(strip )eq ($(strip $(1)),$(strip $(2)))
$(3)
el$(strip )se
$(4)
end$(strip )if
endef

.ifneq			=$(eval $(.if.neq))
define .if.neq =
if$(strip )neq ($(strip $(1)),$(strip $(2)))
$(3)
el$(strip )se
$(4)
end$(strip )if
endef


########################################################################
endif # .FIRST.INCLUDE
