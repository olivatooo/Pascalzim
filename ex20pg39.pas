Program Pzim ;
 Begin
   maiorp:=0;
   for contf:=1 to 15 do
   begin
   pontt:=0;
   for contmes:=1 to 3 do
   begin
   writeln('Digite a pontuação do ',contf,'º funcionário no ',contmes,'º mês');
   readln(pont);
   pontt:=pontt+pont;
   if pont>maiorp then
   maiorp:=pont;
   end;
   writeln('Pontuação total do ', contf,'º funcionário= ', pontt);
   mediap:=pontt/3;
   writeln('Média da pontuação nos 3 meses do ',contmes,'º funcionário = ',mediap)
   writeln;
   end;
   writeln('Maior pontuação atingida = ',maiorp)
 End.
