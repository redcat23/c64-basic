# C64 BASIC

Commodore 64 BASIC games, experiments, and utilities developed incrementally with an emphasis on understandable code and responsive controls.

## Projects

| Project | Description | Studio project |
|---|---|---|
| [Tetris](tetris/README.md) | Tetris-style prototype with seven pieces, movement, rotation, collision detection, hard drop, delayed locking, and automatic falling. Line clearing, scoring, and game-over detection remain planned. | `tetris/Tetris.cbmprj` |
| [Maprun](Maprun/README.md) | Fixed-map movement experiment with WASD controls, obstacle checks, and a second character that moves randomly. | `Maprun/Maprun.cbmprj` |
| [Diamond Dash](diamonddash/README.md) | Early Boulder Dash-style prototype, baseline **0.5.0**, with diggable dirt, walls, 12 fixed diamonds, 25-point collection, and a five-diamond goal. Timer and level progression remain unfinished. | `diamonddash/diamonddash.cbmprj` |
| [Eatstar](eatstar/README.md) | Star-collection prototype with scoring, level thresholds, and an enemy that moves toward the player. | `eatstar/eatstar.cbmprj` |
| [Space](space/README.md) | Prison text-adventure prototype with eight rooms, typed commands, inventory, a guard conversation, and a door puzzle. | `space/space.cbmprj` |
| [Keyboard Peek](keyboardpeek/README.md) | Five-line utility displaying the current keyboard scan code read from `PEEK(197)`. | `keyboardpeek/keyboardpeek.cbmprj` |

## Organization and tools

Each project keeps its `.cbmprj` launcher, BASIC source, documentation, and supporting assets inside its own folder at the repository root. Source files are under each project's `BASIC Files` folder. A single Git repository tracks the collection.

- Target: Commodore 64, BASIC V2
- Editor: CBM prg Studio 4.10.0 on Windows
- Emulator used for development: VICE
- Version control: Git and GitHub

Open the desired `.cbmprj` file in Studio, build the project, and run the generated program in VICE. See each project's README for controls and current limitations. Project-file paths are relative to the folder containing the `.cbmprj` file.

## Run in an emulator

### Build a program first

This repository contains source and project assets, not prebuilt `.prg` downloads. Open the project's `.cbmprj` in CBM prg Studio and build it. Locate the generated filename shown below in Studio's build output; its directory depends on your build settings. Use that actual location in the commands below.

| Project | Studio project | Generated program |
|---|---|---|
| Tetris | `tetris/Tetris.cbmprj` | `tetris.prg` |
| Maprun | `Maprun/Maprun.cbmprj` | `maprun.prg` |
| Diamond Dash | `diamonddash/diamonddash.cbmprj` | `diamonddash.prg` |
| Eatstar | `eatstar/eatstar.cbmprj` | `eatstar.prg` |
| Space | `space/space.cbmprj` | `space.prg` |
| Keyboard Peek | `keyboardpeek/keyboardpeek.cbmprj` | `keyboardpeek.prg` |

Load the built `.prg` into the emulator. The `.bas` files are editor source, and `.cbmprj` and `.sdd` files are Studio project/design files; they are not the executable program. After building, you can run the `.prg` independently of Studio.

### VICE

Install [VICE](https://vice-emu.sourceforge.io/) and use its C64 emulator, `x64sc`. From PowerShell, replace both example paths with your installed executable and built program:

```powershell
& 'C:\Emulators\VICE\bin\x64sc.exe' -autostartprgmode 1 -autostart 'C:\C64Builds\tetris.prg'
```

`-autostart` loads and starts the program. Mode `1` injects the PRG into RAM, avoiding virtual-drive setup for these standalone BASIC programs. See the official [launch instructions](https://vice-emu.sourceforge.io/vice_2.html) and [PRG autostart settings](https://vice-emu.sourceforge.io/vice_6.html).

### CCS64

Install [CCS64](https://www.ccs64.com/) on Windows. Launch it in windowed mode and drag the built `.prg` from File Explorer onto its emulation window to load and run it. Alternatively, use PowerShell with your actual paths:

```powershell
& 'C:\Emulators\CCS64\CCS64.exe' 'C:\C64Builds\tetris.prg' -window -autorun
```

`-autorun` starts the loaded program. The [official manual](https://www.ccs64.com/ccs64.html) documents both methods; run `.\CCS64.exe '?'` from its installation directory to inspect your version's command options.

### Input and troubleshooting

- Click inside the emulation window before using the project's keyboard controls. Use the emulator's C64 keyboard mapping for special keys; a laptop may require its Fn key to send function keys.
- If a program is loaded but remains at the BASIC `READY.` prompt, type `RUN` and press Return in the emulated C64.
- If loading reports a missing file, check the `.prg` path against Studio's latest build output. Keep paths containing spaces quoted.
- If keys act unexpectedly, check the emulator's keyboard mapping and keyboard-to-joystick assignments. In CCS64, `Alt+K` opens its special C64-keystroke selector, as described in the manual.
- Other C64 emulators may load these BASIC V2 PRGs, but their loading steps and compatibility have not been verified here.

**Verification:** the VICE and CCS64 loading instructions were checked against their official manuals on November 27, 2026. No emulator was launched for this documentation update, and these instructions do not establish that every project works in both emulators.

## Development workflow

### Retrieve changes

Close the projects in Studio. In PowerShell, check that the working tree is clean before pulling:

```powershell
Set-Location "$env:USERPROFILE\Documents\c64-basic"
git status
```

When local work is committed and the working tree is clean:

```powershell
git pull --ff-only origin main
```

Stop and resolve any error before continuing. This also retrieves edits made directly on GitHub.

### Edit, review, and commit

Save changes in Studio, build, and test the affected program. Review the changes from PowerShell, or use Studio's Git commands where available:

```powershell
git status
git diff
```

Stage specific files belonging to the change. For example, for a Diamond Dash source update:

```powershell
git add -- "diamonddash/BASIC Files/diamonddash.bas"
git diff --cached
```

Commit with a short title and a description of the actual changes and verification performed:

```powershell
$commitDescription = @'
Describe the behavior changed and why.
Record the checks actually performed and any known limitations.
'@
git commit -m "Describe the change" -m $commitDescription
```

Run each command separately and stop on an error. A commit saves a local checkpoint; publish it with:

```powershell
git push origin main
git status
```

Keep source filenames stable. Use `!-` comments for new source documentation, and use commits and eventual tags to record development history. Existing prototypes may still contain numbered `REM` comments.

## Generated files

The root `.gitignore` excludes `bak/` directories at any level and generated files with these extensions: `.prg`, `.dbg`, `.dmp`, `.dup`, `.tmp`, and `.obj`. These can remain locally. Track source, project files, documentation, and required assets.

## Contributions

For bug reports, include the project, expected and actual behavior, reproduction steps, and emulator or hardware used. For changes, explain what changed and how it was tested.

## License

See the [MIT license](LICENSE). These are independent learning projects, unaffiliated with the owners of referenced games or trademarks.
