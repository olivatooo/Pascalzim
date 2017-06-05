Program Pzim ;
var resp:integer;
 Begin
   
   
   Writeln('OPÇÕES:');
   Writeln('1 -SAUDAÇÃO');
   Writeln('2 -BRONCA');
   Writeln('3 -FELICITAÇÃO');
   Writeln('0 -FIM');
   repeat
   readln(resp);
   case resp of 
   1:Writeln('Olá. Como vai ?'); 
   2:Writeln('Vamos estudar mais.'); 
   3:Writeln('Meus Parabéns !');
   0:Writeln('Fim de serviço.');
   end;
  
   until (resp=0) ;
   
   
   
   
 End.
