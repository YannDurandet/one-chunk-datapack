# Same readiness probe as growth: wait for the mirror chunk to generate. The trailing
# `at @s` re-anchors out of the mirror dimension before calling anything.
execute as @e[tag=20min.portal,limit=1] at @s positioned ~ -64 ~ in 20min:source if block ~ ~ ~ minecraft:bedrock at @s run function 20min:portal/do
