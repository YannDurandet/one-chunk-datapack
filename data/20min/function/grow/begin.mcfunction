# The whole growth system hangs off one marker entity, which lives in a chunk and dies
# with it. Without this, losing it makes every cycle end silently doing nothing.
execute unless entity @e[tag=20min.pointer,limit=1] run summon minecraft:marker 0 -64 0 {Tags:["20min.pointer"]}
# Safety net for the whole bug class: if anything ever strands the pointer off the map,
# snap it back to the seed chunk rather than growing an island from nowhere.
execute at @e[tag=20min.pointer,limit=1] unless block ~ ~ ~ minecraft:bedrock run tp @e[tag=20min.pointer,limit=1] 0 -64 0
scoreboard players set #timer 20min.s 0
scoreboard players set #guard 20min.s 0
scoreboard players set #fed 20min.s 0
# #maxr only ever grew, so one lucky far placement -- or a chunk wipe -- left it stale
# and the distance bias did nothing until the blob genuinely caught up. Decaying it by
# one per cycle keeps it tracking the real rim, since placements push it straight back.
execute if score #maxr 20min.s matches 1.. run scoreboard players remove #maxr 20min.s 1
# Drift this many steps across ground we already have before settling on an edge. Growing
# straight from the tip is dendritic; sampling the middle of the blob rounds it off.
# random value needs literal bounds, so this cannot scale with world size.
execute store result score #wander 20min.s run random value 0..20
# One chunk per cycle, plus one more for every 25 already revealed, capped at 6.
scoreboard players operation #burst 20min.s = #count 20min.s
scoreboard players operation #burst 20min.s /= #25 20min.s
execute if score #burst 20min.s matches 7.. run scoreboard players set #burst 20min.s 6
function 20min:grow/step
