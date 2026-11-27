# Eatstar Rewrite

A separate Commodore 64 BASIC V2 development series, documented through **0.6**. This history is independent of [original Eatstar](../eatstar/README.md), whose reference version is **0.8**.

## Development boundary

November 27, 2026 marks the documented split between the two development paths. They share the star-collection concept and historical context, but may evolve in different directions. Neither is currently declared abandoned or selected as the sole successor. Preserve both histories, name the project when discussing versions, and move useful ideas between them deliberately.

The author writes code in CBM prg Studio on Windows. Review and testing proceed incrementally; detailed optimization follows working features. Shared design goals include a third enemy, timed star growth, distinct boards, level progression, and later performance tuning. Those goals are not a statement that either implementation has completed every feature.

## History: Rewrite 0.1–0.6

This summary follows the six listings supplied by the author. It describes source changes, not independently verified emulator behavior.

| Version | Main changes |
|---|---|
| **0.1** | Movement prototype with row/column and screen-offset positions, one random star, 10-point collection, blue character borders, cyan scoreboard labels, red heart artwork, and F1 diagnostics. A loop counter calls an unfinished routine that falls through into diagnostics. No active enemy or lives system. |
| **0.2** | Adds a TI-based interval for one pursuing enemy, persistent movement in the last selected direction, four lives, death and respawn, a placeholder title screen, and game-over/restart screens. Actors spawn randomly. Enemy movement does not yet check terrain before moving. |
| **0.3** | Adds a level-1 obstacle layout and level-board dispatch. The enemy checks destinations before committing movement and attempts another direction when blocked. Adds a player-initiated contact path, though it checks the enemy's proposed position. Seeds randomness and redraws the maze after death. |
| **0.4** | Uses fixed actor starting positions, revises enemy fallback through an ON dispatch, adds a second board routine, adjusts the first layout, and expands death messaging with Space to resume. Relocates the zero-lives check to the enemy-update path. No automatic level advancement. |
| **0.5** | Adds SID setup and sounds for player star collection, enemy star consumption, and death; a red death character; TAB-based message placement; and more complete message erasure. Adds CLR at startup and moves the zero-lives check into the scoreboard routine. |
| **0.6** | Adds a second enemy with horizontal-first pursuit alongside the first enemy's vertical-first pursuit. Both run under the existing TI interval. Extends actor initialization, death cleanup, and diagnostics for the second enemy. Retains two board routines, sounds, four lives, and restart handling. |

## Original 0.8 versus Rewrite 0.6

| Area | Original Eatstar 0.8 | Eatstar Rewrite 0.6 |
|---|---|---|
| Player control | GET-driven steps with key repeat. | Remembers the last nonempty key; movement continues without another keypress. |
| Player representation | White screen code 0 (`@`). | White screen code 87. |
| Position model | Primarily screen offsets. | Screen offsets plus row/column state and proposed positions. |
| Enemies | One, using linear offset differences for pursuit. | Two: vertical-first and horizontal-first pursuit, with fallback attempts. |
| Enemy timing | Every main-loop iteration. | Both updated when `TI-t>z`, initially `z=15`. Player movement is still loop-driven. |
| Terrain | Open bordered playfield. | Obstacle maze with two board-drawing routines. Normal play selects level 1. |
| Scoring | Player +10; enemy -10. | Player +10; either enemy -10. |
| Stars | Target rises to four through score-based levels. | Target remains one in normal play; collision logic tracks one star position. |
| Level progression | Exact-score thresholds from level 1 to 10. | Level stays at 1; a level-2 drawing routine exists but is not reached through normal progression. |
| Lives | Contact blocks movement; no implemented death or game over. | Four lives, death screen, respawn, and game-over/restart handling, with collision defects still to resolve. |
| Sound and presentation | No sound or title/game-over flow. | SID effects, placeholder title, red life hearts, death message, and game-over flow. |
| Debugging | Removed in the latest original cleanup. | F1 diagnostics remain and overwrite the playfield. |

Rewrite 0.6 is a broader game prototype, not a feature-complete replacement for original 0.8. It advances enemies, timing, terrain, and the life cycle while leaving level/star progression behind. No comparative performance measurements were made; more features do not establish that it runs faster or slower.

Original 0.8 now uses board and initialization subroutines, a main loop numbered 1–14, and POKE drawing on the bottom row to prevent scrolling. The current committed original board has blue character borders and cyan labels. These original refactorings are separate from the Rewrite series.

## Rewrite 0.6 current behavior

- Black hardware border and background, blue character borders and maze, cyan labels, green star, and two enemies intended to be yellow.
- Player starts at zero-based row 2, column 16. Enemies start at (3,38) and (23,3).
- WASD selects persistent movement. F1 displays diagnostic state.
- A star is placed only where screen memory contains a space. Collection changes the score and replenishes the star.
- Enemy 1 prefers vertical pursuit; enemy 2 prefers horizontal pursuit. They try additional directions when blocked, without full maze pathfinding.
- Four hearts represent starting lives. Death retains score, waits for Space, deducts a life, redraws the maze, and respawns actors. Zero lives reaches game over and a restart prompt.
- Normal play uses level 1; progression, a third enemy, timed star growth, and a win condition are not implemented.

These are source-derived behaviors and intentions. The known defects below limit which paths can be assumed to work.

## Known issues for review

- Line 16 compares the player's proposed position `w` with `a`, the first enemy's proposed position. It does not explicitly compare both stored enemy positions `d` and `d2`. Enemy-initiated contact has checks in both enemy routines.
- Line 4315 uses `c2` rather than the initialized color-memory base `c`. The second enemy's initial color write therefore targets the wrong address.
- The committed Studio project still lists `BASIC Files\mazeandchase.bas` in its build list, while the tracked source is `BASIC Files\eatstar-rewrite.bas`. Correct that reference in Studio before relying on the repository project to build; this documentation update leaves the historical project file unchanged.
- F1 diagnostics print over terrain and may overwrite actors or the star without updating their state.
- Star collection compares against the single stored position `p`. Raising the target `q` above one requires a collection/tracking change.
- Placement retries are unbounded; a crowded board can stall the game. A blank cell can also be unreachable behind obstacles.
- Board redraws, respawn state, fallback paths, and timer behavior across death require focused VICE tests. TI scheduling controls intended cadence but does not remove the processing cost of two enemies.

Record fixes as later revisions rather than silently changing the historical 0.6 baseline.

## Project and verification

- Studio project: [eatstar-rewrite.cbmprj](eatstar-rewrite.cbmprj).
- Source: [BASIC Files/eatstar-rewrite.bas](BASIC%20Files/eatstar-rewrite.bas).
- Configured output: `mazeandchase.prg` (ignored by Git); the project retains older build settings.
- Windows checkout: `C:\Users\redcat\Documents\c64-basic\eatstar-rewrite\`.

The current GitHub source was inspected at commit `41c1421` (`Update Eatstar Rewrite to version 0.6`). The six-version history above is based on the author's supplied listings; earlier commits were not independently audited for this documentation update. No BASIC source or Studio project files were changed, and no build or VICE runtime test was performed here.

Open the Windows Studio project, build, and test movement, both enemies, terrain blocking, star scoring, contact in both directions, four-life exhaustion, restart, and board redraws. Keep generated output out of version control according to the root `.gitignore`.

## License

Covered by the repository's [MIT license](../LICENSE).
