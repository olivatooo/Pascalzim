Program Pzim ;
var cont,simucont,reprovadocont,aprovadocont:integer;
    p1,p2,p3,media,maior,menor,maiormedia,menormedia:real;
    simu:char;
 Begin
 maior:=0;
 menor:=10;
 maiormedia:=0;
 menormedia:=10;
   for cont:=1 to 20 do
   begin
   writeln('Digite a nota das 3 provas');
   readln(p1,p2,p3);
    if p1>maior then
    maior:=p1
    else if p1<menor then
    menor:=p1;
    if p2>maior then
    maior:=p2
    else if p2<menor then
    menor:=p2; 
    if p3>maior then
    maior:=p3
    else if p3<menor then
    menor:=p3;  
   
   
   writeln('Voc� conseguiu a nota do simulado?(S/N)');
   readln(simu);
   if simu='S' then
   	begin
   	media:=(((p1+p2+p3)/3)*0.9)+1;
   	simucont:=simucont+1;
   	writeln('M�dia=',media);
   end
   	else
   		begin
   		media:=(((p1+p2+p3)/3)*0.9);
   		writeln('M�dia=',media);
   end;
      if media>maiormedia then
      maiormedia:=media
      else if media<menormedia then
      menormedia:=media; 
   
   	if media<6 then
   	begin
  		 writeln('Reprovado');
  		 reprovadocont:=reprovadocont+1;
  		 end
   	else
   	begin
   		 writeln('Aprovado');
   		 aprovadocont:=aprovadocont+1
   		 end;
  
   
   
   

   
   writeln;
   end;
   writeln('O n�mero de alunos aprovados foi ',aprovadocont);
   writeln('O n�mero de alunos reprovados foi ',reprovadocont);
   writeln('O n�mero de alunos que n�o conseguiram nota no simulado foi ',20-simucont);
   writeln('A maior nota foi ',maior);
   writeln('A menor nota foi ',menor);
   writeln('A menor media foi ',menormedia);
   writeln('A maior media foi ',maiormedia);
   
   
 End.
