Program ex5pg10 ;
var n1 ,n2 , n3 , n4, q1 , q2 , q3 , q4, s:integer;
 Begin
  writeln('Digite quatro números');
  readln(n1,n2,n3,n4);
  q1:=n1*n1;
  q2:=n2*n2;
  q3:=n3*n3;
  q4:=n4*n4;
  s:=q1+q2+q3+q4;
  writeln('A soma dos quadrados de todos os números é ',s);
  
 End.
