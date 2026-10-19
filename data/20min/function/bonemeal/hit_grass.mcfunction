# Our biome carries no flower features, so vanilla bone meal yields no flowers at all
# here. This supplies them instead, ignoring biome entirely.
execute store result score @s 20min.r run random value 1..100
execute if score @s 20min.r matches 1..10 run loot spawn ~ ~1.2 ~ loot 20min:bonus_flower
