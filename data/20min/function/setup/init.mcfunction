# Chunk (0,0) is the seed chunk. Park the pointer marker on its origin block and hand
# straight over to the growth machinery -- state 1 means waiting on the mirror.
# The marker is the only thing that knows where the edge of the world is; every other
# command works relative to it, which is why this pack needs no macros.
# #dir is not set here -- grow/roll owns it now.
forceload add 0 0
execute in 20min:source run forceload add 0 0
summon minecraft:marker 0 -64 0 {Tags:["20min.pointer"]}
scoreboard players set #timer 20min.s 0
scoreboard players set #count 20min.s 0
scoreboard players set #guard 20min.s 0
scoreboard players set #burst 20min.s 0
scoreboard players set #state 20min.s 1
scoreboard players set #init 20min.s 1
