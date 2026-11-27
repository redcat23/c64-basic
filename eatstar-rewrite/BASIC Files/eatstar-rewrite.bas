0 gosub5000:gosub4000:gosub5500:gosub4400:gosub4100:gosub4300
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
14 ifpeek(m+w)=32thengoto18
15 ifw=pthens=s+10:o=o-1:gosub4100:goto18
16 ifw=athengosub2000
17 goto1
18 ifk=0thengoto4500
19 pokem+h,32:h=w:i=x:j=y:pokem+h,g:pokec+h,1
20 goto1

520 t=ti:a=d:b=e:r=f
530 ife>ithena=a-40:b=b-1:goto565
540 ife<ithena=a+40:b=b+1:goto565
550 iff>jthena=a-1:r=r-1:goto565
560 iff<jthena=a+1:r=r+1
565 ifpeek(m+a)=32then595
570 ifa=pthens=s-10:o=o-1:gosub4100:goto595
575 ifa=hthengosub2000:return
580 a=d:b=e:r=f
582 iff<jthena=a+1:r=r+1:goto590
584 iff>jthena=a-1:r=r-1:goto590
586 ife<ithena=a+40:b=b+1:goto590
588 ife>ithena=a-40:b=b-1
590 ifpeek(m+a)=32then595
591 ifa=pthens=s-10:o=o-1:gosub4100:goto595
592 ifa=hthengosub2000:return
593 ifpeek(m+a)<>32thenreturn
595 pokem+d,32:d=a:e=b:f=r:pokem+d,28:pokec+d,7
600 return

1000 print"{home}{down*3}{right}h="str$(h)"   "
1010 print"{right}i="str$(i)" e="str$(e)"   "
1020 print"{right}j="str$(j)" f="str$(f)"   "
1030 print"{right}n="str$(n)"   "
1040 print"{right}p="str$(p)"   "
1050 print"{right}d="str$(d)"   "
1190 return

2000 pokem+p,32:pokem+d,32:pokem+h,32:o=0
2001 PRINT "{home}{down*6}"
2002 print "{right}             {red}UCCCCCCCCCCI"
2003 PRINT "{right}             {125} you died {125}"
2004 PRINT "{right}             {125}try  again{125}"
2005 PRINT "{right}             JCCCCCCCCCCK"
2020 getx$:ifx$=""thengoto2020
2030 print"{home}{right*8}{down*6}        "
2040 print "{right*3}                        "
2045 n=k-1:k$=left$(k$,n)+right$(b$,k-n):k=n
2050 gosub4400:gosub4100:gosub4300:return

4000 c=55296:m=1024:x=rnd(-ti) 
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

4400 ifl=1thengosub6000
4490 return

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
5502 rem build top corners
5504 pokem,85:pokem+39,73:pokec,6:pokec+39,6
5506 rem build sides
5508 forn=40to920step40:pokem+n,66:pokem+n+39,66:pokec+n,6:pokec+n+39,6:nextn
5510 rem build top and bottom
5512 pokem+960,74:pokem+999,75:pokec+960,6:pokec+999,6
5514 for n=1to19
5516 pokem+n,67:pokem+39-n,67:pokec+n,6:pokec+39-n,6
5518 pokec+n+960,6:pokec+999-n,6:pokem+n+960,67:pokem+999-n,67
5520 nextn
5522 rem build score board
5524 print"{home}"
5526 print"{blue}{125} {cyan}score:       {blue}UCI    UCI {cyan}level:       {blue}{125}";
5528 print"{171}CCCCCCCCCCCCCCK JCCCCK JCCCCCCCCCCCCCC{179}";
5530 return

6000 rem level1
6001 print"{home}{down*5}";
6002 PRINT "{right}   {blue}U{096}{096}{096}I UI                UI U{096}{096}{096}I"
6004 PRINT "{right}   J{096}{096}{096}K JK                JK J{096}{096}{096}K"
6006 PRINT "{right}                  UI"
6008 PRINT "{right}         UI       BB       UI"
6010 PRINT "{right}         BB       BB       BB"
6012 PRINT "{right}         JK       JK       JK"
6013 print "{right}"
6014 PRINT "{right}         U{096}{096}{096}{096}{096}{096}I UI U{096}{096}{096}{096}{096}{096}I"
6016 PRINT "{right}         J{096}{096}{096}{096}{096}{096}K JK J{096}{096}{096}{096}{096}{096}K"
6017 print "{right}"
6018 PRINT "{right}                  UI"
6020 PRINT "{right}         UI       BB       UI"
6022 PRINT "{right}         BB       BB       BB"
6024 PRINT "{right}         JK       JK       JK"
6025 print "{right}"
6026 PRINT "{right}   U{096}{096}{096}I UI                UI U{096}{096}{096}I"
6028 PRINT "{right}   J{096}{096}{096}K JK                JK J{096}{096}{096}K"
6050 return
