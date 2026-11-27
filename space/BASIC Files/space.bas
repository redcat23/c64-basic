10 print"{clear}":printchr$(14):poke53280,0:poke 53281,0
100 rem control variables initialization
110 ns=8:ao=8:av=10:wl=3:pl=1
120 r=214:c=211:f=58732
130 dim sp$(ns),pa(ns,6),ob$(ao),rn$(ao),ob(ao)
190 gosub 25000
900 rem set directions
901 fordi=1to6:read di$(di):nextdi
910 rem set verbs
911 fori=1toav:read ve$(i):vl$(i)=left$(ve$(i),3):nexti
920 rem set objects
921 forob=1toao:read ob$(ob),rn$(ob),ob(ob),wt(ob):next
930 rem set rooms
931 forsp=1tons:readsp$(sp):fordi=1to6:read pa(sp,di):nextdi:nextsp
1080 rem start the loop
1090 pokec,0:poker,0:sysf
1100 forl=1to10:printbl$:nextl
1130 poke211,0:poke214,0:sys 58732
1150 print"{light blue}{reverse on}";sp$(pl);"{reverse off}"
1170 for i=1toao
1180 if ob(i)<>plthen1210
1185 fl(1)=-1:ifpos(0)<9thenprint"There is ";
1190 if pos(0)+len(ob$(i))+2<=39thenprintob$(i);", ";:goto1210
1200 if pos(0)+len(ob$(i))+2>39thenprint:goto1190
1210 nexti
1220 iffl(1) then print chr$(157);chr$(157);".":fl(1)=0
1240 print"{blue}there are exits to the ";
1250 fordi=1to6
1260 if pa(pl,di)=0 then 1310
1270 if pos(0)=23thenprintdi$(di);:goto1310
1280 if pos(0)+len(di$(di))<37thenprint", ";di$(di);:goto1310
1290 if pos(0)+len(di$(di))>=37thenprint", ":print di$(di);:goto1310
1300 if pos(0)<16andpos(0)>2thenprint", ";di$(di);:goto1310
1310 nextdi
1320 print"."
1330 print "---------------------------------------"
1390 pokec,0:poker,24:sysf:print"{white}";:input"command";en$:print"{blue}"
1400 if(en$="n"oren$="north")andpa(pl,1)<>0thenpl=pa(pl,1):goto1080
1410 if(en$="s"oren$="south")andpa(pl,2)<>0thenpl=pa(pl,2):goto1080
1420 if(en$="w"oren$="west")andpa(pl,3)<>0thenpl=pa(pl,3):goto1080
1430 if(en$="e"oren$="east")andpa(pl,4)<>0thenpl=pa(pl,4):goto1080
1440 if(en$="u"oren$="up")andpa(pl,5)<>0thenpl=pa(pl,5):goto1080
1450 if(en$="d"oren$="down")andpa(pl,6)<>0thenpl=pa(pl,6):goto1080
1490 rem if len(en$) > 6 then 3000
1800 if left$(en$,3)="inv"then10800
1850 ifen$="debug"then40000
1900 ifen$="help"then10700
1950 ifen$="quit"then10600
2000 ifen$="look"then10000
2950 if len(en$)>6then3000
2999 rem print "'";en$;"' invalid":goto1080
3000 ln=len(en$)                         :rem find the length of the input
3010 forel=1toln                         :rem loop through the input
3020 test$=mid$(en$,el,1)                :rem get a character
3030 if test$<>" " then next el          :rem test for a space
3040 ev$=left$(en$,3)                    :rem on space set the verb to 3 letters
3050 rl=ln-el                            :rem set length of second half of entry
3060 if rl<0 then 3090                   :rem used to be 3090
3070 eo$=right$(en$,rl)                  :rem figure out the subject
3080 eo$=left$(eo$,wl)                   :rem reduce the subject to 3 letters
3090 forvn=1toav                         :rem loop through verbs
3100 if ev$=vl$(vn) then 3130            :rem if verb is found deal with it
3110 next vn
3120 print "i do not understand the verb!":goto 1080
3130 if rl<0 then printve$(vn);" what?":goto 1080
3135 forn=1toao                          :rem loop through objects
3140 if eo$=rn$(n) then 3200             :rem if an object is found deal with it
3150 next n
3160 print "A ";right$(en$,rl);"?":goto1080
3200 onvngoto5000,5000,6000,7000,8000,8200,8500,8000,8700,8900
5000 rem --------examine
5001 if ob(n)<>plandob(n)<>-1then5900
5002 if n=1thenprintms$(1)
5003 if n=2thenfori=2to5:printms$(i):nexti
5004 if n=3thenprint"The key is quite rusty but looks like   it might still work"
5005 if n=7thenprint"He looks very dead"
5006 if n=8thenprint"it is a rusty door that appears to be   locked"
5890 goto1080
5900 rem --------exmine not
5901 if n=1and(pl=4orpl=5orpl=7)thenprintms$(1):goto1080
5999 print "You don't see that here": goto 1080
6000 rem --------kick
6001 if ob(n)<>plandob(n)<>-1then6900
6002 if n=1thenprintms$(6)
6003 if n=3thenprintms$(9)
6004 if n=2orn=7thenprintms$(10)
6005 if n=8thenprintms$(6)
6890 goto 1080
6900 rem -------kick not
6905 if n=1and(pl=4orpl=5orpl=7)thenprintms$(6):goto1080
6999 print"You cannot kick that":goto1080
7000 rem -------talk
7001 if ob(n)<>plandob(n)<>-1then7999
7002 if n=2thenfori=1to4:printcv$(i):nexti:ob(3)=2:ob(2)=0:ob(7)=pl:goto1080
7003 if n=7thenprint"You cannot talk to the dead man":goto1080
7990 print"It cannot answer you":goto1080
7999 print"You cannot talk to that":goto1080
8000 rem --------take
8001 if ob(n)<>plandob(n)<>-1then8190
8002 if wt(n)=0thenprint ob$(n);" is too heavy"
8003 if wt(n)=1thenob(n)=-1:print"You took the ";ob$(n)
8180 goto1080
8190 if n=1and(pl=4orpl=5orpl=7)thenprint ob$(n);" is too heavy":goto1080
8199 print"You cannot take that":goto1080
8200 rem --------drop
8201 if ob(n)<>plandob(n)<>-1then8299
8202 ifn=3thenob(n)=pl:print"You dropped the ";right$(ob$(n),len(ob$(n))-2):goto1080
8299 print"You do not have anything like that":goto1080
8500 rem --------use
8501 if ob(n)<>plandob(n)<>-1then8599
8502 if pl=3then:print"you unlock the door":fl(2)=-1:goto1080
8590 rem --------use not
8595 print"You cannot use that here":goto1080
8599 print"You do not have that to use":goto1080
8700 rem --------open
8701 if ob(n)<>plandob(n)<>-1then8899
8705 ifn=2orn=7thenprint"Gross. No.":goto1080
8706 ifn=3thenprint"You could open something with this":goto1080
8707 ifn=8andnotfl(2)thenprint"The door is locked":goto1080
8709 ifn=8andnotfl(3)thenprint"You open the door":fl(3)=-1:pa(3,1)=8:goto1080
8710 ifn=8andfl(3)thenprint"the door is already open":goto1080
8898 print"You cannot open that":goto1080
8899 print"That is not something you can open":goto1080
8900 rem -------close
8901 if ob(n)<>plandob(n)<>-1then8999
8903 ifn=8andnotfl(3)thenprint"The door is already closed":goto1080
8904 ifn=8andfl(3)thenprint"You close the door":fl(3)=0:pa(3,1)=0:goto1080
8999 print"You cannot close that":goto1080
10000 rem --------look  
10001 ifpl=1orpl=4orpl=5orpl=7thenprintld$(1):printld$(2):goto1080
10002 ifpl=2orpl=6thenprintld$(3):goto1080
10599 printms$(1):goto1080
10600 rem --------quit
10601 print "{white}Are you sure you want to quit (y/n)"
10602 getx$:ifx$="y"thenprint"Goodbye":end
10603 if x$="n"then1080
10604 goto 10602
10700 rem --------help
10701 print"{clear}{light blue}{reverse on}help{reverse off}"
10702 print"{blue}----"
10710 print:print"{gray}Directions"
10711 printhl$
10712 for i=1to6:printdi$(i):nexti
10720 print:print"{gray}Commands"
10721 printhl$
10722 print"inventory"
10723 print"help"
10724 print "quit"
10730 pokec,26:poker,3:sysf:print"{gray}Actions":pokec,26:poker,4:sysf:printhl$
10732 fori=1toav:pokec,26:poker,4+i:sysf:printve$(i):nexti
10735 pokec,0:poker,24:sysf:print"Press any key to continue...";
10736 getx$:ifx$=""then10736
10737 print"{clear}":goto1080
10800 rem -------inventory
10805 print "Inventory:"
10810 fori=1toao:ifob(i)=-1thenprint"{light blue}";ob$(i)
10815 nexti
10820 goto 1080
25000 rem general messages
25001 ms$(1)="you see nothing interesting"
25002 ms$(2)="A man who looks like a prison guard"
25003 ms$(3)="lies in front of you. He is barely"
25004 ms$(4)="breathing. He looks at you as if he"
25005 ms$(5)="has something to say..."
25006 ms$(6)="Ouch! That really hurts"
25007 ms$(7)="It is a key that looks like it could"
25008 ms$(8)="fit in a cell door"
25009 ms$(9)="it slides arcoss the floor a little"
25010 ms$(10)="this does not help at all"
27000 rem look descriptions
27001 ld$(1)="You are in a cold cell.  The stench of"
27002 ld$(2)="neglect hangs heavy in the air."
27003 ld$(3)="The cooridoor stinks of decay and bile."
29000 rem conversation
29001 cv$(1)="The man hoarsly whispers to you, "+chr$(34)+"they"
29002 cv$(2)="are all dead."+chr$(34)+" His eyes close and with"
29003 cv$(3)="his last breath his clenched fist "
29004 cv$(4)="releases a key."
29800 rem formatting
29897 hl$="----------{white}"
29898 bl$="                                       "
29899 return
29900 rem directions
29901 data north,south,west,east,up,down
30000 rem verbs
30001 data examine,look,kick,talk,take,drop,use,get,open,close
30200 rem object description and psotion
30201 data "a bed","bed",1,0
30202 data "a man lying on the ground","man",2,0
30203 data "a cell key","key",0,1
30204 data "a bed","bed",4,0
30205 data "a bed","bed",5,0
30206 data "a bed","bed",7,0
30207 data "a corpse of a dead man","cor",0,0
30208 data "a door leading north","doo",3,0
30700 rem rooms
30701 data "A cold and musty prison cell",0,0,0,2,0,0
30702 data "Prison cooridoor",3,6,1,4,0,0
30703 data "Exit to the prison yard",0,2,0,0,0,0
30704 data "Empty cell",0,0,2,0,0,0
30705 data "Empty cell",0,0,0,6,0,0
30706 data "Prison cooridoor",2,0,5,7,0,0
30707 data "Empty cell",0,0,6,0,0,0
30708 data "Prison yard",0,3,0,0,0,0
40000 rem -------debug
40001 print"debug console"
40005 print"free, obs, quit"
40010 input en$
40011 ifen$="free"then def fn fr(x)=fre(0)-65536*(fre(0)<0):printfnfr(0);"bytes free"
40013 ifen$="obs"thenfori=1toao:printob$(i);" - ";ob(i):nexti
40014 ifen$="goto"theninputen:pl=en
40029 ifen$="quit" thenprint"{clear}":goto1080
40030 goto 40010
