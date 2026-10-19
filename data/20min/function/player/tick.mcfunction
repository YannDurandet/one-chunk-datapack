# 20min.p:  0 = fresh join   -1 = waiting for the seed chunk   1 = playing
scoreboard players add @s 20min.p 0
execute if score @s 20min.p matches 0 run function 20min:player/boot
execute if score @s 20min.p matches -1 run function 20min:player/wait
execute if score @s 20min.p matches 1.. run function 20min:player/run
