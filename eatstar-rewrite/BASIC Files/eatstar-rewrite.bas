0 gosub5000:gosub4000:gosub5500:gosub4100:gosub4300
1 getx$:ifx$<>""theny$=x$
2 ifti-t>zthengosub520
3 ify$="w"ory$="s"ory$="a"ory$="d"ory$="{f1}"then5
4 goto1
5 w=h:x=i:y=j
6 ify$="w"thenw=h-40:x=i-1
7 ify$="s"thenw=h+40:x=i+1
8 ify$="a"thenw=h-1:y=j-1
9 ify$="d"thenw=h+1:y=j+1
10 ify$="{f1}"thengosub1000
11 ifpeek(m+w)=32thengoto15
12 ifw=pthens=s+10:o=o-1:gosub4100:goto15
14 goto1

15 ifk=0thengoto4500
16 pokem+h,32:h=w:i=x:j=y:pokem+h,g:pokec+h,1

20 goto1

520 t=ti
525 pokem+d,32
530 ife>ithend=d-40:e=e-1:goto565
540 ife<ithend=d+40:e=e+1:goto565
550 iff>jthend=d-1:f=f-1:goto565
560 iff<jthend=d+1:f=f+1:goto565
565 pokem+d,28:pokec+d,7
570 ifd=pthens=s-10:o=o-1:gosub4100
575 ifd=hthengosub2000
580 return

1000 print"{home}{down*3}{right}h="str$(h)"   "
1010 print "{right}i="str$(i)"   "
1020 print "{right}j="str$(j)"   "
1030 print "{right}n="str$(n)"   "
1040 print "{right}p="str$(p)"   "
1050 print "{right}d="str$(d)"   "
1190 return

2000 pokem+p,32:poke m+d,32:o=0
2005 print"{home}{down*6}{right*8}you died"
2010 print "{right*3}press a key to try again"
2020 getx$:ifx$=""thengoto2020
2030 print"{home}{right*8}{down*6}        "
2040 print "{right*3}                        "
2045 n=k-1:k$=left$(k$,n)+right$(b$,k-n):k=n
2050 gosub4100:gosub4300:return

4000 c=55296:m=1024
4005 g=87:i=12:j=12:l=1:s=0:o=0:q=1:e=20:f=20:z=15:k=4
4010 h=i*40+j:d=e*40+f:t=ti
4020 k$="SSSS":b$="    "
4090 return

4100 ifo=qthengoto4200
4110 p=int(rnd(1)*873)+85:ifpeek(m+p)<>32then4110
4120 pokem+p,42:pokec+p,5
4130 o=o+1:goto4100

4200 poke211,8:poke214,1:sys58732:print"{white}"str$(s)"   ";
4210 poke211,32:poke214,1:sys58732:print"{white}"str$(l)" ";
4220 print"{home}{down}{right*18}{red}"k$
4290 return

4300 i=int(rnd(1)*19)+3:j=int(rnd(1)*38)+1:h=i*40+j:ifpeek(m+h)<>32then4300
4302 e=int(rnd(1)*19)+3:f=int(rnd(1)*38)+1:d=e*40+f:ifpeek(m+d)<>32then4302
4305 pokem+h,g:pokec+h,1
4310 pokem+d,28:pokec+d,7
4320 return

4500 print"{clear}{down*12}{right*15}game over"
4510 print"{down}{right*10}press any key to play again"
4520 get x$:ifx$=""then4520
4530 goto0

5000 print"{clear}"
5010 print"{down*12}{right*10}this is the title screen"
5020 print"{home}{down*20}{right*12}press a key"
5030 getx$:ifx$=""thengoto5030
5090 return

5500 print"{clear}":poke53280,0:poke53281,0:poke650,128
5501 rem build top corners
5502 pokem,85:pokem+39,73:pokec,6:pokec+39,6
5503 rem build sides
5504 forn=40to920step40:pokem+n,66:pokem+n+39,66:pokec+n,6:pokec+n+39,6:nextn
5505 rem build top and bottom
5506 pokem+960,74:pokem+999,75:pokec+960,6:pokec+999,6
5507 for n=1to19
5508 pokem+n,67:pokem+39-n,67:pokec+n,6:pokec+39-n,6
5509 pokec+n+960,6:pokec+999-n,6:pokem+n+960,67:pokem+999-n,67
5510 nextn
5511 rem build score board
5512 print"{home}"
5513 print"{blue}{125} {cyan}score:       {blue}UCI    UCI {cyan}level:       {blue}{125}";
5514 print"{171}CCCCCCCCCCCCCCK JCCCCK JCCCCCCCCCCCCCC{179}";
5600 return