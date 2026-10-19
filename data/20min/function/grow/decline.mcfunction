# Standing on a free chunk but still wandering. Step back onto the revealed chunk we came
# from -- the opposite of #dir -- so the pointer never rests on unrevealed ground, then
# spend a wander step and carry on drifting.
execute if score #dir 20min.s matches 1 at @e[tag=20min.pointer,limit=1] positioned ~ ~ ~16 run tp @e[tag=20min.pointer,limit=1] ~ ~ ~
execute if score #dir 20min.s matches 2 at @e[tag=20min.pointer,limit=1] positioned ~-16 ~ ~ run tp @e[tag=20min.pointer,limit=1] ~ ~ ~
execute if score #dir 20min.s matches 3 at @e[tag=20min.pointer,limit=1] positioned ~ ~ ~-16 run tp @e[tag=20min.pointer,limit=1] ~ ~ ~
execute if score #dir 20min.s matches 4 at @e[tag=20min.pointer,limit=1] positioned ~16 ~ ~ run tp @e[tag=20min.pointer,limit=1] ~ ~ ~
scoreboard players add #guard 20min.s 1
scoreboard players remove #wander 20min.s 1
function 20min:grow/pickdir
execute unless score #guard 20min.s matches 257.. run function 20min:grow/step
execute if score #guard 20min.s matches 257.. run function 20min:grow/abort
