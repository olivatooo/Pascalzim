Program Sequencia4 ;
var count, incre, resul, n:integer;
 Begin
 	writeln('Digite um número inteiro e positivo : ');
 	readln(n);
 	incre:=-6;
 	for count:=1 to n do
 	Begin
 	If not(count mod 2 = 0) then
 	Begin
 	incre:=incre+4;
 	End;
 	resul:=incre+count;
 	End;
 	writeln(resul);
 	readln;
 End.
