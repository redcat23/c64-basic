# Space

A text-adventure prototype for the Commodore 64, written in BASIC V2. The current scenario begins in a cold prison cell and lets the player explore a small prison, interact with objects, and find a route to the prison yard.

## Current status

The initial imported baseline includes:

- Eight connected room definitions: cells, corridors, a prison exit, and a yard. The route to the yard starts closed.
- Room names, visible objects, and available exits displayed above the command prompt.
- Typed direction commands and a verb/object parser using three-letter verb and object prefixes.
- Inventory, object examination, taking and dropping the key, and a conversation with a dying guard.
- Door unlocking, opening, and closing logic that changes the available north exit.
- In-game help, quit confirmation, and a development debug console.

No version number is declared in the source. The baseline was added in commit `aed997f` (`Add Space prison adventure prototype`).

## Commands

Enter commands at the `command?` prompt and press Return. Use lowercase input matching the source's command strings.

| Command | Purpose |
|---|---|
| `north`, `south`, `west`, `east`, `up`, `down` | Move through an available exit. Single-letter forms `n`, `s`, `w`, `e`, `u`, and `d` are also accepted. |
| `look` | Describe the current surroundings. |
| `inventory` or `inv` | List carried objects. |
| `help` | Display directions and available actions; press a key to return. |
| `quit` | Ask for confirmation; press `y` to end or `n` to continue. |

Object actions use a verb followed by an object name, for example:

```text
examine bed
talk man
take key
use key
open door
close door
```

The action table contains `examine`, `look`, `kick`, `talk`, `take`, `drop`, `use`, `get`, `open`, and `close`. `look` followed by an object examines it, and `get` is an alias for `take`. Actions only have responses for some objects; this is a prototype rather than a general natural-language parser.

The `debug` command opens a development console. It supports `free` (free BASIC memory), `obs` (object locations), `goto` (prompt for a room number), and `quit` (return to the adventure). Room numbers are not validated, so use this console only for development.

## Known unfinished behavior

- Reaching the prison yard does not trigger a victory message or ending.
- Some rooms and objects have only generic descriptions or responses.
- Object-action validation needs further work. In particular, the `use` handler can unlock the door from the prison-exit room without specifically checking that the selected object is a carried key.
- The `drop` handler can report dropping a key already present in the room because it accepts objects either carried or in the current room.
- Invalid commands, unavailable directions, repeated actions, and input edge cases need runtime testing.
- Saving and restoring a game are not implemented.

These notes are based on source and project-file review. No Studio build or VICE runtime test was performed for this documentation update.

## Project and build

| Setting | Value |
|---|---|
| Target | Commodore 64, BASIC V2 |
| Editor | CBM prg Studio 4.10.0 |
| Project | [space.cbmprj](space.cbmprj) |
| Source | [BASIC Files/space.bas](BASIC%20Files/space.bas) |
| Generated program | `space.prg` |
| BASIC start address | `$0801` (2049) |

1. Open `space/space.cbmprj` from your repository checkout in CBM prg Studio.
2. Save any edits and build the project. The build list contains `BASIC Files\space.bas`, relative to the project folder.
3. Run the generated `space.prg` in VICE, using Studio's configured emulator launch or by loading and running it in VICE.
4. Check movement, room and exit descriptions, conversation, inventory, door actions, help, and quit confirmation.

Keep the source filename stable. Use commits to record changes; generated `.prg` files are ignored by Git.

## License

Covered by the repository's [MIT license](../LICENSE).
