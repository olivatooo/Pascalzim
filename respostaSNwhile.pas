Program Pzim ;
var resp:char;
 Begin
	repeat
	writeln('Oi');
	writeln('Deseja executar novamente ?');
	readln(resp);
	resp:=upcase(resp);
	while (resp<>'S') and (resp<>'N') do
	begin
	writeln('Resposta inv�lida. Digite S ou N');
	readln(resp);
	resp:=upcase(resp);
	end; 
	until resp='N';
 End.
