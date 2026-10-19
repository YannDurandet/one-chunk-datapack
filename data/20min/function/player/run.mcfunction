execute if entity @s[advancements={20min:beyond/rock_bottom=false},y=-64,dy=4] run advancement grant @s only 20min:beyond/rock_bottom
execute if entity @s[advancements={20min:beyond/clouds=false},y=200,dy=200] run advancement grant @s only 20min:beyond/clouds
execute store result score #tmp 20min.s run data get entity @s Pos[1]
execute if score #tmp 20min.s matches ..-80 run function 20min:player/rescue
