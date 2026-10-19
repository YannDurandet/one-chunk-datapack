# Another chunk in the same cycle. Timer is untouched, so the burst is free.
scoreboard players remove #burst 20min.s 1
scoreboard players set #guard 20min.s 0
execute store result score #wander 20min.s run random value 0..20
function 20min:grow/pickdir
function 20min:grow/step
