execute unless block ~ ~ ~ minecraft:bedrock run function 20min:portal/clone
tag @a remove 20min.arriving
forceload remove ~ ~
execute in 20min:source run forceload remove ~ ~
kill @s
