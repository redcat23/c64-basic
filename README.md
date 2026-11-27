# C64 BASIC

Commodore 64 BASIC projects, experiments, and documented learning.

This collection focuses on understanding how programs work, developing them incrementally, and balancing responsiveness with readable code.

## Projects

| Project | Studio project file | Notes |
|---|---|---|
| [Tetris](tetris/) | `tetris/Tetris.cbmprj` | A Tetris-style game in development. See the [project README](tetris/README.md) for controls and current status. |
| [Maprun](Maprun/) | `Maprun/Maprun.cbmprj` | BASIC source and Studio project. |
| [Diamond Dash](diamonddash/) | `diamonddash/diamonddash.cbmprj` | BASIC source and Studio project. |
| [Keyboard Peek](keyboardpeek/) | `keyboardpeek/keyboardpeek.cbmprj` | BASIC source and Studio project. |

## Folder layout

Each project keeps its Studio project file, BASIC source, and any supporting assets inside its own folder.

```text
c64-basic/
├── .gitignore
├── LICENSE
├── README.md
├── Maprun/
│   ├── Maprun.cbmprj
│   └── BASIC Files/
├── diamonddash/
│   ├── diamonddash.cbmprj
│   └── BASIC Files/
├── keyboardpeek/
│   ├── keyboardpeek.cbmprj
│   └── BASIC Files/
└── tetris/
    ├── Tetris.cbmprj
    ├── README.md
    ├── BASIC Files/
    └── Screen Designs/
```

One Git repository at the collection root tracks all projects.

## Development tools

- **Language:** Commodore BASIC V2
- **Editor:** CBM prg Studio 4.10.0
- **Emulator:** VICE
- **Version control:** Git and GitHub

Open a project’s `.cbmprj` file in CBM prg Studio. Keep its file references relative to the folder containing that project file.

## Development workflow

### Before editing

With local work committed and the working tree clean, close the projects in Studio and retrieve the latest GitHub changes.

For a Windows checkout at `Documents\c64-basic`, run in PowerShell:

```powershell
Set-Location "$env:USERPROFILE\Documents\c64-basic"
git status
git pull --ff-only origin main
```

If Git reports local changes or an error, resolve them before continuing.

### Make and test changes

1. Open the project’s `.cbmprj` file in Studio.
2. Edit and save the changed files.
3. Build the program and test it using VICE.
4. Review the changes before committing.

Use `!-` comments for source documentation. Keep source filenames stable, and use Git commits and tags to record development history and version milestones.

### Commit and push

Studio
