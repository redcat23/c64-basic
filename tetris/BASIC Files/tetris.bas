!- --------------------------------------------------
!- C64 BASIC Tetris
!- Source: tetris.bas
!- Repository: https://github.com/redcat23/c64-basic
!- License: MIT - see the repository LICENSE file
!- --------------------------------------------------
!- A learning project written in Commodore 64 BASIC V2.
!- Developed with CBM prg Studio and tested using VICE.
!- Priorities: responsive gameplay and understandable code.
!- Git history records changes and version milestones.
!-
!- CONTROLS
!- A     Move left while held
!- D     Move right while held
!- S     Descend while held
!- E     Rotate clockwise once per press
!- Q     Rotate counterclockwise once per press
!- SPACE Drop immediately and lock the piece
!-
!- PIECES
!- 1=I, 2=J, 3=L, 4=T, 5=BOX, 6=Z, 7=S
!- Rotation states are numbered 0-3.
!- The I uses repeating horizontal and vertical arrangements.
!- The box uses the same arrangement in every rotation state.
!-
!- PIECE REPRESENTATION
!- X is the reference screen address.
!- One block is at X; three others use offsets A, B and D.
!- OF(piece,rotation,slot) stores those three offsets.
!- Offsets are retrieved when selecting or rotating a piece.
!- Movement reuses the cached offsets and changes only X.
!-
!- MOVEMENT AND COLLISION
!- Erase the active piece before checking destination cells.
!- Screen code 32 represents empty space.
!- Any other screen code is treated as an obstacle.
!- Accept movement only when all four destinations are empty.
!- Test proposed rotation offsets before replacing the old ones.
!- Rejected actions redraw the previous valid arrangement.
!-
!- TIMING
!- TI supplies the clock, approximately 60 ticks per second.
!- FI controls the interval between automatic downward steps.
!- FD holds the next automatic-fall deadline.
!- KF guarantees keyboard polling after an automatic step.
!- Supported pieces receive a 20-tick landing delay.
!- Successful movement or rotation restarts that delay.
!- Rejected actions do not restart it.
!- Leaving support cancels the pending landing.
!- Hard drop locks immediately without the landing delay.
!-
!- INPUT
!- PEEK(197) reads the currently held key's scan code.
!- AC() translates scan codes into command numbers.
!- ON J GOTO dispatches the selected command.
!- Unassigned keys and no key translate to command zero.
!-
!- PLANNED GAMEPLAY
!- Clear completed rows and count cleared lines.
!- Add scoring, next-piece preview and game-over detection.
!- Advance one level every ten cleared lines.
!- Use ten levels, starting with a falling interval of 80 ticks.
!- Continue indefinitely at level ten.
!-
!- VARIABLES
!- A    First cached block offset
!- AC() Keyboard scan code to command lookup table
!- B    Second cached block offset
!- C    Empty-space screen code, 32
!- D    Third cached block offset
!- E    First proposed rotation offset
!- F    Second proposed rotation offset
!- FD   Deadline for the next automatic downward step
!- FI   Automatic falling interval in timer ticks
!- G    Third proposed rotation offset
!- H    Selected piece number, 1-7
!- J    Command number, 0-6; zero means no action
!- K    Current keyboard scan code
!- KF   Flag guaranteeing input polling after automatic descent
!- LT   Landing deadline; zero means no landing timer
!- N    Proposed new reference address
!- OF() Piece and rotation offset lookup table
!- P    Previously sampled keyboard scan code
!- R    Current rotation state, 0-3
!- S    Screen code used to draw a block
!- T    Previous rotation, retained if rotation is rejected
!- V    Pending movement: -1=left, 1=right, 40=down
!- X    Current piece reference address; starts at 1157
!- Z    Unused result from seeding RND with the TI clock
!- --------------------------------------------------
!- Initialize variables and offsets, then draw the board
20 print "{clear}":gosub 3000:goto2000
!- select a random piece
30 h=int(rnd(1)*7)+1:fd=ti+fi:kf=0
!- load the selected orientation's offsets; clear pending movement
40 a=of(h,r,0):b=of(h,r,1):d=of(h,r,2):v=0
!- check support while the piece is erased, before drawing
50 if peek(x+40)<>c then 56
51 if peek(x+a+40)<>c then 56
52 if peek(x+b+40)<>c then 56
53 if peek(x+d+40)<>c then 56
!- unsupported: cancel the landing timer
54 lt=0:goto 58
!- supported: start a deadline unless one is already running
!- twenty timer ticks gives roughly one-third second
56 if lt=0 then lt=ti+20
!- draw the pivot and the three offset blocks
58 poke x+a,s:poke x,s:poke x+b,s:poke x+d,s
!- check landing deadline even when no key is pressed
!- on expiry, leave the drawn piece and start another
60 if lt=0 then 62
61 if ti>=lt then 1090
!- guarantee a keyboard check after an automatic step
62 if kf then kf=0:goto 64
!- otherwise check whether automatic descent is due
63 if ti>=fd then fd=ti+fi:kf=1:v=40:goto 130
!- read and translate the held key
64 k=peek(197):j=ac(k)
!- rotation and drop require a fresh press
65 if j<4 then 67
66 if k=p then j=0
67 p=k
!- dispatch input or repeat the timer loop
68 on j goto 70,80,90,100,110,1000
69 goto 60
!- action handlers
70 v=-1:goto 130
80 v=1:goto 130
90 v=40:goto 130
100 t=r:r=r+1:goto 250
110 t=r:r=r-1:goto 250
!- Movement: erase first so collision checks cannot hit this piece
130 poke x+a,c:poke x,c:poke x+b,c:poke x+d,c
!- Calculate the proposed position without changing X
140 n=x+v
!- Reject movement if any destination is occupied
150 if peek(n)<>32 then 220
160 if peek(n+a)<>32 then 220
170 if peek(n+b)<>32 then 220
180 if peek(n+d)<>32 then 220
!- Accept movement; successful actions reset the landing delay
190 x=n:lt=0
!- Clear pending movement and reuse the existing offsets
!- Rejected movement also arrives here, with X unchanged
220 if v <> 0 then v=0:goto 50
230 goto 40
240 end
!- Rotation: erase using the old offsets
250 poke x+a,c:poke x,c:poke x+b,c:poke x+d,c
!- Wrap clockwise and counterclockwise rotation into states 0-3
260 if r=4 then r=0
270 if r=-1 then r=3
!- Retrieve proposed offsets without overwriting the old ones
280 e=of(h,r,0):f=of(h,r,1):g=of(h,r,2)
!- Reject rotation if any proposed offset block is obstructed
!- The fixed pivot was just erased, so it needs no check
290 if peek(x+e)<>c then 330
300 if peek(x+f)<>c then 330
310 if peek(x+g)<>c then 330
!- Accept new offsets and reset the landing delay
320 a=e:b=f:d=g:lt=0:goto 50
!- Reject rotation: restore R and redraw using the old offsets
330 r=t:goto 50
!- Hard drop: erase once, then search downward without drawing
1000 poke x+a,c:poke x,c:poke x+b,c:poke x+d,c
1010 n=x+40
!- Stop at the first blocked downward step
1020 if peek(n)<>c then 1080
1030 if peek(n+a)<>c then 1080
1040 if peek(n+b)<>c then 1080
1050 if peek(n+d)<>c then 1080
!- Accept this downward step and test the next row
1060 x=n:goto 1010
!- Draw the dropped piece permanently at its landing position
1080 poke x+a,s:poke x,s:poke x+b,s:poke x+d,s
!- Start the next piece; the previous piece stays on screen
!- Both hard drop and landing-timer expiry use this reset
1090 x=1157:r=0:lt=0:goto 30
!-Draw the gameboard
2000 PRINT "       {cyan}U{96}{96}{96}{96}{96}{96}{96}{96}{96}{96}I      UCCCCCCI"
2020 PRINT "       {125}          {125}      {125}score {125}"
2030 PRINT "       {125}          {125}      {125}      {125}"
2040 PRINT "       {125}          {125}      JCCCCCCK"
2050 PRINT "       {125}          {125}      UCCCCCCI"
2060 PRINT "       {125}          {125}      {125}lines {125}"
2070 PRINT "       {125}          {125}      {125}      {125}"
2080 PRINT "       {125}          {125}      JCCCCCCK"
2090 PRINT "       {125}          {125}      UCCCCCCI"
2100 PRINT "       {125}          {125}      {125}next  {125}"
2110 PRINT "       {125}          {125}      {125}      {125}"
2120 PRINT "       {125}          {125}      {125}      {125}"
2130 PRINT "       {125}          {125}      {125}      {125}"
2140 PRINT "       {125}          {125}      {125}      {125}"
2150 PRINT "       {125}          {125}      {125}      {125}"
2160 PRINT "       {125}          {125}      JCCCCCCK"
2170 PRINT "       {125}          {125}"
2180 PRINT "       {125}          {125}"
2190 PRINT "       {125}          {125}"
2200 PRINT "       {125}          {125}"
2210 PRINT "       {125}          {125}"
2220 PRINT "       J{96}{96}{96}{96}{96}{96}{96}{96}{96}{96}K"
2230 goto 30
!-initialize the game variables and pieces
!-pieces could be enumerated on load with data and read statements
3000 poke 650,128
3010 x=1157:s=209:c=32:r=0:z=rnd(-ti)
3011 fi=80
3020 rem offset (piece,rotation,offset)
3030 dim of(7,3,2)
3040 rem piece 1 I
3050 of(1,0,0)=-2:of(1,0,1)=-1:of(1,0,2)=1
3060 of(1,1,0)=-40:of(1,1,1)=40:of(1,1,2)=80
3070 of(1,2,0)=-2:of(1,2,1)=-1:of(1,2,2)=1
3080 of(1,3,0)=-40:of(1,3,1)=40:of(1,3,2)=80
3090 rem piece 2 J
3100 of(2,0,0)=-41:of(2,0,1)=-1:of(2,0,2)=1
3110 of(2,1,0)=-40:of(2,1,1)=-39:of(2,1,2)=40
3120 of(2,2,0)=-1:of(2,2,1)=1:of(2,2,2)=41
3130 of(2,3,0)=-40:of(2,3,1)=40:of(2,3,2)=39
3140 rem piece 3 L
3150 of(3,0,0)=-39:of(3,0,1)=-1:of(3,0,2)=1
3160 of(3,1,0)=-40:of(3,1,1)=41:of(3,1,2)=40
3170 of(3,2,0)=-1:of(3,2,1)=1:of(3,2,2)=39
3180 of(3,3,0)=-40:of(3,3,1)=40:of(3,3,2)=-41
3190 rem piece 4 T
3200 of(4,0,0)=-40:of(4,0,1)=-1:of(4,0,2)=1
3210 of(4,1,0)=-40:of(4,1,1)=40:of(4,1,2)=1
3220 of(4,2,0)=-1:of(4,2,1)=1:of(4,2,2)=40
3230 of(4,3,0)=-40:of(4,3,1)=-1:of(4,3,2)=40
3240 rem piece 5 box
3250 of(5,0,0)=-1:of(5,0,1)=39:of(5,0,2)=40
3260 of(5,1,0)=-1:of(5,1,1)=39:of(5,1,2)=40
3270 of(5,2,0)=-1:of(5,2,1)=39:of(5,2,2)=40
3280 of(5,3,0)=-1:of(5,3,1)=39:of(5,3,2)=40
3290 rem piece 6 Z
3300 of(6,0,0)=-41:of(6,0,1)=-40:of(6,0,2)=1
3310 of(6,1,0)=-39:of(6,1,1)=1:of(6,1,2)=40
3320 of(6,2,0)=-1:of(6,2,1)=40:of(6,2,2)=41
3330 of(6,3,0)=-40:of(6,3,1)=-1:of(6,3,2)=39
3340 rem piece 7 S
3350 of(7,0,0)=-40:of(7,0,1)=-39:of(7,0,2)=-1
3360 of(7,1,0)=-40:of(7,1,1)=1:of(7,1,2)=41
3370 of(7,2,0)=1:of(7,2,1)=39:of(7,2,2)=40
3380 of(7,3,0)=-41:of(7,3,1)=-1:of(7,3,2)=40
!- keyboard scan codes: 10=a, 18=d, 13=s, 14=e, 62=q, 60=space, 64=no key
!- command #: 1=left, 2=right, 3=down, 4=clockwise, 5=counterclockwise, 6=drop
3500 dim ac(64)
3510 ac(10)=1
3520 ac(18)=2
3530 ac(13)=3
3540 ac(14)=4
3550 ac(62)=5
3560 ac(60)=6
3565 p=64
4000 return
!- variables
!- a=first offset value
!- ac=current keyboard scan
!- b=second offset value
!- c=clear block
!- d=third offset value
!- e=proposed new first offset value
!- f=proposed new second offset value
!- fd=deadline for the next automatic downward step
!- fi=automatic falling interval in timer ticks
!- g=proposed new third offset value
!- h=selected piece 1-I, 2-J,3-L,4-T,5-box,6-Z,7-S
!- lt=landing timer
!- j=translated command, 0 means no action
!- k=current keyboard scan code
!- kf=guarantee a keyboard check after automatic descent
!- n=newly proposed location
!- of=offset
!- p=previously held key
!- r=rotation state (0-3)
!- s=tetris block
!- t=previous rotation
!- v=pending movement
!- x=pivot position
!- z=randomize