P1rogram Pzim ;
var a,n,cont,x:integer;
 Begin
 x:=0;
 	for cont:= 1 to 5 do
 	begin
 	writeln('Digite 5 n�meros');
 	readln(a);
 	if a<0 then
 	x:=x+1;
 	writeln(x);
 	end;
 	Writeln('Existem ',x,' n�meros negativos');
   	
 End.
