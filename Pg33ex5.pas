Program ajudo ;
var n1,n2:real;
escolha:integer;
 Begin
 writeln('Escolha uma das op��es abaixo');
 writeln('');
 writeln('(1) Somar dois n�meros');
 writeln('(2) Raiz quadrada de um n�mero');
 readln(escolha);
 if (escolha=1) or (escolha=2) then
 begin
 case escolha of
 1:begin
   writeln('Digite 2 n�meros para serem somados');
   readln(n1,n2);
   writeln('A soma � ',(n1+n2):0:1);
   end;
 2:begin
 writeln('Digite um n�mero para tirar a raiz quadrada');
 readln(n1);
 if (n1<0) then
 writeln('N�o existe raiz real')
 else 
 writeln('A ra�z de ',n1:0:1,' � ',SQRT(n1):0:2);
 end;
 end;
 end
 else
 writeln('Voc� n�o escolheu nenhuma das op��es');

  
 End.
