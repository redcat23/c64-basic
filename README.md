# C64 BASIC

Commodore 64 BASIC games, experiments, and utilities developed incrementally with an emphasis on understandable code and responsive controls.

## Projects

| Project | Description | Studio project |
|---|---|---|
| [Tetris](tetris/README.md) | Tetris-style prototype with seven pieces, movement, rotation, collision detection, hard drop, delayed locking, and automatic falling. Line clearing, scoring, and game-over detection remain planned. | `tetris/Tetris.cbmprj` |
| [Maprun](Maprun/README.md) | Fixed-map movement experiment with WASD controls, obstacle checks, and a second character that moves randomly. | `Maprun/Maprun.cbmprj` |
| [Diamond Dash](diamonddash/README.md) | Early Boulder Dash-style prototype, baseline **0.5.0**, with diggable dirt, walls, 12 fixed diamonds, 25-point collection, and a five-diamond goal. Timer and level progression remain unfinished. | `diamonddash/diamonddash.cbmprj` |
| [Keyboard Peek](keyboardpeek/README.md) | Five-line utility displaying the current keyboard scan code read from `PEEK(197)`. | `keyboardpeek/keyboardpeek.cbmprj` |

## Organization and tools

Each project keeps its `.cbmprj` launcher, BASIC source, documentation, and supporting assets inside its own folder at the repository root. Source files are under each project's `BASIC Files` folder. A single Git repository tracks the collection.

- Target: Commodore 64, BASIC V2
- Editor: CBM prg Studio 4.10.0 on Windows
- Emulator used for development: VICE
- Version control: Git and GitHub

Open the desired `.cbmprj` file in Studio, build the project, and run the generated program in VICE. See each project's README for controls and current limitations. Project-file paths are relative to the folder containing the `.cbmprj` file.

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
