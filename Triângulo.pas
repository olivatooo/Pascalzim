Program Pzim ;
var a, b, c: real;
 Begin
 writeln('Digite 3 valores');
 readln(a,b,c);
 if (a<b+c) and (b<a+c) and (c<a+b) then 
 	if (a=b) and (b=c) then 
 	writeln('Equil�tero')
 	else
 	if (a=b) or (b=c) or (a=c) then
 	writeln('Isosc�les')
else    
writeln('Escaleno')
else
writeln('N�o � tri�ngulo');

  
 End.
