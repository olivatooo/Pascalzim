Program Pzim ;
var s:real;
cont:integer;
 Begin
   for cont:=1 to 10 do
   begin
   writeln('Digite o sal�rio do ',cont,' funcion�rio);
   readln(s);
   if s<500 then  
   writeln('Seu sal�rio com o reajuste foi para: ',(0.3*s)+s:0:2);
   end;
 End.
