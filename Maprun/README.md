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

## License

This project is covered by the repository's [MIT license](../LICENSE).
