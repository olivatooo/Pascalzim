Program Pzim ;
var x,y,n,m:integer;
 Begin
 	writeln('Digite um n�mero N( Pra ver quais s�o os multiplos)');
 	readln(n);
 	writeln('Digite um n�mero X(Entre esse)');
 	readln(x);
 	writeln('Digite um n�mero Y(E esse)');
 	readln(y);
	for m:=x to y do
	begin	
	if m mod n = 0 then
	begin
	writeln(m);
	end;
	end;	
	
 	
	  
 	
  
 End.
