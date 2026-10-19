# The advancement fires once and stays granted, so revoke it or it never fires again.
advancement revoke @s only 20min:bonemeal_grass
scoreboard players set @s 20min.r 0
execute anchored eyes positioned ^ ^ ^ run function 20min:bonemeal/ray_grass
