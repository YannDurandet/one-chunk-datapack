# 20 Minute Chunk -- state setup. Runs on every datapack (re)load.
# Deliberately does NOT touch #init, so /reload never restarts a world.
scoreboard objectives add 20min.s dummy
scoreboard objectives add 20min.p dummy
scoreboard objectives add 20min.tab dummy
scoreboard objectives add 20min.r dummy
scoreboard players set #16 20min.s 16
scoreboard players set #20 20min.s 20
scoreboard players set #neg1 20min.s -1
# Existing worlds start with #maxr 0 and self-correct on the first placement.
scoreboard players add #maxr 20min.s 0
scoreboard players add #spawnclock 20min.s 0
scoreboard players set #fed 20min.s 1
scoreboard players set #25 20min.s 25
scoreboard objectives setdisplay list 20min.tab
team add 20min
scoreboard players add #rerolled 20min.s 0
scoreboard players add #wander 20min.s 0
scoreboard players add #pilgrim 20min.s 0
execute unless score #dir 20min.s matches 1..4 run scoreboard players set #dir 20min.s 1
scoreboard players add #burst 20min.s 0

# Existing worlds have no #target yet, and >= against a missing score never fires.
# Roll one only if unset, so a reload does not disturb an interval in progress.
execute unless score #target 20min.s matches 1.. run function 20min:grow/roll
# Existing worlds also predate the altar, so give the current interval a demand.
execute unless score #quota 20min.s matches 1.. run function 20min:demand/roll
function 20min:hud/dir
scoreboard players set #greeted 20min.s 0
function 20min:demand/name
execute unless entity @e[tag=20min.pointer,limit=1] run summon minecraft:marker 0 -64 0 {Tags:["20min.pointer"]}
function 20min:altar/ensure
