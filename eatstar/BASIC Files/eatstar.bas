1 rem got the dude to move, 1 randomly placed gem and the game board
5 print"{clear}"
10 rem i=screen r=row c=column m=1024(1mb)
15 rem (west,east,top,bottom) tg=total gems
20 clr
25 x=rnd(-ti):r=12:c=20:m=1024:w=1:e=38:t=3:b=23:tg=1:g=0
30 poke 53280,1:poke53281,0:poke 650,128
40 rem build top corners
41 poke1024,85:poke1024+39,73:poke55296,6:poke55296+39,6
42 rem build sides
43 for n=40to920 step 40
44 poke1024+n,66:poke1024+n+39,66:poke55296+n,6:poke55296+n+39,6
45 nextn
46 rem build top and bottom
47 poke1024+960,74:poke1024+999,75:poke55296+960,6:poke55296+999,6
48 for n=1to19
49 poke1024+n,67:poke1024+39-n,67:poke55296+n,6:poke55296+39-n,6
50 poke1024+n+960,67:poke1024+999-n,67:poke55296+n+960,6:poke55296+999-n,6
51 nextn 
55 rem build score board
56 print "{home}"
57 print "{blue}{125} score:       UCI{red}SSSS{blue}UCI level:       {125}";
58 print "{171}CCCCCCCCCCCCCCK JCCCCK JCCCCCCCCCCCCCC{179}";
70 rem draw starting location before game starts
75 poke 1024+r*40+c,0
100 rem main loop
104 rem check stuff
105 ifg<>tg then gosub 5000
110 rp=r:cp=c:rem ip = before change
120 get mv$
130 if mv$="{f1}" then gosub 1000
140 if mv$="d" then c=c+1
150 if mv$="a" then c=c-1
160 if mv$="w" then r=r-1
170 if mv$="s" then r=r+1
180 if c=e+1 then c=e
190 if c=w-1 then c=w
200 if r=t-1 then r=t
210 if r=b+1 then r=b
220 if mv$="" goto 100
225 if c=cp and r=rp then goto 100
230 rem draw main dude
240 poke m+rp*40+cp,96:poke m+r*40+c,0:poke55296+r*40+c,1
250 gosub 5200
300 goto 100
1000 rem Debug
1005 print"{home}"
1007 print "debug"
1008 print" r     c"
1010 print r"  "c"  "str$(r*40+c)
1020 for n=1totg
1025 print gr(n)"  "gc(n)"  "(gr(n)*40+gc(n))
1030 nextn
1035 print s
1040 return
5000 rem gems
5010 for n=1totg
5015 g=g+1
5020 gr(n)=int(rnd(1)*20)+3:gc(n)=int(rnd(1)*e-1)+w+1
5030 poke m+gr(n)*40+gc(n),42:poke55296+gr(n)*40+gc(n),5
5040 return
5200 rem gem check
5210 for n=1totg
5220 if gr(n)*40+gc(n)=r*40+c then s=s+10:g=g-1:return
5230 nextn:return