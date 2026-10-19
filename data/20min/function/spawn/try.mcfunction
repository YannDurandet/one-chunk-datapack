# One attempt per player per minute. Vanilla seeds animals at chunk generation, which
# cloned chunks never go through, and the ongoing creature spawn is throttled by a cap
# your own penned animals fill. This is the top-up vanilla would otherwise be doing.
execute store result storage 20min:tmp dx int 1 run random value -48..48
execute store result storage 20min:tmp dz int 1 run random value -48..48
function 20min:spawn/at with storage 20min:tmp
