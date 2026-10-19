# 20 Minute Chunk

A Minecraft survival datapack. The world starts as a single chunk floating in the void,
and reveals one more chunk of real terrain every 20 minutes.

Targets pack format 121 (Minecraft 26.3), as declared in `pack.mcmeta`.

## Installing

The pack replaces the overworld generator, so it has to be present **when the world is
created** — adding it to an existing world will not empty that world out.

1. Copy this folder into `saves/<world>/datapacks/`, or select it in the *Data Packs*
   screen while creating the world.
2. Create the world with default settings. The `minecraft:normal` world preset is
   overridden, so the overworld generates as void.

You spawn 200 blocks above the seed chunk at (0,0) and drop onto it once it exists.

## How the world grows

Two dimensions do the work:

- `minecraft:overworld` is generated empty — a fixed `20min:blank` biome with the
  `20min:void` noise settings.
- `20min:source` is a hidden mirror that generates ordinary overworld terrain with the
  same seed.

Every cycle, growth picks a chunk, waits for the mirror to generate it, and clones it
into the overworld in four 96-block-tall slabs (a full chunk is 98,304 blocks, over the
32,768-block limit of `/clone`). Entities standing in the mirror chunk are teleported
across — the only way a villager can ever reach your world — and the mirror's real biome
is stamped onto the revealed chunk, which restores grass colour, water, fog, ambience,
snowfall and per-biome mob spawning.

The interval is a fixed 24,000 ticks. It counts ticks rather than daytime, so sleeping
through the night does not skip the wait.

### Which chunk appears

A marker entity walks the revealed blob one chunk at a time, drifting across ground you
already have before settling on an edge. A candidate's chance of being taken depends on
how far out it is, measured in chunks as Chebyshev distance against the world's current
reach:

| Candidate position | Chance taken |
| --- | --- |
| Inside the rim | 100% (fills dents) |
| On the rim | 33% |
| Beyond the rim | 10% (and the rim grows) |

The bias is scale-free, and it only decides *which* chunk — never *whether* one appears.
Past a point in the walk the next free chunk is taken unconditionally, so a cycle can
never come up empty.

One chunk per cycle, plus one extra for every 25 chunks already revealed, capped at six.

## The altar

A lodestone stands at world spawn. Each interval it asks for a random item, drawn from a
pool that widens as the world does: 24 items under 15 chunks, 55 up to 49, 100 beyond
that. Throw the demanded item onto the altar and each one adds ticks to the clock — the
quota is restated as the amount that finishes the interval *from now*, not from the top.

- **Break the altar** to reroll the demand. Once per cycle; it is put straight back and
  the drop is binned, so it cannot be farmed.
- **8 gold ingots** completes the current interval outright.
- **12 eyes of ender** builds a stronghold portal room at the centre of the seed chunk.

Standing on the altar shows what it still wants on the actionbar. The tab list shows the
seconds left until the next chunk.

## Living in a void world

Cloned chunks never go through vanilla's chunk-generation spawning, and the blank biome
carries no features, so several things are supplied by hand:

- **Animals.** A top-up spawner makes one attempt per player per minute on true grass
  surface, and stops at roughly eight farm animals within 48 blocks, so it populates
  empty ground and leaves your pens alone.
- **Bone meal.** On grass it yields grass, ferns and growables (with a 10% chance of a
  bonus flower); on a small flower it duplicates it. Vanilla would give neither here.
- **Leaves** drop saplings without shears or silk touch, and **grass** drops a seed table
  that includes carrots, potatoes, beetroot and melon and pumpkin seeds, sugar cane,
  cactus, bamboo and sweet berries.
- **The Nether** is untouched vanilla, which makes it an 8:1 highway — 250 blocks walked
  there is 2,000 of overworld, enough to put a stronghold in reach. Coming back out
  punches a chunk of real land out of the void where you land, aligned to the chunk grid
  and with your portal rebuilt.
- **The void** teleports you home instead of killing you.

## Progression

Milestones at 5, 25, 50, 100 and 250 chunks, with gold at 25 and 50 and six eyes of ender
at 100. There is a full advancement tree rooted at *Chunk One* — growth milestones, altar
dealings, biome finds, collections, and the trip out through the Nether and into the End.

## Layout

```
pack.mcmeta
data/20min/
  function/        growth, altar, demands, spawning, portals, HUD, messages
  advancement/     the 20 Minute Chunk tree
  loot_table/      sapling and seed tables, bonus flower
  tags/            passable blocks, farm animals
  worldgen/        blank biome, void and mirror noise settings
  dimension/       the 20min:source mirror
data/minecraft/
  dimension/       void overworld
  worldgen/        overridden normal world preset
  loot_table/      leaves and grass overrides
  tags/function/   load and tick hooks
```
