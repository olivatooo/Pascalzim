Program sa ;
var a,b,c:real;
opcao: integer; 
 Begin
      writeln('Escolha uma opção 1,2 ou 3');
      readln(opcao);
      writeln('Digite 3 valores');
      readln(a,b,c);
      case opcao of
      1:begin
      if (a>b) and (b>c) then
      writeln(a:0:1,'   ',b:0:1,'   ',c:0:1)
      else if (b>a) and (a>c) then
      writeln(b:0:1,'   ',a:0:1,'   ',c:0:1)
      else
      writeln(c:0:1,'   ',a:0:1,'   ',b:0:1);
      end;
      2:begin
      if (a>b) and (b>c) then
      writeln(c:0:1,'   ',b:0:1,'   ',a:0:1)
      else if (b>a) and (a>c) then
      writeln(c:0:1,'   ',a:0:1,'   ',b:0:1)
      else
      writeln(b:0:1,'   ',a:0:1,'   ',c:0:1);
      end;
      3:begin
      if (a>b) and (b>c) then
      writeln(b:0:1,'   ',a:0:1,'   ',c:0:1)
      else if (b>a) and (a>c) then
      writeln(a:0:1,'   ',b:0:1,'   ',c:0:1)
      else
      writeln(a:0:1,'   ',c:0:1,'   ',b:0:1);
      end;
      end ;
      

      
 End.
