# Positioned on the pointer chunk. Drop back to just the seed chunk and the pointer,
# removing and re-adding inside one tick so nothing actually unloads.
forceload remove all
forceload add ~ ~
forceload add 0 0
execute in 20min:source run forceload remove all
execute at @e[tag=20min.portal,limit=1] run forceload add ~ ~
