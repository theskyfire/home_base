#
##.if			=\
##$(.debug.3)\
##$(if $(strip $(1)),$(strip $(2)),$(strip $(3)))
#
#.test			=\
#$(strip \
#	$(.debug.1)\
#	$(if,\
#		$(1),\
#		$(.true)\
#		,\
#		$(.false)\
#	)\
#)
#
#.not			=\
#$(.debug.1)\
#$(call .if,\
#	$(1),\
#	$(.false),\
#	$(.true)\
#)
#
#.or			=\
#$(.debug.2)\
#$(call .test,\
#	$(or $(strip $(1)),$(strip $(2)))\
#)
#
#.and			=\
#$(.debug.2)\
#$(call .test,\
#	$(and $(strip $(1)),$(strip $(2)))\
#)
#
#.nor			=\
#$(.debug.2)\
#$(call .not,\
#	$(call .or,$(1),$(2))\
#)
#
#.nand			=\
#$(.debug.2)\
#$(call .not,\
#	$(call .and,$(1),$(2))\
#)
#
#.xor			=\
#$(.debug.2)\
#$(call .and,\
#	$(call .or,$(1),$(2)),\
#	$(call .nand,$(1),$(2))\
#)
#
#.iff			=\
#$(.debug.2)\
#$(call .not,\
#	$(call .xor,$(1),$(2))\
#)
#
#.oif		=\
#$(.debug.2)\
#$(call .and,\
#	$(call .not,$(1)),\
#	$(2)\
#)
#
#
#.noif		=\
#$(.debug.2)\
#$(call .not,\
#	$(call .oif,$(1),$(2))\
#)
#
##.when			=\
##$(.debug.2)\
##$(call .if,\
##	$(1),\
##	$(2),\
##	$(.nothing)\
##)
##
##.unless			=\
##$(.debug.2)\
##$(call .if,\
##	$(1),\
##	$(.nothing),\
##	$(2)\
##)
#
#.findstring		=\
#$(.debug.2)\
#$(findstring $(strip $(1)),$(strip $(2)))
#
#.in			=\
#$(.debug.2)\
#$(call .findstring,\
#	$(1),\
#	$(2)\
#)
#
#
#.eq			=\
#$(.debug.2)\
#$(call .or,\
#	$(call .nor,$(1),$(2))\
#	,\
#	$(call .and,\
#		$(call .in,$(1),$(2)),\
#		$(call .in,$(2),$(1))\
#	)\
#)
#
#.neq			=\
#$(.debug.2)\
#$(call .not,\
#	$(call .eq,$(1),$(1))\
#)
#
