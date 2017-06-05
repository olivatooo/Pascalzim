Program Pzim ;
var a, b, c: real;
 Begin
 writeln('Digite 3 valores');
 readln(a,b,c);
 if (a<b+c) and (b<a+c) and (c<a+b) then 
 	if (a=b) and (b=c) then 
 	writeln('Equilátero')
 	else
 	if (a=b) or (b=c) or (a=c) then
 	writeln('Isoscéles')
else    
writeln('Escaleno')
else
writeln('Não é triângulo');

  
 End.
