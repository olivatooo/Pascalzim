Program Pzim ;
 Begin
   maiorp:=0;
   for contf:=1 to 15 do
   begin
   pontt:=0;
   for contmes:=1 to 3 do
   begin
   writeln('Digite a pontua��o do ',contf,'� funcion�rio no ',contmes,'� m�s');
   readln(pont);
   pontt:=pontt+pont;
   if pont>maiorp then
   maiorp:=pont;
   end;
   writeln('Pontua��o total do ', contf,'� funcion�rio= ', pontt);
   mediap:=pontt/3;
   writeln('M�dia da pontua��o nos 3 meses do ',contmes,'� funcion�rio = ',mediap)
   writeln;
   end;
   writeln('Maior pontua��o atingida = ',maiorp)
 End.
