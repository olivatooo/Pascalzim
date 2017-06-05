Program Pzim ;
var trab , prov , exam,media:real;
 Begin
 writeln('Digite a nota do trabalho , da prova e do exame NESTA ORDEM');
 
 readln(trab,prov,exam);
 media:=(trab*2+prov*3+exam*5)/10;
 writeln('Sua média é ', media:0:1);
 if (media>=8) and (media<=10) then
 writeln('A')
 else if (media>=7) and (media<=10) then
 writeln('B')
 else if (media>=6) and (media<=10) then
 writeln('C')
 else if (media>=5) and (media<=10) then
 writeln('D')
 else if (media<5) and (media<=10) then
 writeln('E') 
 else
 writeln('ERROR');
 End.
