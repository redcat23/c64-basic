0 goto1000
1 t=peek(197):ift=64then1
3 ift=10thenj=j-1:jc=jc-1:goto8
4 ift=18thenj=j+1:jc=jc+1:goto8
5 ift=9thenj=j-40:jc=jc-40:goto8
6 ift=13thenj=j+40:jc=jc+40:goto8
7 ift=62thenend
8 ifpeek(j)=dorpeek(j)=cthenpokej,c:pokejc,1:pokej,z:pokek,c:kc=jc:k=j:goto1
9 ifpeek(j)=uthencs=cs-1:pokek,c:pokej,c:pokejc,1:pokej,z:kc=jc:k=j:goto100
10 ifpeek(j)<>cthenjc=kc:j=k:goto1
100 rem *** diamonds ***
101 sc=sc+25:dc=dc+1
102 ifdc=gsthenpoke53281,1:poke53281,0
105 print"{home}{right}{right}{right}{right}{right}{white}"sc
106 print"{home}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}"dc
107 print"{home}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}"gs
108 print"{home}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}{right}"tm-ti"
150 goto1
1000 rem *** setup and init ***
1001 x=rnd(-ti):poke53280,12:poke53281,0
1010 print"{clear}"
1020 z=28:c=32:u=90:d=102:b=186:sc=0:l=1:mt=1984:qt=56256
2000 rem *** simple bottom border ***
2001 forn=0to19:pokeqt+n,2:pokeqt+39-n,2:pokemt+n,b:pokemt+39-n,b:nextn
2500 REM ** score board **
2501 print"{home}{red}{reverse on}score{reverse off}       {reverse on}diamond{reverse off}    {reverse on}goal{reverse off}    {reverse on}time{reverse off}";
2510 goto3000
3000 rem ** level 1 **
3001 tm=20:gs=1:dc=0:j=1105:jc=55377:k=j:kc=jc
3005 print"{home}"
3006 print"{reverse on}{red}::::::::::::::::::::::::::::::::::::::::";
3007 print"{reverse off}{reverse on}:{reverse off} {dark gray}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{reverse on}{red} {reverse off}{dark gray}{166}{166}{yellow}{218}{reverse on}{red}:";
3008 print"{reverse off}{reverse on}:{reverse off}{dark gray}{166}{166}{166}{166}{yellow}{218}{dark gray}{166}{166}{166}{166}{166}{166}{reverse on}{red}  {reverse off}{dark gray}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{reverse on}{red} {reverse off}{dark gray}{166}{166}{166}{reverse on}{red}:";
3009 print"{reverse off}{reverse on}:{reverse off}{dark gray}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{reverse on}{red}     {reverse off}{yellow}{218}{dark gray}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{reverse on}{red} {reverse off}{dark gray}{166}{166}{166}{reverse on}{red}:";
3010 print"{reverse off}{reverse on}:             {reverse off}{dark gray}{166}{166}{166}{reverse on}{red}     {reverse off}{dark gray}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{reverse on}{red}  {reverse off}{dark gray}{166}{166}{reverse on}{red}:";
3011 print"{reverse off}{reverse on}:{reverse off}{dark gray}{166}{166}{166}{reverse on}{red} {reverse off}{dark gray}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{reverse on}{red}          {reverse off}{dark gray}{166}{166}{166}{166}{166}{reverse on}{red} {reverse off}{dark gray}{166}{166}{reverse on}{red}:";
3012 print"{reverse off}{reverse on}:{reverse off}{yellow}{218}{dark gray}{166}{166}{reverse on}{red}   {reverse off}{dark gray}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{reverse on}{red}  {reverse off}{dark gray}{166}{reverse on}{red}:";
3013 print"{reverse off}{reverse on}:{reverse off}{dark gray}{166}{166}{166}{reverse on}{red}   {reverse off}{dark gray}{166}{166}{166}{166}{166}{166}{166}{yellow}{218}{dark gray}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{yellow}{218}{dark gray}{166}{166}{166}{166}{166}{166}{166}{reverse on}{red}:";
3014 print"{reverse off}{reverse on}:{reverse off}{dark gray}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{reverse on}{red} {reverse off}{dark gray}{166}{166}{166}{166}{166}{166}{166}{166}{reverse on}{red}:";
3015 print"{reverse off}{reverse on}:{reverse off}{dark gray}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{reverse on}{red}                     :";
3016 print"{reverse off}{reverse on}:    {reverse off}{dark gray}{166}{166}{166}{166}{reverse on}{red}          {reverse off}{dark gray}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{reverse on}{red}:";
3017 print"{reverse off}{reverse on}:{reverse off}{dark gray}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{yellow}{218}{dark gray}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{reverse on}{red}:";
3018 print"{reverse off}{reverse on}:{reverse off}{dark gray}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{reverse on}{red} {reverse off}{dark gray}{166}{166}{166}{166}{reverse on}{red}:";
3019 print"{reverse off}{reverse on}:{reverse off}{dark gray}{166}{yellow}{218}{dark gray}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{reverse on}{red}      {reverse off}{dark gray}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{reverse on}{red} {reverse off}{yellow}{218}{dark gray}{166}{166}{166}{reverse on}{red}:";
3020 print"{reverse off}{reverse on}:{reverse off}{dark gray}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{reverse on}{red}     {reverse off}{dark gray}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{reverse on}{red}  {reverse off}{dark gray}{166}{166}{166}{reverse on}{red}:";
3021 print"{reverse off}{reverse on}:      {reverse off}{dark gray}{166}{166}{166}{166}{166}{166}{reverse on}{red} {reverse off}{dark gray}{166}{166}{166}{166}{166}{166}{166}{166}{166}{reverse on}{red}      {reverse off}{dark gray}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{reverse on}{red}:";
3022 print"{reverse off}{reverse on}:{reverse off}{dark gray}{166}{166}{166}{166}{166}{reverse on}{red} {reverse off}{dark gray}{166}{166}{166}{166}{166}{166}{reverse on}{red} {reverse off}{dark gray}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{reverse on}{red}      {reverse off}{dark gray}{166}{166}{166}{166}{166}{166}{reverse on}{red}:";
3023 print"{reverse off}{reverse on}:{reverse off}{dark gray}{166}{166}{166}{166}{166}{reverse on}{red}        {reverse off}{dark gray}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{reverse on}{red}       :";
3024 print"{reverse off}{reverse on}:{reverse off}{dark gray}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{reverse on}{red}:";
3025 print"{reverse off}{reverse on}:{reverse off}{dark gray}{166}{yellow}{218}{dark gray}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{reverse on}{red} {reverse off}{dark gray}{166}{166}{166}{166}{166}{166}{166}{166}{166}{yellow}{218}{dark gray}{166}{166}{166}{166}{166}{166}{reverse on}{red}:";
3026 print"{reverse off}{reverse on}:{reverse off}{dark gray}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{yellow}{218}{dark gray}{166}{166}{166}{166}{166}{166}{reverse on}{red}  {reverse off}{dark gray}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{reverse on}{red}:";
3027 print"{reverse off}{reverse on}:{reverse off}{dark gray}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{reverse on}{red}  {reverse off}{dark gray}{166}{166}{166}{166}{yellow}{218}{dark gray}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{reverse on}{red}:";
3028 print"{reverse off}{reverse on}:{reverse off}{dark gray}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{reverse on}{red}  {reverse off}{dark gray}{166}{166}{166}{166}{166}{166}{166}{166}{166}{reverse on}{red}   {reverse off}{dark gray}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{reverse on}{red}:{reverse off}";
3029 pokej,z:pokejc,1:ti$="000000":goto105
5000 rem ==version 0.4.0===============
5010 rem movement and border
5020 rem movement improved
5030 rem added random food generation, ability to eat, and score
5040 rem added level board/goal, removed random food generation, updated docs
6000 rem ==line descriptions===========
6001 rem 0           jump to init
6002 rem 1    - 6    moves
6003 rem 7           quit
6004 rem 8    - 10   collision detection
6005 rem 100  - 102  diamond check
6006 rem 105  - 150  update score board
6007 rem 1000 - 1020 initial setup
6008 rem 2000 - 2001 draw border on the last line
6009 rem 2500 - 2510 draw the scoreboard
6010 rem 3000 - 3029 level 1 board
7000 rem ==variables===================
7001 rem x  = randomize timer
7002 rem t  = keyboard peek
7003 rem mt = 1984 (last line of screen ram)
7004 rem qt = 56256 (last line of screen ram color)
7005 rem j  = avatar position
7006 rem k  = old avatar position
7007 rem n  = generic counter
7008 rem sc = score
7009 rem l  = level
7010 rem tm = time allowed for level
7011 rem s  = total diamonds in level
7012 rem dc = diamonds collected
7013 rem gs = diamond goal in level
7014 rem c  = space character
7015 rem u  = diamond character
7016 rem z  = avatar character
7017 rem d  = dirt character
7018 rem b  = brick character