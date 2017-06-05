Program Pzim ;
var trab , prov , exam,media:real;
k:integer;
 Begin
 writeln('Digite a nota do trabalho , da prova e do exame NESTA ORDEM');
 readln(trab,prov,exam);
 media:=(trab*2+prov*3+exam*5)/10;
 if media<=10 then
 begin
 writeln('Sua média é ', media:0:1);
 k:=trunc(media);
 case k of
 9..10: writeln('A');
 8..9: writeln('A');
 7..8: writeln('B');
 6..7: writeln('B');
 5..6: writeln('C');
 4..5: writeln('C');
 3..4: writeln('D');
 2..3: writeln('D');
 1..2: writeln('E');
 0..1: writeln('E');
 end;
 end
 else
 writeln('ERROR');
 End.
