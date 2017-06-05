Program Pzim ;
var x:integer;
 Begin
   writeln('Digite a idade do nadador');
   readln(x);
   while (x<5) do
   begin
   writeln('Idade inválida. Redigite a idade do nadador');
   readln(x);
   end;
   case x of
   5..7:writeln('Infantil');
   8..10:writeln('Juvenil');
   11..15:writeln('Adolescente');
   16..30:writeln('Adulto');
   else 
    writeln('Sênior');
    
   end;
 End.
