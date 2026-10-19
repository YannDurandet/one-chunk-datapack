# Directed growth is gone, so gold buys the one thing still worth buying: the wait.
# Eight gold completes the current interval outright.
kill @s
scoreboard players operation #timer 20min.s = #target 20min.s
function 20min:msg/haste
advancement grant @a only 20min:altar/haste
