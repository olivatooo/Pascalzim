Program Pag29ex1b ;
var resto,a,b:integer;
 Begin
      writeln('Digite dois números');
      readln(a,b);
      if (b=0) then
      writeln('Nenhum número é divisivel por 0')
      else
      begin
      resto:=a mod b;
      If resto=0 then
      begin;
      writeln (a,' é divisível por',b);
      writeln('A divisão do primeiro pelo segundo número é ',a/b:0:2);
      end
      else
      writeln(a ,' não é divisível por ',b);
      end;
      
      
 End.
