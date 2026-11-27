!- Eatstar v0.8 - Commodore 64 BASIC V2
!-
!- Collect green stars for 10 points each.
!- A yellow enemy pursues the player and eats stars,
!- subtracting 10 points for each star it consumes.
!-
!- Controls: W/A/S/D to move.
!- Movement uses screen-memory collision checks.
!- Levels increase the target star count up to four.
!- Enemy contact blocks movement; no game-over logic yet.
!-
!- Version history:
!- 0.1 - Board drawing and eight-direction movement.
!- 0.2 - Random stars, collection, and scoring.
!- 0.5 - Direct screen drawing, WASD, and F1 debugging.
!- 0.6 - Level progression and multiple stars (buggy).
!- 0.7 - Screen-based collisions and pursuing enemy.
!- 0.8 - Revised starting position and tighter enemy code.
0 gosub2000:gosub1000
1 rem main loop
2 poke m+p,0:poke cr+p,1
3 gosub800
4 if g<tg then gosub600
5 get mv$:if mv$=""then1
6 if mv$="w"then np=p-40
7 if mv$="s"then np=p+40
8 if mv$="a"then np=p-1
9 if mv$="d"then np=p+1
10 if np=p then1
11 if peek(1024+np)=32then poke m+p,32:p=np:goto1
12 if peek(1024+np)=42then g=g-1:s=s+10:poke m+p,32:p=np:goto1
13 np=p
14 goto1
600  rem  gems
605  gosub 700
610  for n = 1 to tg
620  gp = int (rnd (1) * 873) + 85:if peek (1024 + gp) <  > 32then 620
635  poke m + gp,42:poke cr + gp,5:g = g + 1:if g = tgthen return
640  next n:return
700  rem  levels
701  if s = 50then l = 2:goto 711
702  if s = 100then l = 3:tg = 2:goto 711
703  if s = 150then l = 4:goto 711
704  if s = 200then l = 5:goto 711
705  if s = 250then l = 6:tg = 3:goto 711
706  if s = 300then l = 7:goto 711
707  if s = 350then l = 8:goto 711
708  if s = 400then l = 9:goto 711
709  if s = 450then l = 10:tg = 4:goto 711
710  rem  some infinate thing after level 10
711  poke 211,8:poke 214,1:sys 58732: print "{white}"str$ (s)"   "
712  poke 211,32:poke 214,1:sys 58732: print "{white}"str$ (l)" "
715  return
800  rem  enemies
830  if p - b > 40then nb = b + 40:goto 890
840  if p - b <  - 40then nb = b - 40:goto 890
850  if p - b < 0then nb = b - 1:goto 890
860  if p - b > 0then nb = b + 1:goto 890
890  if peek (1024 + nb) = 32then poke m + b,32:b = nb:poke m + b,88:poke cr + b,7
900  if peek (1024 + nb) = 42then poke m + b,32:b = nb:s = s - 10:g = g - 1:poke m + b,88:poke cr + b,7
990  return
!-level boards
!-level 1
1000 on l goto 1001
1001 PRINT "{clear}{blue}UCCCCCCCCCCCCCC{96}C{96}CCCC{96}C{96}CCCCCCCCCCCCCCI";
1010 PRINT "{125} {cyan}score:{blue}       UCI    UCI {cyan}level:{blue}       {125}";
1020 PRINT "{cm q}CCCCCCCCCCCCCCK JCCCCK JCCCCCCCCCCCCCC{cm w}";
1030 PRINT "B                                      {125}";
1040 PRINT "B                                      B";
1050 PRINT "B                                      B";
1060 PRINT "B                                      B";
1070 PRINT "B                                      B";
1080 PRINT "B                                      B";
1090 PRINT "B                                      B";
1100 PRINT "B                                      B";
1110 PRINT "B                                      B";
1120 PRINT "B                                      B";
1130 PRINT "B                                      B";
1140 PRINT "B                                      B";
1150 PRINT "B                                      B";
1160 PRINT "B                                      B";
1170 PRINT "B                                      B";
1180 PRINT "B                                      B";
1190 PRINT "B                                      B";
1200 PRINT "B                                      B";
1210 PRINT "B                                      B";
1220 PRINT "B                                      B";
1230 PRINT "B                                      B";
1235 pokem+960,74:pokem+999,75:pokecr+960,6:pokecr+999,6
1240 for n=1to38:pokem+960+n,64:pokecr+960+n,6:nextn
1990 return
!-game initialize
2000  x=rnd(-ti)
2010  poke 53280,0:poke 53281,0:poke 650,128
2020  m=1024:cr=55296
2030  tg=1:g=0:l=1:b=797:p=660
2990  return
!- Variables:
!- b   = Enemy's current screen offset.
!- cr  = Color memory base address (55296).
!- g   = Current count of stars on the board.
!- gp  = Random screen offset used to place a star.
!- l   = Current level.
!- m   = Screen memory base address (1024).
!- n   = Loop counter for borders and star placement.
!- nb  = Proposed enemy position for collision checks.
!- np  = Proposed player position for collision checks.
!- p   = Player's current screen offset.
!- s   = Score: +10 for player collection, -10 for enemy.
!- tg  = Target number of stars on the board.
!- x   = Receives the random-seed result; value is unused.
!-
!- mv$ = Most recently read key.
!-
!- Positions are offsets from m or cr, not full addresses.
!- Offset 0 is the top-left cell; each row adds 40.