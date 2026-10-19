# Positioned on the candidate chunk origin block. Force both dimensions to load it,
# then move the pointer here so later steps keep working in relative coordinates.
forceload add ~ ~
execute in 20min:source run forceload add ~ ~
tp @e[tag=20min.pointer,limit=1] ~ ~ ~
scoreboard players set #state 20min.s 1
