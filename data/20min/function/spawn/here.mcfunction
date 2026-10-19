# Local cap: this spot stops producing once ~8 farm animals live within 48 blocks of it,
# so it tops up empty ground and leaves your pens alone. Never spawns on top of a player.
execute store result score #near 20min.s if entity @e[type=#20min:farm,distance=..48]
execute if score #near 20min.s matches ..7 unless entity @a[distance=..16] run function 20min:spawn/herd
