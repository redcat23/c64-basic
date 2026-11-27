# Diamond Dash

A diamond-collecting game prototype written in Commodore 64 BASIC V2.

The player moves around a fixed map, clearing dirt and collecting diamonds. The scoreboard displays the score, diamonds collected, collection goal, and a time value.

## Status

The source identifies this baseline as version **0.5.0**. It includes a level-one map, keyboard polling, movement and obstacle checks, and diamond collection worth 25 points per diamond.

The collection goal is five diamonds. Reaching it flashes the background; level advancement is not implemented. The displayed time value does not enforce a time limit. This remains an early prototype requiring further review and runtime testing.

## Controls

| Key | Action |
|---|---|
| W | Move up |
| A | Move left |
| S | Move down |
| D | Move right |
| Q | Quit |

Input polls `PEEK(197)` using keyboard scan codes. Movement repeats while a direction key is held.

## Development

- Language: Commodore BASIC V2
- Editor: CBM prg Studio on Windows
- Emulator: VICE
- Project file: [diamonddash.cbmprj](diamonddash.cbmprj)
- Source: [BASIC Files/diamonddash.bas](BASIC%20Files/diamonddash.bas)

Open `diamonddash/diamonddash.cbmprj` from the repository root in CBM prg Studio. Build the project and run it in VICE.

On the Windows development VM, check directional movement, obstacle blocking, dirt clearing, score and diamond-count updates, and quitting with Q. Keep code changes separate from the original import and record them in Git.

## License

This project is covered by the repository's [MIT license](../LICENSE).
