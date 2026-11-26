0 goto1000
1 t=peek(197):ift=64then1
3 ift=10thenj=j-1:goto8
4 ift=18thenj=j+1:goto8
5 ift=9thenj=j-40:goto8
6 ift=13thenj=j+40:goto8
7 rem ift=62thenend
8 ifpeek(j)=cthenpokek,c:pokej,z:k=j:goto1
9 ifpeek(j)=uthencs=cs-1:pokej,c:sc=sc+25:goto100
10 ifpeek(j)<>cthenj=k:goto1
100 rem *** stars ***
110 ifcs=sthengoto8
120 n=int(rnd(1065)*1982)+1:ifpeek(n)=cthencs=cs+1:poken,u
130 print"{home}{right}{right}{right}{right}{right}{right}{right}"sc
150 goto100
1000 rem *** setup and init ***
1001 poke53280,0:poke53281,0:x=rnd(-ti)
1010 print"{clear}"
1020 k=1562:j=1563:z=87:c=32:m=1024:s=5:cs=0:u=42:sc=0
2000 rem *** simple border ***
2001 pokem,85:pokem+39,73:poke1984,74:poke1984+39,75
2005 forn=1to19:pokem+n,67:pokem+39-n,67:poke1984+39-n,67:poke1984+n,67:nextn
2010 forn=1to12:pokem+40*n,93:pokem+40*n+39,93
2015 pokem+40*(24-n),93:pokem+40*(24-n)+39,93:nextn
2025 print"{home}{right}{right}score";sc
2990 goto100
5000 rem version 0.3.0
5010 rem movement and border
5020 rem movement improved
5030 rem added random generation, ability to eat, and score
6000 rem 1-6 moves
6001 rem 8-10 check for things
6002 rem 100-150 food check
6003 rem 1000-1020 initial setup
6004 rem 2000-2990 setup simple game board (should make this straight ascii)