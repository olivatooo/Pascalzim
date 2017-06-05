Program pg7ex2 ;
var p1,p2,t1,t2,L,M:real;
 Begin
      writeln('Digite as notas das duas provas');
      readln(p1,p2);
      writeln('Digite as notas dos dois trabalhos');
      readln(t1,t2);
      writeln('Digite a nota da lista de exercícios');
      readln(L);
      M:=(6*(p1+p2)+3*(t1+t2)+L)/19;
       writeln('Média =',M:0:1);
 End.
