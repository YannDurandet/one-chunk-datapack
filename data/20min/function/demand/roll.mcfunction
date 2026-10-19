# Tiered by world size so early demands are only what a tiny world can supply.
# The first arm is `unless` so an unset #count cannot fall through every branch.
execute unless score #count 20min.s matches 15.. store result score #item 20min.s run random value 1..24
execute if score #count 20min.s matches 15..49 store result score #item 20min.s run random value 1..55
execute if score #count 20min.s matches 50.. store result score #item 20min.s run random value 1..100
function 20min:demand/apply
