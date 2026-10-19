# Roll across one fewer value and step over the current item, so a reroll can never hand back
# what you just rejected. These bounds must track demand/roll or the tiers desync.
execute unless score #count 20min.s matches 15.. store result score #new 20min.s run random value 1..23
execute if score #count 20min.s matches 15..49 store result score #new 20min.s run random value 1..54
execute if score #count 20min.s matches 50.. store result score #new 20min.s run random value 1..99
execute if score #new 20min.s >= #item 20min.s run scoreboard players add #new 20min.s 1
scoreboard players operation #item 20min.s = #new 20min.s
function 20min:demand/apply
