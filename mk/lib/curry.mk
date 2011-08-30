
#add			=$(call add,x,y)
#add.1			=$(call papply,1,add)
#$(call .papply,1,add) = $(call add,1,y)
#$(call .curry,add)    = $()
#$(call .uncurry,add)
#x=if A B C

#


#.uncurry		=\
#$(strip \
#$(eval .uncurry.foo:=)\
#$(eval .uncurry.tmp=$$$(.l.paren)call )\
#$(eval .uncurry.tmp+=$(firstword $(1)))\
#$(eval .uncurry.tmp+=$$$(.l.paren).uncurry.foo)\
#$(foreach arg,$(wordlist 2,$(words $(1)),$(1)),$(eval .uncurry.tmp+=$(.r.paren),$$$(.l.paren)strip $(arg)))\
#$(eval .uncurry.tmp+=$(.r.paren))\
#$(eval .uncurry.tmp+=$(.r.paren))\
#$(call .uncurry.tmp)\
#)
