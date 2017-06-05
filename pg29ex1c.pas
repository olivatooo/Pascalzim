Program Pzim ;
var n1 , n2 ,n3 ,mp , ma, mf:real;
 Begin
      writeln('Digite as suas notas');
      readln(n1,n2,n3);
      ma:=(n1+n2+n3)/3;
      mp:=(n1*0.3)+(n2*0.3)+(n3*0.4);
      writeln('Sua média aritmética foi,', ma:0:2);
      writeln('Sua média ponderada foi, ' ,mp:0:2);
      if ma>mp then
      writeln('Sua nota considerada foi ',ma:0:2)
      else
      writeln('Sua nota considerada foi ',mp:0:2);
      
      
 End.
