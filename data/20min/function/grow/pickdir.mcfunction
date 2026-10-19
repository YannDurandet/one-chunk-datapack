# Uniform. This only steers the pointer's walk; where a chunk LANDS is decided by
# grow/offer, based on distance from spawn.
execute store result score #dir 20min.s run random value 1..4
