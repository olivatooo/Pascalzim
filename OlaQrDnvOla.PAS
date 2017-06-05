Program Pzim ;
var resp:char;
Begin
Repeat
writeln('Olá!');
writeln('Deseja repetir?');
readln(resp);
resp:=upcase(resp);
while (resp<>'S') and (resp<>'N') do
Begin
writeln('Resposta inválida! Escreva S para sim e N para Não;');
readln(resp);
resp:=upcase(resp);
End;
until resp='N';
readln;
End.