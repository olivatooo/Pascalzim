Program semana ;
var semana:integer;
 Begin
     writeln('Digite o dia da semana');
     readln(semana);
     while (semana>7) do
     Begin
     writeln('Digite um n�mero entre 1 e 7');
     readln(semana);
     end;
     case semana of
     1: writeln ('Domingo');
     2: writeln('Segunda');
     3: writeln ('Ter�a');
     4: writeln ('Quarta');
     5: writeln ('Quinta');
     6: writeln ('Sexta');
     7: writeln ('S�bado');
     end; 
 End.
