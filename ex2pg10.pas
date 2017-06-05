Program ex2pg10 ;
var qmax , qmin , em:real;
 Begin
  writeln('Digite a quantidade mínima da peça');
  readln(qmin);
  writeln('Digite a quantidade máxima da peça');
  readln(qmax);
  em:=(qmin+qmax)/2;
  writeln('O estoque médio dessa peça é ', em);
  
 End.
