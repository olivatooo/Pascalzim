Program Notas;
var test,test2,test3, media:real;
    mediat:integer;
Begin
  writeln('Digite 3 notas : ');
  read(test,test2,test3);
  while (test>10) or (test2>10) or (test3>10) or (test<0) or (test<0) or (test<0) do 
  Begin
    writeln('Notas n�o podem ser menor que 0 ou maior que 10. Redigite as notas : ');
    read(test,test2,test3);
  End;
  media:=(test+test2+test3)/3;
  mediat:=trunc(media);
  writeln('Sua m�dia � igual : ',mediat);
  case mediat of
  0..2:writeln('Reprovado');
  3..5:Begin
  writeln('Exame: Voc� precisa tirar : ',12-media:0:2,' para passar.');
  End;
  6..10:writeln('Aprovado!');
  End;
  readln;
End.
