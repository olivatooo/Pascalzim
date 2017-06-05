Program Notas;
var test,test2,test3, media:real;
    mediat:integer;
Begin
  writeln('Digite 3 notas : ');
  read(test,test2,test3);
  while (test>10) or (test2>10) or (test3>10) or (test<0) or (test<0) or (test<0) do 
  Begin
    writeln('Notas não podem ser menor que 0 ou maior que 10. Redigite as notas : ');
    read(test,test2,test3);
  End;
  media:=(test+test2+test3)/3;
  mediat:=trunc(media);
  writeln('Sua média é igual : ',mediat);
  case mediat of
  0..2:writeln('Reprovado');
  3..5:Begin
  writeln('Exame: Você precisa tirar : ',12-media:0:2,' para passar.');
  End;
  6..10:writeln('Aprovado!');
  End;
  readln;
End.
