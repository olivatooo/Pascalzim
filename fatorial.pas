Program Pzim ;
var cont,n,soma,m:integer;
 Begin
 	soma:=1;
	
	writeln('Digite um n�mero');
	readln(n);
	for cont:= 1 to (n) do
	begin
	writeln(cont*n);
	soma:=soma*cont;
	end;
	writeln('O fatorial � = ',soma);  
 End.
