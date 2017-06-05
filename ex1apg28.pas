Program maiorpelomenor ;
 var n1 , n2 , dif:real; 
 Begin
      writeln('Digite 2 números');
      readln(n1,n2);
      if (n1>n2) then
            	writeln('A diferença do maior para o menor é ',(n1-n2):0:1)
      else
      	writeln('A diferença do maior para o menor é ', (n2-n1):0:1);
          	
 End.
