Program Pag29ex1b ;
var resto,a,b:integer;
 Begin
      writeln('Digite dois n�meros');
      readln(a,b);
      if (b=0) then
      writeln('Nenhum n�mero � divisivel por 0')
      else
      begin
      resto:=a mod b;
      If resto=0 then
      begin;
      writeln (a,' � divis�vel por',b);
      writeln('A divis�o do primeiro pelo segundo n�mero � ',a/b:0:2);
      end
      else
      writeln(a ,' n�o � divis�vel por ',b);
      end;
      
      
 End.
