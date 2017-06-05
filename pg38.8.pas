Program Pzim ;
var x,y,n,m:integer;
 Begin
 	writeln('Digite um número N( Pra ver quais são os multiplos)');
 	readln(n);
 	writeln('Digite um número X(Entre esse)');
 	readln(x);
 	writeln('Digite um número Y(E esse)');
 	readln(y);
	for m:=x to y do
	begin	
	if m mod n = 0 then
	begin
	writeln(m);
	end;
	end;	
	
 	
	  
 	
  
 End.
