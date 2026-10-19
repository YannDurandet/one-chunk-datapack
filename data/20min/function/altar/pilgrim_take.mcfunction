scoreboard players set #got 20min.s 0
execute store result score #got 20min.s run data get entity @s Item.count
execute if score #got 20min.s matches 0 store result score #got 20min.s run data get entity @s Item.Count
execute if score #got 20min.s matches 12.. if score #pilgrim 20min.s matches ..0 run function 20min:end/build_portal
