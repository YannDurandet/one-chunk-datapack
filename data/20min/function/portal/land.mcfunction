# Put the arrival on solid ground and give them a portal back. The clone overwrites the
# obsidian vanilla built for them, so without this they would be marooned on the island.
tag @s remove 20min.arriving
execute at @e[tag=20min.portal,limit=1] run tp @s ~8 200 ~8
execute at @s positioned ~ 320 ~ run function 20min:util/find_surface
execute at @s run function 20min:portal/rebuild
