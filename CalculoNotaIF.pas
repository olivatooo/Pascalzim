Program calculo ;
 var n1,n2,m:real;
 Begin
      writeln('Digite as duas notas');
      readln(n1,n2) ;
      m:=(n1+n2)/2;
	 writeln('M�dia=',m:0:1);
      if (m>=6) then
      begin
      	writeln('Aprovado');
		writeln('Parabens!');
		end 
      else
      	begin
      	writeln('Reprovado');
      	   writeln('VOC� DEVERIA TER ESTUDADO MAIS');
      	   writeln('Fracassado');
      	   end;
 End.                         
