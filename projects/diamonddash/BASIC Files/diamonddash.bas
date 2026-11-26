0 goto1000
1 t=peek(197):ift=64then1
3 ift=10thenj=j-1:goto8
4 ift=18thenj=j+1:goto8
5 ift=9thenj=j-40:goto8
6 ift=13thenj=j+40:goto8
7 goto1
8 ifpeek(j)=32thenpokek,c:pokej,z:k=j:goto1
9 ifpeek(j)<>32thenj=k:goto1
1000 poke53280,0:poke53281,0
1010 print"{clear}"
1020 k=1562:j=1563:z=87:c=32:m=1024:s=5
2000 pokem,85:pokem+39,73:poke1984,74:poke1984+39,75
2005 forn=1to19:pokem+n,67:pokem+39-n,67:poke1984+39-n,67:poke1984+n,67:nextn
2010 forn=1to12:pokem+40*n,93:pokem+40*n+39,93
2015 pokem+40*(24-n),93:pokem+40*(24-n)+39,93:nextn
2990 goto8
5000 rem version 0.2.0
5010 rem movement and border
5020 rem movement improved
6000 rem 0-jump to init; 1-7 moves
6001 rem 8-9 collision detection
6002 rem 1000-1020 initial setup 
6003 rem 2000-2990 draw border