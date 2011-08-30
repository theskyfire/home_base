
#ifneq (,$(DEBUG))
#.debug.0		=$(warning [$(0)])
#.debug.1		=$(warning [$(0)]($(1)))
#.debug.2		=$(warning [$(0)]($(1))($(2)))
#.debug.3		=$(warning [$(0)]($(1))($(2))($(3)))
#else
#.debug.0		=
#.debug.1		=
#.debug.2		=
#.debug.3		=
#endif
