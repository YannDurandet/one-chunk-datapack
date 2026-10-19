# Descend from the sky to the first solid block. Only a grass block counts, and because
# we come from above it is always the true surface, never a cave floor.
execute if block ~ ~-1 ~ #20min:passable positioned ~ ~-1 ~ run function 20min:spawn/scan
execute unless block ~ ~-1 ~ #20min:passable if block ~ ~-1 ~ minecraft:grass_block run function 20min:spawn/here
