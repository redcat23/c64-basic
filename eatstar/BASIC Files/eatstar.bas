1 rem 0.5 re-write: dude moves, 1 randomly placed gem and the game board
2 rem 0.6 code optimizatons, levels with multiple stars (buggy)
3 rem 0.7 re-write after learning collision peeking.  so much faster. basic ai
10 print"{clear}"
20 x=rnd(-ti) 
30 poke53280,0:poke53281,0:poke650,128
35 m=1024:cr=55296
40 tg=1:g=0:l=1:b=797:p=660
49 rem
50 rem build top corners
51 pokem,85:pokem+39,73:pokecr,6:pokecr+39,6
52 rem build sides
53 forn=40to920step40:pokem+n,66:pokem+n+39,66:pokecr+n,6:pokecr+n+39,6:nextn
54 rem build top and bottom
55 pokem+960,74:pokem+999,75:pokecr+960,6:pokecr+999,6
56 for n=1to19
57 pokem+n,67:pokem+39-n,67:pokecr+n,6:pokecr+39-n,6
58 pokem+n+960,67:pokem+999-n,67:pokecr+n+960,6:pokecr+999-n,6
59 nextn
60 rem build score board
61 print"{home}"
62 print"{blue}{125} {cyan}score:       {blue}UCI{red}SSSS{blue}UCI {cyan}level:       {blue}{125}";
63 print"{171}CCCCCCCCCCCCCCK JCCCCK JCCCCCCCCCCCCCC{179}";
70 rem initialization
90 gosub711:rem build the score board
100 rem main loop
105 pokem+p,0:pokecr+p,1
110 gosub800
115 ifg<tgthengosub600
120 getmv$:if mv$=""then100
125 ifmv$="{f1}"thengosub6000
130 ifmv$=""then120
140 ifmv$="w"thennp=p-40
150 ifmv$="s"thennp=p+40
160 ifmv$="a"thennp=p-1
170 ifmv$="d"thennp=p+1
180 ifnp=pthen100
190 ifpeek(1024+np)=32thenpokem+p,32:p=np:goto100
200 ifpeek(1024+np)=42theng=g-1:s=s+10:pokem+p,32:p=np:goto100
290 np=p
300 goto100
595 rem
600 rem gems
605 gosub700
610 forn=1totg
620 gp=int(rnd(1)*873)+85:ifpeek(1024+gp)<>32then620
635 pokem+gp,42:pokecr+gp,5:g=g+1:ifg=tgthenreturn
640 nextn:return
690 rem
700 rem levels
701 ifs=50thenl=2:goto711
702 ifs=100thenl=3:tg=2:goto711
703 ifs=150thenl=4:goto711
704 ifs=200thenl=5:goto711
705 ifs=250thenl=6:tg=3:goto711
706 ifs=300thenl=7:goto711
707 ifs=350thenl=8:goto711
708 ifs=400thenl=9:goto711
709 ifs=450thenl=10:tg=4:goto711
710 rem some infinate thing after level 10
711 poke211,8:poke214,1:sys58732:print"{white}"str$(s)"   "
712 poke211,32:poke214,1:sys58732:print"{white}"str$(l)" "
715 return
720 rem
800 rem enemies
830 ifp-b>40thennb=b+40:goto890
840 ifp-b<-40thennb=b-40:goto890
850 ifp-b<0thennb=b-1:goto890
860 ifp-b>0thennb=b+1:goto890
890 ifpeek(1024+nb)=32thenpokem+b,32:b=nb:pokem+b,88:pokecr+b,7
900 ifpeek(1024+nb)=42thenpokem+b,32:b=nb:s=s-10:g=g-1:pokem+b,88:pokecr+b,7
1090 return
6000 rem debug
6010 print "{home}{down*2}{right*2}"
6020 print "{right}gems      ="str$(g)"   "
6030 print "{right}gem pos   ="str$(gp)"   "
6035 print "{right}player pos="str$(p)"   "
6040 print "{right}enemy pos ="str$(b)"   "
6050 print "{right}math      ="str$(p-b)"   "
6190 return