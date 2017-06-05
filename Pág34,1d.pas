Program Pzim ;
var cont,soma:integer;
 Begin  
 	 soma:=0;	 
 	 for cont:=100 to 200  do
 	 if cont mod 13 <> 0 then
 	 begin      
      soma:=soma+cont;
      writeln(cont);
      end;
      writeln(soma);
  
 End.
