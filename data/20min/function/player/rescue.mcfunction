# Void catch. If home does not exist yet, send them back through the boot sequence.
execute unless entity @e[tag=20min.home,limit=1] run scoreboard players set @s 20min.p 0
advancement grant @s only 20min:beyond/leap
execute at @e[tag=20min.home,limit=1] run tp @s ~ ~ ~
