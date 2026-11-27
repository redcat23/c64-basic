1 rem 1.2 draw the game boad and move the @ as optimized as i know how
5 q = rnd(-ti)
10 rc=58732:a=211:b=214
12 x=20:y=12:l=1:r=38:u=3:d=22:sc=0:g=1:tg=2
14 dim gg(20)
20 poke 53280,0:poke53281,0:poke 650,128
40 print "{clear}"
41 poke a,0:pokeb,0:sysrc
42 PRINT "{blue}UCCCCCCCCCCCCCC{096}C{096}CCCC{096}C{096}CCCCCCCCCCCCCCI";
43 PRINT "{125} score:       UCI{red}SSSS{blue}UCI level:       {125}";
44 PRINT "{171}CCCCCCCCCCCCCCK JCCCCK JCCCCCCCCCCCCCC{179}";
45 PRINT "B                                      {125}";
46 PRINT "B                                      B";
47 PRINT "B                                      B";
48 PRINT "B                                      B";
49 PRINT "B                                      B";
50 PRINT "B                                      B";
51 PRINT "B                                      B";
52 PRINT "B                                      B";
53 PRINT "B                                      B";
54 PRINT "B                                      B";
55 PRINT "B                                      B";
56 PRINT "B                                      B";
57 PRINT "B                                      B";
58 PRINT "B                                      B";
59 PRINT "B                                      B";
60 PRINT "B                                      B";
61 PRINT "B                                      B";
62 PRINT "B                                      B";
63 PRINT "B                                      B";
64 PRINT "B                                      B";
65 PRINT "J{096}{096}{096}{096}{096}{096}{096}{096}{096}{096}{096}{096}{096}{096}{096}{096}{096}{096}{096}{096}{096}{096}{096}{096}{096}{096}{096}{096}{096}{096}{096}{096}{096}{096}{096}{096}{096}{096}K";
95 pokea,x:pokeb,y:sysrc:print"{yellow}@"
100 goto 500
500 rem **** score/level ****
510 pokea,8:pokeb,1:sysrc:print"{white}"str$(sc)
520 pokea,32:pokeb,1:sysrc:print"{white}"str$(l)
600 rem **** main loop **** 
620 get mv$
625 if mv$<>"" then gosub 800
630 if g<tg then gosub 1000
695 goto 600
800 rem move the hero
801 px=x:py=y
802 if mv$="d"then x=x+1:goto815
803 if mv$="a"then x=x-1:goto815
804 if mv$="w"then y=y-1:goto815
805 if mv$="s"then y=y+1:goto815
806 if mv$="q"then y=y-1:x=x-1:goto815
807 if mv$="e"then y=y-1:x=x+1:goto815
808 if mv$="c"then y=y+1:x=x+1:goto815
809 if mv$="z"then y=y+1:x=x-1:goto815
812 return
815 rem ***** set boundaries *****
816 if x=l-1 then x=l
817 if x=r+1 then x=r
818 if y=u-1 then y=u
819 if y=d+1 then y=d
820 if px=x and py=y then return:rem so you dont flicker at screen edge
990 pokea,px:pokeb,py:sysrc:print" "
995 pokea,x:pokeb,y:sysrc:print"{yellow}@":gosub 2000
997 pokea,8:pokeb,1:sysrc:print"{white}"str$(sc)
998 pokea,32:pokeb,1:sysrc:print"{white}"str$(l)
999 return
1000 rem **** gems! ****
1005 g=g+1
1010 for n=1tog
1020 ifgg(n)=0thengmx(n)=(int(rnd(2)*38)+1):gmy(n)=(int(rnd(1)*21)+2)
1025 ifgg(n)=0thenpokea,gmx(n):pokeb,gmy(n):sysrc:print"{white}*":gg(n)=1
1030 next n
1040 return
2000 rem **** eating a gem ****
2005 for n=1totg
2010 ifx=gmx(n)andy=gmy(n)thensc=sc+10:g=g-1:gg(n)=0
2020 next n
2030 return