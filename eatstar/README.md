# Eatstar

A Commodore 64 BASIC V2 star-collection prototype. The player moves around a bordered board, collecting stars for 10 points each. An enemy moves toward the player and deducts 10 points when it takes a star. Score thresholds change the level and target number of stars.

## Status and controls

The current development baseline is version **0.8**. Movement uses W, A, S, and D. These controls are read directly from the source's `GET` comparisons.

The BASIC source draws its own board. [GameBoard.sdd](Screen%20Designs/GameBoard.sdd) contains three screen designs for editing in Studio; adding it to the project does not by itself make the BASIC program load those layouts. This remains a prototype, with no implemented player/enemy game-over condition or ending.

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

