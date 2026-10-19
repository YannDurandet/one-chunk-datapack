team join 20min @a[team=]
function 20min:hud/tick
scoreboard players add #spawnclock 20min.s 1
execute if score #spawnclock 20min.s matches 1200.. run scoreboard players set #spawnclock 20min.s 0
execute if score #spawnclock 20min.s matches 0 as @a[gamemode=!spectator] at @s run function 20min:spawn/try
function 20min:portal/tick
execute as @a[gamemode=!spectator] at @s run function 20min:player/tick

# Check the altar once a second rather than every tick -- ten selector scans is enough
# work to not want it 20 times a second.
scoreboard players operation #mod 20min.s = #timer 20min.s
scoreboard players operation #mod 20min.s %= #20 20min.s
execute if score #state 20min.s matches 0 if score #mod 20min.s matches 0 run function 20min:altar/scan
execute if score #mod 20min.s matches 0 run function 20min:hud/altar
execute if score #greeted 20min.s matches 0 if entity @a run function 20min:msg/greet

execute if score #state 20min.s matches 0 run function 20min:grow/idle
execute if score #state 20min.s matches 1 run function 20min:grow/wait
