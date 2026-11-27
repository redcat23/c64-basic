# Diamond Dash

An early Boulder Dash-style game prototype for the Commodore 64, written in BASIC V2. Dig through dirt, navigate walls, and collect diamonds on a designed map.

## Current status: 0.5.0

The source identifies the current baseline as **0.5.0**. It implements:

- Keyboard movement using screen-memory addresses and collision checks.
- Diggable brown dirt, gray interior walls, and cyan diamonds drawn using `Z` (screen code 90).
- A fixed level-one map containing **12 diamonds**.
- **25 points per diamond**, a collected-diamond counter, and a **five-diamond goal**.
- A brief background flash when the collected count reaches the goal.
- A quit command.

Play continues after the goal flash. There is no implemented level transition.

### Unfinished features

- **Timer:** preliminary code initializes `TM` to 20 and prints `TM-TI` when the scoreboard updates. It uses raw timer ticks, does not update continuously, and does not enforce a time limit. It is not a working countdown.
- **Level progression:** the source draws one map; reaching the goal does not load another level.
- This remains a movement and collection prototype, rather than a complete Boulder Dash implementation.

These notes come from source and project-file inspection. The documentation update did not include a Studio build or VICE runtime test.

## Controls

| C64 key | Action | `PEEK(197)` code checked by the source |
|---|---|---|
| W | Move up | 9 |
| A | Move left | 10 |
| S | Move down | 13 |
| D | Move right | 18 |
| Q | Quit to BASIC | 62 |

Movement repeats while a direction key is held. Key names were checked against the C64 keyboard scan-code table, rather than inferred from PETSCII values. See the keyboard scan-code section of [Commodore 64 Machine Code](https://files.commodore.software/reference-material/books/c64-books/c64-programming-books/assembly-and-machine-language/commodore-64-machine-code.pdf).

## Project and build

| Setting | Value |
|---|---|
| Target | Commodore 64, BASIC V2 |
| Editor | CBM prg Studio 4.10.0 |
| Project file | [diamonddash.cbmprj](diamonddash.cbmprj) |
| Source | [BASIC Files/diamonddash.bas](BASIC%20Files/diamonddash.bas) |
| Generated program | `diamonddash.prg` |
| BASIC start address | `$0801` (2049) |

1. Open `diamonddash/diamonddash.cbmprj` from your repository checkout in CBM prg Studio.
2. Save any source changes, then build the project. Its build list contains `BASIC Files\diamonddash.bas`, relative to the project folder.
3. Run the generated `diamonddash.prg` using VICE, either through Studio's configured emulator launch or by loading and running it in VICE.
4. Check movement in all directions, wall blocking, dirt clearing, 25-point score increases, diamond counts, the goal flash, and quitting with Q.

The generated `.prg` is ignored by Git. Keep the source filename stable and record development checkpoints in commits.

## Version history

Earlier milestone descriptions below summarize the recorded development notes; they are not a claim that each version has a Git tag.

| Version | Changes |
|---|---|
| 0.1.0 | Keyboard movement and a loop-drawn screen border. |
| 0.2.0 | Movement using screen addresses and collision detection. |
| 0.3.0 | Random food generation, collection, and 25-point scoring. |
| 0.4.0 | Designed level replacing random food placement, diggable dirt, fixed diamonds, collection counter and goal, character color handling, quit key, and preliminary timer code. |
| 0.5.0 | Brown dirt, gray interior walls, cyan diamonds represented by `Z`, one diamond replaced by a wall leaving 12, and the collection goal increased from one to five. |

## Run in VICE or CCS64

Build `diamonddash/diamonddash.cbmprj` in CBM prg Studio to generate `diamonddash.prg`. Locate it using Studio's build output; generated PRGs are ignored by Git and are not included in this checkout.

Follow the shared [VICE instructions](../README.md#vice) or [CCS64 instructions](../README.md#ccs64), substituting the full path to your `diamonddash.prg`. Once built, this program can be loaded without opening Studio. Use the controls described above.

The loading steps were checked against emulator documentation; this update did not include a build or runtime test in either emulator. See [input and troubleshooting](../README.md#input-and-troubleshooting) for keyboard mapping and loading help.

## License

Covered by the repository's [MIT license](../LICENSE). This is an independent learning project, unaffiliated with the owners of Boulder Dash.
