Program Pzim ;
var maior,menor,somapar,s:real;
cont,contpar,n:integer;
 Begin
    menor:=999999999;
    maior:=0;
    cont:=0;
    n:=1;	
    writeln('PS:Digite 0 para sair');
    while (n<>0) do
    begin 
    writeln('Digite um n�mero');
    readln(n);
    if n<>0 then
    begin    
    cont:= cont +1;
    s:= n + s;
    if (n mod 2 = 0) then
    begin
    somapar:=n+somapar;
    contpar:=contpar+1;
    end;
    if n > maior then 
    maior:=n;
    if (n < menor) and (n<>0) then
    menor:=n;
    end; 
    end;
    writeln('A soma dos n�meros � ',s:0:2);
    writeln('A quantidade de n�meros digitados foi ',cont);
    if cont=0 then
    writeln('Nenhum n�mero par digitado')
    else
    writeln('A m�dia dos n�meros digitados foi ',s/cont:0:2);
    writeln('O maior n�mero digitado � ',maior:0:2);
    writeln('O menor n�mero digitado foi ',menor:0:2);
    if contpar=0 then
    writeln('Nenhum n�mero par digitado')
    else
    writeln('A m�dia dos n�meros pares � ',somapar/contpar:0:2);
    
      
    
    

 End.
