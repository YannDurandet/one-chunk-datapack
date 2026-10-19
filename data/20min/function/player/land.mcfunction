function 20min:player/place
execute at @s run spawnpoint @s ~ ~ ~
execute unless score #home 20min.s matches 1 at @s run setworldspawn ~ ~ ~
execute unless score #home 20min.s matches 1 at @s run summon minecraft:marker ~ ~ ~ {Tags:["20min.home"]}
scoreboard players set #home 20min.s 1
scoreboard players set @s 20min.p 1
advancement grant @s only 20min:root

# The altar anchors to the home marker, which does not exist until this runs -- calling
# ensure from load alone silently does nothing on a fresh world.
function 20min:altar/ensure
# load announces the first demand to an empty server, so repeat it for the arriving player.
function 20min:msg/demand
