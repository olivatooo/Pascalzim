Program Pzim ;
var  hora,minuto,segundo:integer;
 Begin
 hora:=0;
 minuto:=0;
 segundo:=0;
   for hora:=0 to 24 do
   begin
   clrscr;
   if hora>0 then
   writeln(hora+1,':',minuto,':',segundo);
   
   	   	for minuto:=0 to 59 do
   	   	begin
   	   	clrscr;
   	   	if minuto>0 then
   		writeln(hora,':',minuto+1,':',segundo);
   		
   			for segundo:=0 to 59 do
   			begin
   			clrscr;
   			writeln(hora,':',minuto,':',segundo);
 
   			delay(800);
   			 
			   end;
			   end;
			   end; 
   	
   	
   	
   	
 End.
