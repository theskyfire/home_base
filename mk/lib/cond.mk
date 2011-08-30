########################################################################
# Conditional macros
########################################################################
include $(guard)
ifdef $(.FIRST.INCLUDE)
########################################################################

define .if.def =
if$(strip )def $(1)
$(2)
el$(strip )se
$(3)
end$(strip )if
endef

define .if.ndef =
if$(strip )ndef $(1)
$(2)
el$(strip )se
$(3)
end$(strip )if
endef

define .if.eq =
if$(strip )eq ($(1),$(2))
$(3)
el$(strip )se
$(4)
end$(strip )if
endef

define .if.neq =
if$(strip )neq ($(1),$(2))
$(3)
el$(strip )se
$(4)
end$(strip )if
endef

.ifdef			=$(eval $(call .if.def,$(1),$(2),$(3)))
.ifndef			=$(eval $(call .if.ndef,$(1),$(2),$(3)))
.ifeq			=$(eval $(call .if.eq,$(1),$(2),$(3),$(4)))
.ifneq			=$(eval $(call .if.neq,$(1),$(2),$(3),$(4)))

########################################################################
endif # .FIRST.INCLUDE
