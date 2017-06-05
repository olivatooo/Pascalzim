Program Pzim ;
var cont,cont1,fil,filt:integer;
maior , sal,salt:real;
 Begin
 maior:=0;
 cont:=0;
 cont1:=0;
 sal:=0;
 
   Writeln('Digite 0 para sair e ver os resultados');
   while (sal <> 0) or (fil<>0) do
   begin
   writeln('Digite seu salário');
   readln(sal);
   writeln('Digite o número de filhos');
   readln(fil);
   salt:=sal+salt;
   filt:=fil+filt;
   cont:=cont+1;
   if sal>maior then
   maior:=sal;
   if sal<=320 then
   cont1:=cont1+1;
   
   end;
   if (cont<>0) then
   begin   
   writeln('A média de filhos foi de ',filt/cont);
   writeln('A média de salários foi de ',salt/cont);
   writeln('A porcentagem de pessoas com salário até R$320 foi de ',(cont/(cont1*100)) );
   end;
   writeln('O maior salário foi  ',maior);
   
   
   
   
    
   
   
   
   
 End.
