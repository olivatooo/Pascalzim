Program funcionario ;
var ht,sh,hm:real;
fun:string;
 Begin
      writeln('Digite o nome do funcionário');
      readln(fun);
      writeln('Digite as horas trabalhadas');
      readln(ht);
      writeln('Digite o salário/hora');
      readln(sh);
      write(fun ,',você trabalhou ',ht,' horas e irá ganhar R$');
	 if (ht>8) then
	 	begin
      	hm:=(ht-8)*0.5;
      	writeln('R$',(hm+ht)*sh:0:2)
      	end
      else
		 writeln('R$', ht*sh:0:2) 
      	
 End.
