Program Pzim ;
var  sal, aum: real;
cod:integer;
 Begin
   writeln('Digite o código correspondente ao cargo do funcionário');
   readln(cod);
   while (cod>5) do 
   begin
   writeln('Código inválido. Redigite o código');
   readln(cod);
   end;   
   writeln('Digite o salário atual do funcionário');
   readln(sal);
   while (sal<0) do
   begin
   writeln('Salário inválido. Redigite o salário do funcionário');
   readln(sal);
   end;
   
   case cod of
   1: begin
   aum:=0.5*sal;
       writeln('Cargo: Escriturário');
       writeln('Aumento: ', aum:0:2);
       writeln('Novo salário: ',aum+sal:0:2);       
   end;
   2: begin
   aum:=0.35*sal;
       writeln('Cargo: Secretário');
       writeln('Aumento: ', aum:0:2);
       writeln('Novo salário: ',aum+sal:0:2);       
   end;
   3: begin
   aum:=0.2*sal;
       writeln('Cargo: Caixa');
       writeln('Aumento: ', aum:0:2);
       writeln('Novo salário: ',aum+sal:0:2);       
   end;
   4: begin
   aum:=0.1*sal;
       writeln('Cargo: Gerente');
       writeln('Aumento: ', aum:0:2);
       writeln('Novo salário: ',aum+sal:0:2);       
   end;
   5: begin
       writeln('Cargo: Diretor');
       writeln('Não tem aumento');            
   end;
   end;
   
   
 End.
