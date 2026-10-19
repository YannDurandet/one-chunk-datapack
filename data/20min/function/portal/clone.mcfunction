execute positioned ~ -64 ~ as @a[dx=16,dy=384,dz=16] run advancement grant @s only 20min:beyond/ground_rush
clone from 20min:source ~ -64 ~ ~15 31 ~15 to minecraft:overworld ~ -64 ~ replace force
clone from 20min:source ~ 32 ~ ~15 127 ~15 to minecraft:overworld ~ 32 ~ replace force
clone from 20min:source ~ 128 ~ ~15 223 ~15 to minecraft:overworld ~ 128 ~ replace force
clone from 20min:source ~ 224 ~ ~15 319 ~15 to minecraft:overworld ~ 224 ~ replace force
execute in 20min:source positioned ~ -64 ~ as @e[dx=16,dy=384,dz=16,type=!minecraft:player] at @s in minecraft:overworld run tp @s ~ ~ ~
scoreboard players add #count 20min.s 1
execute positioned ~ -64 ~ if entity @e[type=minecraft:villager,dx=16,dy=384,dz=16] run advancement grant @a only 20min:beyond/villager
advancement grant @a only 20min:beyond/nether
function 20min:biome/paint
function 20min:grow/milestone
function 20min:msg/portal
# Relocate and rebuild only on a real reveal. The clone destroys the obsidian vanilla built
# for the player, so this replaces it; arriving in an already-revealed chunk destroys
# nothing and must therefore do nothing.
execute as @a[tag=20min.arriving] run function 20min:portal/land
