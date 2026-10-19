# Seconds until the next chunk, shown as the tab-list score beside every player.
scoreboard players operation #remain 20min.s = #target 20min.s
scoreboard players operation #remain 20min.s -= #timer 20min.s
scoreboard players operation #remain 20min.s /= #20 20min.s
scoreboard players operation @a 20min.tab = #remain 20min.s
