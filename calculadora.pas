Program Pzim ;
var op: char;
x,y,c:real; 
 Begin
   writeln('Digite a operação desejada(*,/,+,-)');
   readln(op);
   writeln('Digite o primeiro e o segundo número, respectivamente');
   readln(x,y);
   case op of
   	'+':begin
   	 c:=y+x;
   	 writeln(c:0:1)
   	 end;
   	'-':begin
   	  c:=x-y;
   	  writeln(c:0:1);
   	  end;
   	'*':begin
   	  c:=x*y;
   	  writeln(c:0:1);
   	  end;
   	'/':begin
   	  if x<>0 then    	  
   	  c:=x/y;
   	  writeln(c:0:1)
   	  end;
   	  else
   	  writeln('Não existe divisão por zero');
   	  
		
	else
	writeln('Sinal incorreto');
	end;	  
 End.
