Program Pzim ;
var  sal, aum: real;
cod:integer;
 Begin
   writeln('Digite o c�digo correspondente ao cargo do funcion�rio');
   readln(cod);
   while (cod>5) do 
   begin
   writeln('C�digo inv�lido. Redigite o c�digo');
   readln(cod);
   end;   
   writeln('Digite o sal�rio atual do funcion�rio');
   readln(sal);
   while (sal<0) do
   begin
   writeln('Sal�rio inv�lido. Redigite o sal�rio do funcion�rio');
   readln(sal);
   end;
   
   case cod of
   1: begin
   aum:=0.5*sal;
       writeln('Cargo: Escritur�rio');
       writeln('Aumento: ', aum:0:2);
       writeln('Novo sal�rio: ',aum+sal:0:2);       
   end;
   2: begin
   aum:=0.35*sal;
       writeln('Cargo: Secret�rio');
       writeln('Aumento: ', aum:0:2);
       writeln('Novo sal�rio: ',aum+sal:0:2);       
   end;
   3: begin
   aum:=0.2*sal;
       writeln('Cargo: Caixa');
       writeln('Aumento: ', aum:0:2);
       writeln('Novo sal�rio: ',aum+sal:0:2);       
   end;
   4: begin
   aum:=0.1*sal;
       writeln('Cargo: Gerente');
       writeln('Aumento: ', aum:0:2);
       writeln('Novo sal�rio: ',aum+sal:0:2);       
   end;
   5: begin
       writeln('Cargo: Diretor');
       writeln('N�o tem aumento');            
   end;
   end;
   
   
 End.
