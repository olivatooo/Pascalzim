Program Pzim ;
var cont,n,cont1:integer;
 Begin
    cont:=1;
    cont1:=0;
    writeln('Digite um n�mero'); 
    readln(n);
    for cont:=1 to n do
    begin
    if (n mod cont)=0 then
    begin
    cont1:=cont1+1;
    writeln('Os divisores s�o ',cont);
end;
    end;

    writeln('O n�mero ',n,' possui ',cont1,' divisor(es)');
    
 End.
