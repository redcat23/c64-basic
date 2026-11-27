1 rem 0.5 re-write: dude moves, 1 randomly placed gem and the game board
2 rem 0.6 code optimizatons, levels with multiple stars (buggy)
5 print"{clear}"
7 clr
10 rem i=screen r=row c=column m=1024(1mb) cr=color ram
15 rem (west,east,top,bottom) tg=total gems
18 x=rnd(-ti)
20 cr=55296:m=1024
25 r=12:c=20:w=1:e=38:t=3:b=23:tg=1:g=0:l=1:dimgr(4):dimgc(4)
30 poke 53280,1:poke53281,0:poke650,128
40 rem build top corners
41 pokem,85:pokem+39,73:pokecr,6:pokecr+39,6
42 rem build sides
43 for n=40to920 step 40
44 pokem+n,66:pokem+n+39,66:pokecr+n,6:pokecr+n+39,6
45 nextn
46 rem build top and bottom
47 pokem+960,74:pokem+999,75:pokecr+960,6:pokecr+999,6
48 for n=1to19
49 pokem+n,67:pokem+39-n,67:pokecr+n,6:pokecr+39-n,6
50 pokem+n+960,67:pokem+999-n,67:pokecr+n+960,6:pokecr+999-n,6
51 nextn 
55 rem build score board
56 print "{home}"
57 print "{blue}{125} score:       UCI{red}SSSS{blue}UCI level:       {125}";
58 print "{171}CCCCCCCCCCCCCCK JCCCCK JCCCCCCCCCCCCCC{179}";
70 rem draw starting location before game starts
72 rem xy=r*40+c:pokem+xy,0:pokecr+xy,1:goto5300
82 goto230
100 rem main loop
120 get mv$
125 ifmv$<>""then130
128 goto100
130 ifmv$="{f1}"thengosub6000
135 rp=r:cp=c:rem rp/cp = before change
140 ifmv$="d"thenc=c+1:ifc=e+1thenc=e
150 ifmv$="a"thenc=c-1:ifc=w-1thenc=w
160 ifmv$="w"thenr=r-1:ifr=t-1thenr=t
170 ifmv$="s"thenr=r+1:ifr=b+1thenr=b
180 ifcp<>corcr<>rthen230
215 goto100
230 rem draw main dude (xy is the screen loc)
235 xy=r*40+c:pokem+rp*40+cp,96:poke m+xy,0:pokecr+xy,1
5200 rem gem check
5210 forn=1totg
5215 ifgr(n)*40+gc(n)=xythens=s+10:g=g-1
5217 nextn
5220 ifg=tgthen100
5300 rem place the gems on the board
5310 forn=1totg-g
5315 gr(n)=int(rnd(1)*20)+3:gc(n)=int(rnd(1)*e-1)+w+1
5330 pokem+gr(n)*40+gc(n),42:pokecr+gr(n)*40+gc(n),5
5335 g=g+1
5340 nextn
5341 rem levels
5342 ifs=50thenl=2
5343 ifs=100thenl=3:tg=2
5344 ifs=150thenl=4
5345 ifs=200thenl=5
5346 ifs=250thenl=6:tg=3
5347 ifs=300thenl=7
5348 ifs=350thenl=8
5349 ifs=400thenl=9
5350 ifs=450thenl=10:tg=4
5360 rem some infinate thing after level 10
5365 poke211,8:poke214,1:sys58732:print"{white}"str$(s)
5370 poke211,32:poke214,1:sys58732:print"{white}"str$(l)
5400 goto100
6000 rem Debug
6005 print"{home}":print"debug":print" r     c":print r"  "c"  "str$(xy)
6020 for n=1totg:print gr(n)"  "gc(n)"  "(gr(n)*40+gc(n)):nextn
6035 print "score:"s" gems:"g
6040 return