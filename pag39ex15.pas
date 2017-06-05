Program Pzim ;
var cod:char;
v, totalv, totalp: real;
 Begin
 	v:=1;
 	writeln('Digite S para sair');
     while (cod<>'S') do
     begin
     writeln('Digite o código(V ou P)');
     readln(cod);
     cod:=upcase(cod);
     while (cod<>'P') and (cod<>'V') do
     begin
     writeln('Código inválido. Redigite o código:');
     readln(cod);
     cod:=upcase(cod);
	end;     
     writeln('Digite o valor da transação');
     readln(v);
     while (v<0) do
     begin
     writeln('Valor inválido. Redigite:');
     readln(v);
     end;
     if (cod='V') then
     totalv:=v+totalv;     
     if (cod='P') then
     totalp:=v+totalp;
     end;     
     
     writeln('O valor total das vendas à vista foi ', totalv:0:2);
     writeln('O valor total das vendas à prazo foi ', totalp:0:2);
     writeln('O valor total das vendas efetuadas ', totalv+totalp:0:2);
     
     
 End.
