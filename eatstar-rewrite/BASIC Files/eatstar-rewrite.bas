0 clr:gosub5000:gosub4000:gosub5500:gosub4400:gosub4100:gosub4300
1 getx$:ifx$<>""theny$=x$
2 ifti-t>zthengosub520:gosub620
3 ify$="w"ory$="s"ory$="a"ory$="d"ory$="{f1}"then5
4 goto1
5 w=h:x=i:y=j
6 ify$="w"thenw=h-40:x=i-1
7 ify$="s"thenw=h+40:x=i+1
8 ify$="a"thenw=h-1:y=j-1
9 ify$="d"thenw=h+1:y=j+1
10 ify$="{f1}"thengosub1000
14 ifpeek(m+w)=32thengoto19
15 ifw=pthens=s+10:o=o-1:gosub3000:gosub4100:goto19
16 ifw=athengosub2000
17 goto1
19 pokem+h,32:h=w:i=x:j=y:pokem+h,g:pokec+h,1
20 goto1

520 t=ti:a=d:b=e:r=f
521 ife>ithena=a-40:b=b-1:n=1:goto530
522 ife<ithena=a+40:b=b+1:n=2:goto530
523 iff>jthena=a-1:r=r-1:n=3:goto530
524 iff<jthena=a+1:r=r+1:n=4:goto530
525 return
530 ifpeek(m+a)=32thengoto550
535 ifa=pthens=s-10:gosub3010:o=o-1:gosub4100:goto550
540 ifa=hthengosub2000:return
545 a=d:b=e:r=f:onngoto522,523,524:return
550 pokem+d,32:d=a:e=b:f=r:pokec+d,7:pokem+d,28
555 return

620 t=ti:a2=d2:b2=e2:r2=f2
621 iff2>jthena2=a2-1:r2=r2-1:n=1:goto630
622 iff2<jthena2=a2+1:r2=r2+1:n=2:goto630
623 ife2>ithena2=a2-40:b2=b2-1:n=3:goto630
624 ife2<ithena2=a2+40:b2=b2+1:n=4:goto630
625 return
630 ifpeek(m+a2)=32thengoto650
635 ifa2=pthens=s-10:gosub3010:o=o-1:gosub4100:goto650
640 ifa2=hthengosub2000:return
645 a2=d2:b2=e2:r2=f2:onngoto622,623,624:return
650 pokem+d2,32:d2=a2:e2=b2:f2=r2:pokec+d2,7:pokem+d2,94
655 return

1000 print"{home}{down*3}{right}h="str$(h)"   "
1005 print"{right}i="str$(i)" e="str$(e2)"   "
1010 print"{right}j="str$(j)" f="str$(f2)"   "
1020 print"{right}ti="ti$" ti"str$(ti)" z="str$(z)
1025 print"{right}d="str$(d2)"   "
1090 return

2000 pokem+d,32:pokem+d2,32:pokem+p,32:pokec+h,2:pokem+h,86:gosub3020:pokem+h,32:o=0
2001 PRINT"{home}{down*6}"
2002 printtab(14)"{red}UCCCCCCCCCCI"
2003 printtab(14)"{125} you died {125}"
2004 printtab(14)"{125}try  again{125}"
2005 printtab(14)"{125}space  bar{125}"
2006 printtab(14)"JCCCCCCCCCCK"
2020 getx$:ifx$<>" "thengoto2020
2021 print"{home}{down*6}"
2022 printtab(14)"            "
2032 printtab(14)"            "
2038 printtab(14)"            "
2042 printtab(14)"            "
2044 printtab(14)"            "
2045 n=k-1:k$=left$(k$,n)+right$(b$,k-n):k=n
2050 gosub4400:gosub4100:gosub4300:return

3000 n=int(rnd(1)*20)+40
3005 pokev+1,n:pokev+5,10:pokev+6,3:pokev+4,17:pokev+4,16:return:rem sndgood
3010 pokev+1,5:pokev+5,5:pokev+6,4:pokev+4,33:pokev+4,32:return:rem sndbad
3020 pokev+1,4:pokev+5,18:pokev+6,89:pokev+4,129:rem deathsnd
3025 forn=1to500:next:pokev+4,128:return

4000 c=55296:m=1024:x=rnd(-ti) 
4005 g=87:l=1:s=0:o=0:q=1:z=15:k=4:u=1
4010 t=ti
4015 v=54272:forn=vtov+24:poken,0:next:pokev+24,15
4020 k$="SSSS":b$="    "
4090 return

4100 ifo=qthengoto4200
4110 p=int(rnd(1)*873)+85:ifpeek(m+p)<>32then4110
4120 pokem+p,42:pokec+p,5
4130 o=o+1:goto4100
4200 poke211,8:poke214,1:sys58732:print"{white}"str$(s)"   ";
4210 poke211,32:poke214,1:sys58732:print"{white}"str$(l)" ";
4220 print"{home}{down}"tab(18)"{red}"k$
4230 ifk=0thengoto4500
4290 return

4300 i=2:j=16:e=3:f=38:e2=23:f2=3
4302 h=i*40+j:d=e*40+f:d2=e2*40+f2
4305 pokem+h,g:pokec+h,1
4310 pokem+d,28:pokec+d,7
4315 pokem+d2,94:pokec2+d2,7
4320 return

4400 ifl=1thengosub6000
4410 ifl=2thengosub6100
4490 return

4500 print"{clear}{down*12}"tab(15)"game over"
4510 print"{down}"tab(10)"press any key to play again"
4520 get x$:ifx$=""then4520
4530 goto0

5000 print"{clear}"
5010 print"{down*12}"tab(10)"this is the title screen"
5020 print"{home}{down*20}"tab(12)"press a key"
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
6001 print"{home}{down*4}";
6002 PRINT"{right}   {blue}U{096}{096}{096}I UI                UI U{096}{096}{096}I"
6004 PRINT"{right}   J{096}{096}{096}K JK                JK J{096}{096}{096}K"
6005 print"{right}"
6006 PRINT"{right}                  UI"
6008 PRINT"{right}         UI       BB       UI"
6010 PRINT"{right}         BB       BB       BB"
6012 PRINT"{right}         JK       JK       JK"
6013 print"{right}"
6014 PRINT"{right}         U{096}{096}{096}{096}{096}{096}I UI U{096}{096}{096}{096}{096}{096}I"
6016 PRINT"{right}         J{096}{096}{096}{096}{096}{096}K JK J{096}{096}{096}{096}{096}{096}K"
6017 print"{right}"
6018 PRINT"{right}         UI       UI       UI"
6020 PRINT"{right}         BB       BB       BB"
6022 PRINT"{right}         JK       BB       JK"
6024 print"{right}                  JK"
6025 print"{right}"
6026 PRINT"{right}   U{096}{096}{096}I UI                UI U{096}{096}{096}I"
6028 PRINT"{right}   J{096}{096}{096}K JK                JK J{096}{096}{096}K"
6050 return

6100 rem level2
6101 print"{home}{down*2}";
6103 PRINT"{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{blue}IB{right}BU{right}{right}IB{right}BU"
6104 PRINT"{right}             {125}{125} {125}{125}  {125}{125} {125}{125}"
6106 PRINT"{right} UCCCCCCCCI  {125}{125} {125}{125}  {125}{125} {125}{125}  UCCCCCCCCI"
6108 PRINT"{right} JCCCCCCCIB  JK {125}{125}  {125}{125} JK  BUCCCCCCCK"
6110 PRINT"{right}         BJI    {125}{125}  {125}{125}    UKB"
6112 PRINT"{right}         JIJ{096}I  JK  JK  UCKUK"
6114 PRINT"{right}    UI    J{096}{096}K          JCCK    UI"
6116 PRINT"{right}    JK                          JK"
6118 PRINT"{right}             UCCCCCCCCCCI"
6120 PRINT"{right}        UI   JCCCCCCCCCCK   UI"
6122 PRINT"{right}        JK                  JK"
6123 print"{right}"
6124 PRINT"{right}  UI              UI              UI"
6126 PRINT"{right}  BJI             JK             UKB"
6128 PRINT"{right}  JIB                            BUK"
6130 PRINT"{right}   BJI     U{096}I          U{096}I     UKB"
6132 PRINT"{right}   JIB     BUK          JIB     BUK"
6134 PRINT"{right}    BB     B{125}   U{096}{096}{096}{096}I   {125}{125}     BB"
6136 PRINT"{right}    BB     JK   J{096}{096}{096}{096}K   JK     BB"
6138 PRINT"{right}    JK                          JK"
6150 return