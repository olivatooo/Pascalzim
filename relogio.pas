Program Pzim ;
var hora,minuto,segundos,cont:integer;
 Begin
     hora:=0;
     segundos:=0;
     minuto:=0;
     for segundos:= 1 to 60 do
     begin
     clrscr;
     writeln(hora,':',minuto,':',segundos);
     delay(1000);
     if segundos>=59 then
     begin
     segundos:=0;
     minuto:=minuto+1;
     end;
     if minuto>=59 then
     begin
     minuto:=0;
     hora:=hora+1;
     end;
     end;
     
 End.
