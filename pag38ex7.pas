Program Pzim ;
var resp:integer;
 Begin
   
   
   Writeln('OP��ES:');
   Writeln('1 -SAUDA��O');
   Writeln('2 -BRONCA');
   Writeln('3 -FELICITA��O');
   Writeln('0 -FIM');
   repeat
   readln(resp);
   case resp of 
   1:Writeln('Ol�. Como vai ?'); 
   2:Writeln('Vamos estudar mais.'); 
   3:Writeln('Meus Parab�ns !');
   0:Writeln('Fim de servi�o.');
   end;
  
   until (resp=0) ;
   
   
   
   
 End.
