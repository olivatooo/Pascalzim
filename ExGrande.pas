Program NumseiOnome ;
var sum, media,qtd, maior, menor, mediap,count, countp, n:real;
ntruco:integer;
Begin
  count:=0;
  maior:=0;
  sum:=0;
  media:=0;
  mediap:=0;
  countp:=0;
  n:=1;
  writeln('Digite v�rios n�meros. Quando estiver bom digite 0 : ');
  while (n<>0) do
  Begin
    readln(n);
    ntruco:=trunc(n);
    count:=count+1;
    if count=1 then
    begin
      menor:=n;
      maior:=n;
    end;
    if n>maior then
    Begin
      maior:=n;
    End;
    if (n<menor) and (n<>0) then
    Begin
      menor:=n;
    End;
    sum:=sum+n;
    media:=media+n;
    if (ntruco mod 2 = 0) then
    Begin
      mediap:=mediap+n;
      countp:=countp+1;
    End;
  End;
  count:=count-1;
  writeln('O maior n�mero � igual a ', maior:0:2);
  writeln('O menor n�mero � igual a ', menor:0:2);
  writeln('A m�dia dos n�meros � igual a ', (media/count):0:2);
  writeln('A m�dia dos n�meros pares � igual a ', (mediap/countp):0:2);
  writeln('Foram digitados ', count:0:0,' n�meros');
  readln;
End.