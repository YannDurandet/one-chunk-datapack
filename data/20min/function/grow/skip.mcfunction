# Landed on revealed ground: spend a wander step and drift on in a fresh direction.
scoreboard players add #guard 20min.s 1
execute if score #wander 20min.s matches 1.. run scoreboard players remove #wander 20min.s 1
function 20min:grow/pickdir
execute unless score #guard 20min.s matches 257.. run function 20min:grow/step
execute if score #guard 20min.s matches 257.. run function 20min:grow/abort
