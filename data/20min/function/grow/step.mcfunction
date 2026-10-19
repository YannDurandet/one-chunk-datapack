# Walk the pointer one chunk in the chosen direction. 1=N(-Z) 2=E(+X) 3=S(+Z) 4=W(-X)
# A direction outside 1..4 matches none of the branches below, which silently costs a
# whole cycle. Clamp rather than trust the caller.
execute unless score #dir 20min.s matches 1..4 run scoreboard players set #dir 20min.s 1
execute if score #dir 20min.s matches 1 at @e[tag=20min.pointer,limit=1] positioned ~ ~ ~-16 run function 20min:grow/claim
execute if score #dir 20min.s matches 2 at @e[tag=20min.pointer,limit=1] positioned ~16 ~ ~ run function 20min:grow/claim
execute if score #dir 20min.s matches 3 at @e[tag=20min.pointer,limit=1] positioned ~ ~ ~16 run function 20min:grow/claim
execute if score #dir 20min.s matches 4 at @e[tag=20min.pointer,limit=1] positioned ~-16 ~ ~ run function 20min:grow/claim
