# Fixed 20-minute interval (24000 ticks). The altar is the only accelerator now, which is
# the point -- a short random roll used to land before you had gathered anything, which
# made offerings feel pointless as often as not.
# Roll the next direction, and what the altar wants,
# all at the start of the interval so every one of them can be displayed while you wait.
scoreboard players set #target 20min.s 24000
function 20min:grow/pickdir
function 20min:hud/dir
scoreboard players set #rerolled 20min.s 0
function 20min:demand/roll
