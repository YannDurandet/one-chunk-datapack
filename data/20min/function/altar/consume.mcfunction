# #got holds the raw stack size on entry, so bank it before converting to ticks.
scoreboard players operation #paid 20min.s += #got 20min.s
scoreboard players set #took 20min.s 1
scoreboard players operation #got 20min.s *= #itemvalue 20min.s
scoreboard players operation #timer 20min.s += #got 20min.s
advancement grant @a only 20min:altar/first
scoreboard players set #fed 20min.s 1
execute if score #timer 20min.s >= #target 20min.s run advancement grant @a only 20min:altar/impatient
scoreboard players operation #over 20min.s = #timer 20min.s
scoreboard players operation #over 20min.s -= #target 20min.s
execute if score #over 20min.s >= #itemvalue 20min.s run advancement grant @a only 20min:altar/generous
kill @s
