$summon minecraft:marker $(px) -64 $(pz) {Tags:["20min.portal"]}
$forceload add $(px) $(pz)
$execute in 20min:source run forceload add $(px) $(pz)
