Program ex8pag19 ;
var a,b,c:integer;
 Begin
      writeln('Digite dois valores');
      readln(a,b);
      c:=b;
      b:=a;
      a:=c;
      writeln('O valor de a � ', a,' e o valor de b � ',b);
 End.
