Program ex8pag19 ;
var a,b,c:integer;
 Begin
      writeln('Digite dois valores');
      readln(a,b);
      c:=b;
      b:=a;
      a:=c;
      writeln('O valor de a é ', a,' e o valor de b é ',b);
 End.
