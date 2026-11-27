# Keyboard Peek

A keyboard diagnostic utility written in Commodore 64 BASIC V2.

The program displays the keyboard scan code read from `PEEK(197)`. It is useful for identifying values to use in keyboard polling routines, such as movement controls in other projects.

## Status

The original five-line utility is preserved unchanged. It clears the screen, waits for a key, and displays its scan code near the top of the screen. A value of `64` is treated as no key pressed and is not displayed; the last displayed code remains visible after release.

These are keyboard scan codes, not PETSCII character values. This is a separate utility, rather than a second version of Maprun.

## Usage

1. Build and run the project in VICE.
2. Press a key and read the number displayed after `You pressed`.
3. Try other keys to identify their scan codes.
4. Use the emulated RUN/STOP key to stop the BASIC program.

## Development

- Language: Commodore BASIC V2
- Editor: CBM prg Studio on Windows
- Emulator: VICE
- Project file: [keyboardpeek.cbmprj](keyboardpeek.cbmprj)
- Source: [BASIC Files/keyboardpeek.bas](BASIC%20Files/keyboardpeek.bas)

Open `keyboardpeek/keyboardpeek.cbmprj` from the repository root in CBM prg Studio. Build and run it independently of the game projects so its line numbers do not conflict with their sources.

Runtime verification takes place on the Windows development VM. Check that different keys display their corresponding codes and that releasing a key leaves the last result visible.

## Run in VICE or CCS64

Build `keyboardpeek/keyboardpeek.cbmprj` in CBM prg Studio to generate `keyboardpeek.prg`. Locate it using Studio's build output; generated PRGs are ignored by Git and are not included in this checkout.

Follow the shared [VICE instructions](../README.md#vice) or [CCS64 instructions](../README.md#ccs64), substituting the full path to your `keyboardpeek.prg`. Once built, this program can be loaded without opening Studio. Press a key to display its scan code, as described under Usage above.

The loading steps were checked against emulator documentation; this update did not include a build or runtime test in either emulator. See [input and troubleshooting](../README.md#input-and-troubleshooting) for keyboard mapping and loading help.

## License

This project is covered by the repository's [MIT license](../LICENSE).
