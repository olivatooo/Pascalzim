Program Pzim ;
var cont,cont1, cont2, cont3, cont4,n:integer;
 Begin
 cont1:=0;
 cont2:=0;
 cont3:=0;
 cont4:=0;
 for cont:=1 to 20 do
 begin
 writeln('Digite valores entre 0 e 100');
 readln(n);
 if n<=100 then
 begin 
 case n of
 0..25:
 begin
 cont1:=cont1+1; 
 writeln('Entre 0--25 - ', cont1);
 end;
 25..50:
 begin
 cont2:=cont2+1; 
 writeln('Entre 25--50 - ', cont2);
 end;
 50..75:
 begin
 cont3:=cont3+1; 
 writeln('Entre 50--75 - ', cont3);
 end;
 75..100:
 begin
 cont4:=cont4+1; 
 writeln('Entre 75--100 - ', cont4)
 end
 else
 writeln('Digite um valor entre 0 e 100');
 end;
 end;
 end; 
 writeln('Entre 0--25 - ', cont1);
 writeln('Entre 25--50 - ', cont2);
 writeln('Entre 50--75 - ', cont3);
 writeln('Entre 75--100 - ', cont4);
 
 End.
