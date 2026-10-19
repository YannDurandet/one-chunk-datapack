# Stepping back out of the Nether punches a chunk of real land out of the void where you
# land. The Nether is untouched vanilla, so it is an 8:1 highway -- 250 blocks walked
# there is 2000 blocks of overworld, which is what makes the stronghold reachable at all.
advancement revoke @s only 20min:returned_from_nether
kill @e[tag=20min.portal]
tag @s add 20min.arriving

# Snap the arrival to its chunk origin. This is load-bearing: growth decides whether a
# chunk exists by testing for bedrock at the chunk origin, so an unaligned reveal would
# read as empty later and get cloned over, erasing anything built here.
execute store result score #px 20min.s run data get entity @s Pos[0]
execute store result score #pz 20min.s run data get entity @s Pos[2]
scoreboard players operation #px 20min.s /= #16 20min.s
scoreboard players operation #pz 20min.s /= #16 20min.s
scoreboard players operation #px 20min.s *= #16 20min.s
scoreboard players operation #pz 20min.s *= #16 20min.s
execute store result storage 20min:tmp px int 1 run scoreboard players get #px 20min.s
execute store result storage 20min:tmp pz int 1 run scoreboard players get #pz 20min.s
function 20min:portal/place with storage 20min:tmp
