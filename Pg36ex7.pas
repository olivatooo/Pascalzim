Program Pzim ;
var n,cont,cont1:integer;
 Begin
   cont1:=0;
   writeln('Digite um n�mero');
   readln(n);
   for cont:=1 to n do
   begin
   if (n mod cont =0) then
   cont1:=cont1+1;
   end;
   if cont1=2 then 
   writeln('O n�mero ',n,' � primo')
   else 
   writeln('O n�mero ',n,' n�o � primo');
   
 End.
