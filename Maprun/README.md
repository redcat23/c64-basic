# Maprun

A maze movement experiment written in Commodore 64 BASIC V2.

The player navigates a fixed character-based map while a second character moves randomly. Both use screen memory to check whether a destination is empty.

## Status

The original imported baseline is preserved without optimization. Player movement, collision checks against non-space characters, and timed random movement are implemented.

There is no scoring, win condition, or player-versus-character collision handling in this baseline. Later changes will be recorded as separate Git commits after review and testing.

## Controls

| Key | Action |
|---|---|
| W | Move up |
| A | Move left |
| S | Move down |
| D | Move right |

Input uses `GET`; the program enables key repeat with `POKE 650,128`.

## Development

- Language: Commodore BASIC V2
- Editor: CBM prg Studio on Windows
- Emulator: VICE
- Project file: [Maprun.cbmprj](Maprun.cbmprj)
- Source: [BASIC Files/maprun.bas](BASIC%20Files/maprun.bas)

Open `Maprun/Maprun.cbmprj` from the repository root in CBM prg Studio. Build the project and run the generated program in VICE.

To check the baseline, try each movement key, confirm that map obstacles block movement, and observe the second character moving without keyboard input. Runtime verification takes place on the Windows development VM.

Keep only the intended active BASIC source included in the project build. Use Git history to preserve previous versions.

## Run in VICE or CCS64

Build `Maprun/Maprun.cbmprj` in CBM prg Studio to generate `maprun.prg`. Locate it using Studio's build output; generated PRGs are ignored by Git and are not included in this checkout.

Follow the shared [VICE instructions](../README.md#vice) or [CCS64 instructions](../README.md#ccs64), substituting the full path to your `maprun.prg`. Once built, this program can be loaded without opening Studio. Use the controls described above.

The loading steps were checked against emulator documentation; this update did not include a build or runtime test in either emulator. See [input and troubleshooting](../README.md#input-and-troubleshooting) for keyboard mapping and loading help.

For an optional disk-image workflow, see [put a built PRG into a disk image](../README.md#put-a-built-prg-into-a-disk-image): Windows drag and drop, a Linux/Windows graphical option, and `c1541` commands. Build the PRG first.

## License

This project is covered by the repository's [MIT license](../LICENSE).
