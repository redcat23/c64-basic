# BASIC Tetris

A Tetris-style game being developed incrementally in Commodore 64 BASIC V2.

The gameplay target is the classic Spectrum HoloByte DOS version, with random pieces, continuous play, and increasing falling speed.

## Status

Work in progress. Movement, rotation, collision detection, hard drop, delayed locking, and automatic falling are implemented.

Line clearing, scoring, level progression, next-piece preview, and game-over detection remain to be added.

## Controls

| Key | Action |
|---|---|
| A | Move left |
| D | Move right |
| S | Descend one row; repeats while held |
| E | Rotate clockwise |
| Q | Rotate counterclockwise |
| Space | Drop and lock immediately |

Left and right repeat while held. Rotation and hard drop require a new keypress.

## Development

- Language: Commodore BASIC V2
- Editor: CBM prg Studio
- Emulator used for testing: VICE

Development prioritizes responsive controls and understandable code. Source comments explain the game’s structure and important implementation decisions.

Current development baseline: **1.2**.

Open `tetris/Tetris.cbmprj` in CBM prg Studio 4.10.0.

The project builds `BASIC Files/tetris.bas`. Build the project in Studio and test it using VICE.

## Planned progression

Ten levels, advancing every ten cleared lines. Level ten continues indefinitely at the final falling speed.

## Run in VICE or CCS64

Build `tetris/Tetris.cbmprj` in CBM prg Studio to generate `tetris.prg`. Locate it using Studio's build output; generated PRGs are ignored by Git and are not included in this checkout.

Follow the shared [VICE instructions](../README.md#vice) or [CCS64 instructions](../README.md#ccs64), substituting the full path to your `tetris.prg`. Once built, this program can be loaded without opening Studio. Use the controls described above.

The loading steps were checked against emulator documentation; this update did not include a build or runtime test in either emulator. See [input and troubleshooting](../README.md#input-and-troubleshooting) for keyboard mapping and loading help.

## License

This project is covered by the repository’s [MIT license](../LICENSE).

This is an independent learning project, unaffiliated with the owners of Tetris.
