# Built by hand rather than /place structure minecraft:stronghold -- the jigsaw version is
# not guaranteed to contain a portal room and needs its chunks loaded. Fixed at the centre
# of the seed chunk, which is permanently forceloaded, so it cannot half-generate.
kill @s
scoreboard players set #pilgrim 20min.s 1
fill 4 29 4 12 34 12 minecraft:air
fill 4 29 4 12 29 12 minecraft:stone_bricks
fill 7 30 6 9 30 6 minecraft:end_portal_frame[eye=true,facing=south]
fill 7 30 10 9 30 10 minecraft:end_portal_frame[eye=true,facing=north]
fill 6 30 7 6 30 9 minecraft:end_portal_frame[eye=true,facing=east]
fill 10 30 7 10 30 9 minecraft:end_portal_frame[eye=true,facing=west]
fill 7 30 7 9 30 9 minecraft:end_portal
function 20min:msg/pilgrim
advancement grant @a only 20min:altar/pilgrim
