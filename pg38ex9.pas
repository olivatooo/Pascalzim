Program Pzim ;
var p1,p2,p3,media:real;
mediat:integer;
 Begin
   writeln('Digite a nota da primeira prova');
   readln(p1);
   writeln('Digite a nota da segunda prova');
   readln(p2);
   writeln('Digite a nota da terceira prova');
   readln(p3);
   while (p1>10) or (p1<0) or (p2>10) or (p2<0) or (p3>10) or (p3<0) do
   begin
   writeln('Notas inválidas redigite suas notas');
   writeln('Digite a nota da primeira prova');
   readln(p1);
   writeln('Digite a nota da segunda prova');
   readln(p2);
   writeln('Digite a nota da terceira prova');
   readln(p3);
   end;
   media:=(p1+p2+p3)/3;
   writeln('Sua média foi ',media:0:2);
   mediat:=trunc(media);
   case mediat of
   0..2:writeln('Reprovado');
   3..5:
   begin
   writeln('Exame');
   writeln('Você precisa tirar no exame ',12-media:0:2);
   end;
   6..10:writeln('Aprovado');
   end;
   
    
   
 End.
