# C64 BASIC

Commodore 64 BASIC games, experiments, and utilities developed incrementally with an emphasis on understandable code and responsive controls.

## Projects

| Project | Description | Studio project |
|---|---|---|
| [Tetris](tetris/README.md) | Tetris-style prototype with seven pieces, movement, rotation, collision detection, hard drop, delayed locking, and automatic falling. Line clearing, scoring, and game-over detection remain planned. | `tetris/Tetris.cbmprj` |
| [Maprun](Maprun/README.md) | Fixed-map movement experiment with WASD controls, obstacle checks, and a second character that moves randomly. | `Maprun/Maprun.cbmprj` |
| [Diamond Dash](diamonddash/README.md) | Early Boulder Dash-style prototype, baseline **0.5.0**, with diggable dirt, walls, 12 fixed diamonds, 25-point collection, and a five-diamond goal. Timer and level progression remain unfinished. | `diamonddash/diamonddash.cbmprj` |
| [Eatstar](eatstar/README.md) | Star-collection prototype with scoring, level thresholds, and an enemy that moves toward the player. | `eatstar/eatstar.cbmprj` |
| [Eatstar Rewrite](eatstar-rewrite/README.md) | Separate series through **0.6**: two timed enemies, maze layouts, lives, sound, and restart handling. | `eatstar-rewrite/eatstar-rewrite.cbmprj` |
| [Space](space/README.md) | Prison text-adventure prototype with eight rooms, typed commands, inventory, a guard conversation, and a door puzzle. | `space/space.cbmprj` |
| [Keyboard Peek](keyboardpeek/README.md) | Five-line utility displaying the current keyboard scan code read from `PEEK(197)`. | `keyboardpeek/keyboardpeek.cbmprj` |

## Organization and tools

### Eatstar development paths

As of November 27, 2026, **Eatstar 0.8** and **Eatstar Rewrite 0.6** are separate development paths with shared historical context. Their version numbers are independent: Rewrite 0.6 is not original Eatstar 0.6. Neither path is designated abandoned or the automatic successor. They may evolve differently, exchange selected ideas, or eventually be retired individually. Preserve each history and review changes within the intended project. The [Rewrite README](eatstar-rewrite/README.md) records all six rewrite iterations and compares the two paths.

### Project layout

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
| Eatstar Rewrite | `eatstar-rewrite/eatstar-rewrite.cbmprj` | `mazeandchase.prg` (current project setting; see its README for a source-path mismatch) |
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

## Put a built PRG into a disk image

Disk-image managers copy Commodore files into and out of images such as `.d64`; they do not compile or tokenize the repository's Studio `.bas` source. First build a `.prg` in Studio as described above. On Linux, you can copy that built PRG from your Windows machine and package it there. These examples do not establish a Linux source-build workflow.

A disk image is optional for these standalone programs: you can still load a PRG directly. A D64 is useful for collecting several built programs on one virtual disk.

### Windows: DirMaster drag and drop

[DirMaster](https://style64.org/dirmaster) is a freely downloadable Windows disk-image manager. Its [official documentation](https://style64.org/dirmaster/documentation/) describes PRG import/export and drag and drop.

1. Open DirMaster and choose **Disk → New → D64**, or open an existing D64.
2. Drag a built `.prg` from File Explorer onto the open disk-image window. **File → Import** is another option.
3. Check the new PRG entry, then choose **Disk → Save As** for a new image, or **Disk → Save** for an existing one. Edits are not written to the image file until saved.
4. To copy a program back out, drag its entry to File Explorer or choose **File → Export** and select raw `.prg` output.

### Linux and Windows: droiD64 graphical option

[droiD64](https://droid64.sourceforge.net/) is a free, open-source Java disk-image manager supporting creation/opening of D64 images and insertion/extraction of PRG files.

1. Install Java 11 or newer and download/extract the full binary ZIP bundle from the project site.
2. Start the bundled `droid64.sh` on Linux or `droid64.bat` on Windows. Use the bundle's launcher so its supporting libraries are included.
3. Create or open a D64 and use the file operations to insert a built PRG or extract a PRG back to the host filesystem. Consult the bundled help for the controls in your release, and confirm the saved image by reopening it.

The verified drag-and-drop steps above apply to DirMaster. This guide does not assume droiD64 has identical controls.

### Linux and Windows: VICE c1541 commands

VICE includes the free disk-image utility [`c1541`](https://vice-emu.sourceforge.io/vice_14.html). Install a VICE package containing that tool; some Linux distributions package utilities separately. Use `c1541` on your PATH on Linux, or the installed `c1541.exe` path on Windows.

For Windows PowerShell, substitute your actual paths. Use a new output filename: **the format command creates/formats the disk image**, so do not aim it at an image you want to preserve.

```powershell
$c1541 = 'C:\Emulators\VICE\bin\c1541.exe'
$diskImage = 'C:\C64Builds\eatstar-demo.d64'
$builtPrg = 'C:\C64Builds\eatstar.prg'

& $c1541 -format 'eatstar,es' d64 $diskImage
```

After that succeeds, add the PRG and list the directory:

```powershell
& $c1541 -attach $diskImage -write $builtPrg eatstar -list
```

Copy it back out to a separate host file:

```powershell
& $c1541 -attach $diskImage -read eatstar 'C:\C64Builds\eatstar-extracted.prg'
```

On Linux, run these equivalents from a folder containing the built `eatstar.prg`, choosing a new image filename:

```sh
c1541 -format 'eatstar,es' d64 eatstar-demo.d64
c1541 -attach eatstar-demo.d64 -write eatstar.prg eatstar -list
c1541 -attach eatstar-demo.d64 -read eatstar eatstar-extracted.prg
```

Run each command separately and stop if it fails. Here `eatstar` is the filename inside the disk; it can differ from the host's `eatstar.prg`. For an existing image, skip formatting and use `-attach ... -write ...` with a disk filename not already in use. Repeat to add other programs.

### Run the disk image

Use VICE's `-autostart` command from the emulator instructions with the D64 path instead of the PRG path; CCS64 accepts a D64 path with `-autorun` too. Automatic startup selects the first program. Alternatively, attach the image to drive 8 and enter these commands at the emulated C64 BASIC prompt to select a program by name:

```basic
LOAD"EATSTAR",8
RUN
```

Use the actual name listed in the disk directory. The first command loads this BASIC program; the second starts it. Keep generated images outside your checkout unless you intentionally plan to commit them: the current `.gitignore` excludes PRGs but does not exclude D64 images.

**Verification:** these disk-image workflows were checked against the linked official documentation on November 27, 2026. The tools were not installed or exercised for this update.

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
