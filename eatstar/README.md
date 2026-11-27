# Eatstar

A Commodore 64 BASIC V2 star-collection prototype. The player moves around a bordered board, collecting stars for 10 points each. An enemy moves toward the player and deducts 10 points when it takes a star. Score thresholds change the level and target number of stars.

## Status and controls

The current development baseline is version **0.8**. Movement uses W, A, S, and D. These controls are read directly from the source's `GET` comparisons.

The BASIC source draws its own board. [GameBoard.sdd](Screen%20Designs/GameBoard.sdd) contains three screen designs for editing in Studio; adding it to the project does not by itself make the BASIC program load those layouts. This remains a prototype, with no implemented player/enemy game-over condition or ending.

## Relationship to Eatstar Rewrite

As of November 27, 2026, **original Eatstar 0.8** and [Eatstar Rewrite 0.6](../eatstar-rewrite/README.md) are separate development paths with independent version histories. Neither is designated abandoned or the automatic successor. Preserve their histories and transfer selected ideas deliberately rather than replacing one implementation with the other.

Original 0.8 has one enemy, score-based level thresholds, and increasing target star counts. Rewrite 0.6 adds two TI-scheduled enemies with different pursuit priorities, obstacle boards, four lives, sound, death/respawn, and game-over/restart handling. Rewrite does not yet implement original 0.8's automatic level or star-count progression. The [Rewrite comparison](../eatstar-rewrite/README.md#original-08-versus-rewrite-06) records the differences and all six rewrite iterations.

## Original version history

| Version | Main changes |
|---|---|
| **0.1** | Board drawing, eight-direction movement, boundaries, and score/level labels. |
| **0.2** | Random stars, 10-point collection, replacement, and scoreboard updates. |
| **0.5** | Direct screen/color-memory drawing, WASD movement, one green star, and F1 diagnostics. |
| **0.6** | Numeric scoreboard, score-based levels, and up to four stars; multiple-star tracking remained buggy. |
| **0.7** | Screen-character collision checks, empty-cell star placement, and one pursuing enemy that consumes stars for a score penalty. |
| **0.8** | Revised starting position and tighter enemy code. Subsequent refactoring extracted initialization and board routines, retained POKE drawing on the bottom row to avoid scrolling, renumbered the main loop to 1–14, and removed diagnostics. The current source uses blue game borders and cyan labels. |

## Current limitations

- Enemy contact blocks movement; lives, death, and game over are not implemented.
- Enemy pursuit compares linear screen offsets and runs on every main-loop iteration. It can choose poor routes, and its speed depends on loop execution time.
- Level checks use exact score equality during star replenishment. Returning to an earlier threshold after penalties can lower the level; surplus stars are not removed when a target decreases.
- The level-board selector exists, but only one board is implemented, and level changes do not trigger a board redraw.
- Random star placement rejects nonempty cells but retries without a limit and does not establish reachability.
- Progression beyond level 10 and an ending remain unfinished.

## Project and build

- Target: Commodore 64, BASIC V2, start address `$0801` (2049).
- Editor: CBM prg Studio 4.10.0.
- Project: [eatstar.cbmprj](eatstar.cbmprj).
- Source: [BASIC Files/eatstar.bas](BASIC%20Files/eatstar.bas).
- Output: `eatstar.prg`.

Open `eatstar/eatstar.cbmprj` from the repository checkout in Studio, save changes, and build. Consult Studio's build output for the generated program's location.

These notes are based on source and project-file inspection, not a new build or runtime test.

## Run in VICE or CCS64

Build `eatstar/eatstar.cbmprj` in CBM prg Studio to generate `eatstar.prg`. Locate it using Studio's build output; generated PRGs are ignored by Git and are not included in this checkout.

Follow the shared [VICE instructions](../README.md#vice) or [CCS64 instructions](../README.md#ccs64), substituting the full path to your `eatstar.prg`. Once built, this program can be loaded without opening Studio. Use the controls described above.

The loading steps were checked against emulator documentation; this update did not include a build or runtime test in either emulator. See [input and troubleshooting](../README.md#input-and-troubleshooting) for keyboard mapping and loading help.

For an optional disk-image workflow, see [put a built PRG into a disk image](../README.md#put-a-built-prg-into-a-disk-image): Windows drag and drop, a Linux/Windows graphical option, and `c1541` commands. Build the PRG first.

## License

Covered by the repository's [MIT license](../LICENSE).

