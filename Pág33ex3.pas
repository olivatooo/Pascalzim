Program media ;
uses crt;
var m1,m2,ma:real;
    ra:integer;
 Begin
 writeln('Digite a m�dia do primeiro semestre e do segundo semestre, respectivamente');
 readln(m1,m2);
 ma:=(m2*2+m1)/3;
 ra:=trunc(ma);
 writeln('M�dia = ',ma:0:2);
 case ra of
 0..2: writeln('Reprovado');
 3..5:begin  	 
	 writeln('Exame');
	 writeln('A nota necess�ria no exame para sua aprova��o � ', 12-ma:0:2)
	 end;
 6..10: writeln('Aprovado');
 end;
  
 End.
