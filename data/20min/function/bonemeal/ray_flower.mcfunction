scoreboard players add @s 20min.r 1
execute if block ~ ~ ~ #minecraft:small_flowers run function 20min:bonemeal/hit_flower
execute unless block ~ ~ ~ #minecraft:small_flowers if score @s 20min.r matches ..40 positioned ^ ^ ^0.2 run function 20min:bonemeal/ray_flower
