# Exact matches, so each fires once. #count was incremented by the caller and nothing
# between there and here writes it again.
execute if score #count 20min.s matches 25 run give @a minecraft:gold_ingot 8
execute if score #count 20min.s matches 50 run give @a minecraft:gold_ingot 16
execute if score #count 20min.s matches 100 run give @a minecraft:ender_eye 6
execute if score #count 20min.s matches 5 run advancement grant @a only 20min:growth/5
execute if score #count 20min.s matches 25 run advancement grant @a only 20min:growth/25
execute if score #count 20min.s matches 50 run advancement grant @a only 20min:growth/50
execute if score #count 20min.s matches 100 run advancement grant @a only 20min:growth/100
execute if score #count 20min.s matches 250 run advancement grant @a only 20min:growth/250
function 20min:msg/milestone
