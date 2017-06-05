Program Pzim ;
var x,i,nro:integer;
 Begin
 	
 	writeln('Digite um número');
 	readln(x);
 	if x>0 then
 	begin
 	nro:=-1;
 	for i:=1 to x-1 do
 	if i mod 2<>0 then
 	nro:=nro+1
 	else
 	nro:=nro+5;
 	write(nro,'  ');
 	end
 	else 
 	writeln('A série não tem esse termo') ;
 	 
 
 	 
 	 
 	 
 	 
  
 End.
