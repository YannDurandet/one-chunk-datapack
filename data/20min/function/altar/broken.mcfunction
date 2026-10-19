# Executed at the altar. Always restore the block first, whatever happens next, and bin
# the drop so the altar cannot be farmed for lodestone.
setblock ~ ~ ~ minecraft:lodestone
kill @e[type=item,distance=..3,nbt={Item:{id:"minecraft:lodestone"}}]
scoreboard players operation #r0 20min.s = #rerolled 20min.s
execute unless score #r0 20min.s matches 1.. run function 20min:altar/doreroll
execute if score #r0 20min.s matches 1.. run function 20min:msg/rerolled
execute if score #r0 20min.s matches 1.. run advancement grant @a only 20min:altar/twice
