# Read the stack size. 1.20.5+ renamed the field to lowercase count; try both so a wrong
# guess cannot silently destroy items. Nothing is consumed unless a size was actually read.
scoreboard players set #got 20min.s 0
execute store result score #got 20min.s run data get entity @s Item.count
execute if score #got 20min.s matches 0 store result score #got 20min.s run data get entity @s Item.Count
execute if score #got 20min.s matches 1.. run function 20min:altar/consume
