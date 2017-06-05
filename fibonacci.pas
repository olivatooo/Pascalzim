Program Pzim;
var a,b,c,cont,n:integer;
 Begin
 
   writeln('Digite o número de fibonacci');
   readln (n);
   a:=1;
   b:=0;
   for cont:= 1 to n do 
   begin
   c:=a+b;
   write(c,'-');
   a:=b;
   b:=c;
   end;
 End.
