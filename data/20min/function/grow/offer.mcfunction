# The pointer is sitting on a free candidate. Decide whether to take it, based on how
# far out it is compared with the world's current reach (#maxr, Chebyshev, in chunks):
#   inside the rim  -> always (fills dents, which is what rounds the blob)
#   on the rim      -> 33%
#   beyond the rim  -> 10%   (and the rim grows)
# Scale-free on purpose. An absolute falloff like 1/(1+d^2) collapses as the world
# grows and starts costing whole cycles -- measured at 108 lost out of 200.
execute store result score #cx 20min.s run data get entity @e[tag=20min.pointer,limit=1] Pos[0]
execute store result score #cz 20min.s run data get entity @e[tag=20min.pointer,limit=1] Pos[2]
scoreboard players operation #cx 20min.s /= #16 20min.s
scoreboard players operation #cz 20min.s /= #16 20min.s
scoreboard players operation #tx 20min.s = #cx 20min.s
scoreboard players operation #tx 20min.s *= #neg1 20min.s
scoreboard players operation #cx 20min.s > #tx 20min.s
scoreboard players operation #tz 20min.s = #cz 20min.s
scoreboard players operation #tz 20min.s *= #neg1 20min.s
scoreboard players operation #cz 20min.s > #tz 20min.s
scoreboard players operation #d 20min.s = #cx 20min.s
scoreboard players operation #d 20min.s > #cz 20min.s
scoreboard players set #acc 20min.s 10
execute if score #d 20min.s = #maxr 20min.s run scoreboard players set #acc 20min.s 33
execute if score #d 20min.s < #maxr 20min.s run scoreboard players set #acc 20min.s 100
# The bias decides WHICH chunk, never WHETHER one appears. Past this point in the walk
# we take the next free chunk unconditionally, so a cycle can never come up empty.
execute if score #guard 20min.s matches 192.. run scoreboard players set #acc 20min.s 100
execute store result score #roll 20min.s run random value 1..100
execute if score #roll 20min.s <= #acc 20min.s run function 20min:grow/accept
execute unless score #roll 20min.s <= #acc 20min.s run function 20min:grow/decline
