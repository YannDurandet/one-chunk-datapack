# Positioned on the new chunk origin block. A full chunk is 16x384x16 = 98304 blocks,
# over the 32768 limit of /clone, so it crosses in four 96-tall slabs of 24576 each.
execute positioned ~ -64 ~ as @a[dx=16,dy=384,dz=16] run advancement grant @s only 20min:beyond/ground_rush
clone from 20min:source ~ -64 ~ ~15 31 ~15 to minecraft:overworld ~ -64 ~ replace force
clone from 20min:source ~ 32 ~ ~15 127 ~15 to minecraft:overworld ~ 32 ~ replace force
clone from 20min:source ~ 128 ~ ~15 223 ~15 to minecraft:overworld ~ 128 ~ replace force
clone from 20min:source ~ 224 ~ ~15 319 ~15 to minecraft:overworld ~ 224 ~ replace force

# /clone never moves entities. Bring across everything standing in the chunk -- the only
# way villagers can ever exist here, since nothing spawns them.
execute in 20min:source positioned ~ -64 ~ as @e[dx=16,dy=384,dz=16,type=!minecraft:player] at @s in minecraft:overworld run tp @s ~ ~ ~

scoreboard players add #count 20min.s 1
execute positioned ~ -64 ~ if entity @e[type=minecraft:villager,dx=16,dy=384,dz=16] run advancement grant @a only 20min:beyond/villager
function 20min:biome/paint
function 20min:grow/milestone

# Drop back to just the seed chunk and the pointer chunk. Remove and re-add inside the
# same tick so nothing actually unloads.

# Snapshot: grow/again decrements #burst, and the next line must not see the new value.
scoreboard players operation #b0 20min.s = #burst 20min.s
execute if score #b0 20min.s matches 1.. run function 20min:grow/again
execute unless score #b0 20min.s matches 1.. run function 20min:grow/finish
