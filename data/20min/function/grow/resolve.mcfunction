# Positioned on the candidate origin in the overworld. Bedrock means already revealed.
#
# #wander is SNAPSHOT first: grow/decline decrements it, and without the snapshot the third
# line re-read the new value and fired too. With #wander at exactly 1 that revealed a chunk
# while the pointer had already stepped elsewhere, so the next cycle grew from stranded
# ground two chunks out -- the single-chunk gaps and disconnected islands.
scoreboard players operation #w0 20min.s = #wander 20min.s
execute if block ~ ~ ~ minecraft:bedrock run function 20min:grow/skip
execute unless block ~ ~ ~ minecraft:bedrock if score #w0 20min.s matches 1.. run function 20min:grow/decline
execute unless block ~ ~ ~ minecraft:bedrock unless score #w0 20min.s matches 1.. run function 20min:grow/offer
