#
#.words			=\
#$(.debug.1)\
#$(words $(strip $(1)))
#
#.size			=\
#$(.debug.1)\
#$(call .words,$(1))
#
#.word			=\
#$(.debug.2)\
#$(word $(strip $(1)),$(strip $(2)))
#
#.at			=\
#$(.debug.2)\
#$(call .word,$(1),$(2))
#
#.wordlist		=\
#$(.debug.3)\
#$(wordlist $(strip $(1)),$(strip $(2)),$(strip $(3)))
#
#.slice			=\
#
#.firstword		=\
#$(.debug.1)\
#$(firstword $(strip $(1)))
#
#.front			=\
#$(.debug.1)\
#$(call .firstword,$(1))
#
#.lastword		=\
#$(.debug.1)\
#$(lastword $(strip $(1)))
#
#.back			=\
#$(.debug.1)\
#$(call .lastword,$(1))
#
#.pop.front		=\
#$(.debug.1)\
#$(call .slice,1,-2,$(1))
#
#.pop.back		=\
#$(.debug.1)\
#$(call .slice,2,-1,$(1))
#
#.foreach		=\
#$(.debug.3)\
#$(foreach $(strip $(1)),$(strip $(3)),$(strip $(3)))
#
#.map			=\
#$(.debug.2)\
#$(call .foreach,.arg.1,$(2),$(call $(strip $(3)),$(.arg.1)))
#
#.zip			=\
#
#.reduce			=\
#
#.reverse		=\
#$(.debug.1)\
#
#.sort			=\
#$(.debug.1)\
#$(sort $(strip $(1)))
#
#.unique			=\
#$(.debug.1)\
#$(call .sort,$(1))
#
#
## Return LIST without its last N items
#.pop.list.N\
#=$(wordlist \
#	1,\
#	$(call .neg.is.0,\
#		$(call .sub,\
#			$(words $(1)),\
#			$(2)\
#		)\
#	)\
#)
#
