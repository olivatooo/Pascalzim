Program Pzim ;
var i,x:integer;
y,soma:real;
 Begin
 soma:=1;
 writeln('Digite um n�mero');
 readln(x);
 for i:=2 to 20 do
 begin
 y:=(1/(exp(ln(x)*i)));
 writeln(y);
 soma:=soma+y;
 end;
 writeln('A soma dos termos � igual soma ', soma);
 
 
 
 
 
 
 
 
 
 
 
   
   
 End.
