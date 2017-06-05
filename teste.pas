Program Pzim ; 
var a,cont2,cont:integer;
 Begin
   writeln('Digite a altura do triangulo');
   readln(a);
   for cont:= 1 to a do
   begin
   writeln;
   for cont2:= 1 to cont do
   begin
   write(random(9));
   end;
   end;
   
 End.
