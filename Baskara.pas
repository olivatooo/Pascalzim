P
rogram baskara ;
var a , b, c , delta , x1 , x2:real; 
Begin
writeln('Digite os valors de A , B e C');
	readln(a,b,c);
		delta:=(b*b)-(4*a*c);
	if (a=0) then
		writeln('Não é possível efetuar o cálculo')
	else if delta<0 then 
		writeln('Número negativo em raiz')
	else
writeln('Delta= ',delta:0:1);  
	x1:=(-b+SQRT(delta))/(2*a);
	x2:=(-b-SQRT(delta))/(2*a);
writeln('x1=',x1:0:1) ;
writeln('x2=',x2:0:1);
readln;
end.
