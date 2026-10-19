# Unconditional: the break-to-reroll check keys off the lodestone being present, so the
# block must always exist or the check would fire forever.
summon minecraft:marker ~ ~ ~ {Tags:["20min.altar"]}
setblock ~ ~ ~ minecraft:lodestone
