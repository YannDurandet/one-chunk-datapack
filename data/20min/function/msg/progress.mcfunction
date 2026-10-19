# Only fires after the correct item was accepted, so the item name is already implied.
# Derived from time remaining, so it shrinks as the clock runs down as well as when you pay.
scoreboard players operation #need 20min.s = #target 20min.s
scoreboard players operation #need 20min.s -= #timer 20min.s
scoreboard players operation #need 20min.s /= #itemvalue 20min.s
execute if score #need 20min.s matches 1.. run tellraw @a ["Altar still needs ",{"score":{"name":"#need","objective":"20min.s"}}," more"]
