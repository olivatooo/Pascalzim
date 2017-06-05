Program Pzim ;
var n,cont,cont1:integer;
 Begin
   cont1:=0;
   writeln('Digite um número');
   readln(n);
   for cont:=1 to n do
   begin
   if (n mod cont =0) then
   cont1:=cont1+1;
   end;
   if cont1=2 then 
   writeln('O número ',n,' é primo')
   else 
   writeln('O número ',n,' não é primo');
   
 End.
