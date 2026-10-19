# Walk the player look vector to find which block they actually clicked -- the reward
# function only tells us it happened, not where.
scoreboard players add @s 20min.r 1
execute if block ~ ~ ~ minecraft:grass_block run function 20min:bonemeal/hit_grass
execute unless block ~ ~ ~ minecraft:grass_block if score @s 20min.r matches ..40 positioned ^ ^ ^0.2 run function 20min:bonemeal/ray_grass
