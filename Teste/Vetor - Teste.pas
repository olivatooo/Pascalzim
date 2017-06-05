Program Vetor - Teste ;
var v:array[1..6] of integer;
    count,soma:integer;
Begin
writeln('Digite 6 valores : ');
for count:=1 to 6 do
readln(v[count]);
for count:=1 to 6 do
soma:=soma+v[count];
writeln(soma);  
End.