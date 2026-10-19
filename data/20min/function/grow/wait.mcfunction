# Poll until the mirror chunk has generated. y=-64 is bedrock in real overworld terrain,
# and `if block` fails on an unloaded chunk, so this probes loading and generation at once.
# The trailing `at @e` is load-bearing: `in 20min:source` otherwise leaks into the called
# function and everything downstream runs in the wrong dimension.
execute at @e[tag=20min.pointer,limit=1] positioned ~ -64 ~ in 20min:source if block ~ ~ ~ minecraft:bedrock at @e[tag=20min.pointer,limit=1] run function 20min:grow/resolve
