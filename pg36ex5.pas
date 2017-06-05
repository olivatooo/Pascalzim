Program Pzim ;
var cont,cont1, cont2, cont3, cont4,n,n1,n2,n3,n4:integer;
media1,media2,media3,media4:real;
 Begin
 cont1:=0;
 cont2:=0;
 cont3:=0;
 cont4:=0;
 for cont:=1 to 20 do
 begin
 writeln('Digite valores entre 0 e 100');
 readln(n);
 case n of
 0..25:
 begin
 cont1:=cont1+1;
 n1:=n+n1; 
 writeln('Entre 0--25 - ', cont1);
 end;
 25..50:
 begin
 cont2:=cont2+1;
 n2:=n+n2; 
 writeln('Entre 25--50 - ', cont2);
 end;
 50..75:
 begin
 cont3:=cont3+1;
 n3:=n+n3; 
 writeln('Entre 50--75 - ', cont3);
 end;
 75..100:
 begin
 cont4:=cont4+1;
 n4:=n+n4; 
 writeln('Entre 75--100 - ', cont4)
 end
 end;
 end;

 media1:=(n1/cont1);
 media2:=(n2/cont2);
 media3:=(n3/cont3);
 media4:=(n4/cont4);
 writeln('Entre 0--25 - ', cont1,' E a média desses valores é = ',media1:0:2);
 writeln('Entre 25--50 - ', cont2,' E a média desses valores é = ',media2:0:2);
 writeln('Entre 50--75 - ', cont3,' E a média desses valores é = ',media3:0:2);
 writeln('Entre 75--100 - ', cont4,' E a média desses valores é = ',media4:0:2);
 
 End.
