Program notafinal ;
var exm , tdl , exmf ,final:real;
    nome:string;
 Begin
      writeln('Digite seu nome');
      read(nome);
      writeln('Digite a nota do exame intermedi�rio');
      readln(exm);
      writeln('Digite a nota do trabalho de laborat�rio');
      readln(tdl);
      writeln('digite a nota do exame final');
      readln(exmf);
      write(nome, ',voc� est�');
      if ((exm*0.3+tdl*0.2+exmf*0.5)>=6)  then
      	write(' aprovado(a)')
      else 
      	write(' reprovado(a)');
 End.
