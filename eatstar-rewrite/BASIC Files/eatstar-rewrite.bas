0goto520
1geti$
2 t=t+1:ift>60thengosub900
3ifi$="w"ori$="s"ori$="a"ori$="d"ori$="{f1}"then5
4goto1
5nr=r:nc=c
6ifi$="w"thennp=p-40:nr=r-1
7ifi$="s"thennp=p+40:nr=r+1
8ifi$="a"thennp=p-1:nc=c-1
9ifi$="d"thennp=p+1:nc=c+1
10ifi$="{f1}"thengosub1000
11ifpeek(m+np)=32thenpokem+p,32:goto15
12ifpeek(m+np)=42thenpokem+p,32:s=s+10:g=g-1:gosub800:goto15
13goto1
15 p=np:c=nc:r=nr:pokem+p,h:pokecr+p,1:goto1
520 print"{clear}":poke53280,0:poke53281,0:poke650,128
530 cr=55296:m=1024:h=87:tg=1:g=1:s=0:l=0:t=0:r=12:c=12:mr=20:mc=20
538 p=r*40+c:mn=mr*40+mc
540 gosub5000
640 pokem+p,0:pokecr+p,h:pokecr+p,1
660 gp=int(rnd(1)*873)+85:ifpeek(1024+gp)<>32then660
666 pokem+gp,42:pokecr+gp,5
700 goto1
800 poke211,8:poke214,1:sys58732:print"{white}"str$(s)"   "
802 poke211,32:poke214,1:sys58732:print"{white}"str$(l)" "
805 forn=1totg
810 gp=int(rnd(1)*873)+85:ifpeek(1024+gp)<>32then810
820 pokem+gp,42:pokecr+gp,5:g=g+1:ifg=tgthenreturn
830 nextn:return
900 t=0
910 
1000 print"{home}{down}{down}{down}{right}p="str$(p)
1010 print"{right}r="str$(r)"   "
1020 print"{right}c="str$(c)"   "
1025 print"{right}ti="str$(ti)"   "
1030 return
5000 rem build top corners
5001 pokem,85:pokem+39,73:pokecr,6:pokecr+39,6
5002 rem build sides
5003 forn=40to920step40:pokem+n,66:pokem+n+39,66:pokecr+n,6:pokecr+n+39,6:nextn
5004 rem build top and bottom
5005 pokem+960,74:pokem+999,75:pokecr+960,6:pokecr+999,6
5006 for n=1to19
5007 pokem+n,67:pokem+39-n,67:pokecr+n,6:pokecr+39-n,6
5008 pokem+n+960,67:pokem+999-n,67:pokecr+n+960,6:pokecr+999-n,6
5009 nextn
5010 rem build score board
5011 print"{home}"
5012 print"{blue}{125} {cyan}score:       {blue}UCI{red}SSSS{blue}UCI {cyan}level:       {blue}{125}";
5013 print"{171}CCCCCCCCCCCCCCK JCCCCK JCCCCCCCCCCCCCC{179}";
5014 poke211,8:poke214,1:sys58732:print"{white}"str$(s)"   "
5015 poke211,32:poke214,1:sys58732:print"{white}"str$(l)" "
5025 return