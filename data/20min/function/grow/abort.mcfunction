# Retry in ten seconds. Setting an absolute tick count here would be a trap: with random
# targets, a fixed 23800 can exceed a short interval and fire again instantly, forever.
scoreboard players set #state 20min.s 0
scoreboard players operation #timer 20min.s = #target 20min.s
scoreboard players remove #timer 20min.s 200
function 20min:msg/abort
execute at @e[tag=20min.pointer,limit=1] run function 20min:grow/cleanup
