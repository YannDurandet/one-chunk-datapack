# Recompute what is still needed from the clock, then show it to anyone standing on the
# altar. Actionbar text lingers a few seconds, so stepping on and off is enough to read it.
scoreboard players operation #need 20min.s = #target 20min.s
scoreboard players operation #need 20min.s -= #timer 20min.s
scoreboard players operation #need 20min.s /= #itemvalue 20min.s
execute as @a[gamemode=!spectator] at @s if block ~ ~-1 ~ minecraft:lodestone run function 20min:hud/altar_show with storage 20min:demand
