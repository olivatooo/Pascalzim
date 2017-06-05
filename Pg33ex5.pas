Program ajudo ;
var n1,n2:real;
escolha:integer;
 Begin
 writeln('Escolha uma das opções abaixo');
 writeln('');
 writeln('(1) Somar dois números');
 writeln('(2) Raiz quadrada de um número');
 readln(escolha);
 if (escolha=1) or (escolha=2) then
 begin
 case escolha of
 1:begin
   writeln('Digite 2 números para serem somados');
   readln(n1,n2);
   writeln('A soma é ',(n1+n2):0:1);
   end;
 2:begin
 writeln('Digite um número para tirar a raiz quadrada');
 readln(n1);
 if (n1<0) then
 writeln('Não existe raiz real')
 else 
 writeln('A raíz de ',n1:0:1,' é ',SQRT(n1):0:2);
 end;
 end;
 end
 else
 writeln('Você não escolheu nenhuma das opções');

  
 End.
