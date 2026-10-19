# Counting ticks rather than daytime is what makes this immune to sleeping:
# sleep skips the clock, not the ticks.
scoreboard players add #timer 20min.s 1
execute if score #timer 20min.s >= #target 20min.s run function 20min:grow/begin
