# Existing worlds have no altar yet. Build one on the home marker if it is missing.
execute unless entity @e[tag=20min.altar,limit=1] at @e[tag=20min.home,limit=1] run function 20min:altar/place
