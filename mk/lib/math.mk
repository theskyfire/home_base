
#.math			=\
#$(.debug.2)\
#$(shell echo $$(( $(1) )) )
#
#.add			=\
#$(.debug.2)\
#$(call .math,$(1) + $(2))
#
#.sub			=\
#$(.debug.2)\
#$(call .math,$(1) - $(2))
#
#.mul			=\
#$(.debug.2)\
#$(call .math,$(1) * $(2))
#
#.div			=\
#$(.debug.2)\
#$(call .math,$(1) / $(2))
#
#.mod			=\
#$(.debug.2)\
#$(call .math,$(1) % $(2))
#
#.neg			=\
#$(.debug.1)\
#$(call .math, - $(1))
#
#.neg.is.0		=\
#$(.debug.1)\
#$(call .math,\
#	( $$(( X = $(1) )) > 0 ) ? X : 0 \
#)
#
