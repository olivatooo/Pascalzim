Program VetorTeste ;
var v:array[1..3] of string;
    count,position:integer;
Begin
writeln('Digite 3 nomes : ');
for count:=1 to 3 do
readln(v[count]);
for count:=1 to 3 do
Begin
writeln(count,'º Nome : ',v[count]);
End;                               
End.