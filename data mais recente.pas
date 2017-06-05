Program datas ;
var mes,dia,ano,ano1,dia1,mes1:integer;
 Begin
 writeln('Digite o primeiro ano');
 readln(ano);
 writeln('Digite o primeiro mes');
 readln(mes);
 writeln('Digite o primeiro dia');
 readln(dia);
 writeln('Digite o segundo ano');
 readln(ano1);
 writeln('Digite o segundo mes');
 readln(mes1);
 writeln('Digite o segundo dia');
 readln(dia1);
 if (ano=ano1) and (mes=mes1) and (dia=dia1) then
 writeln('As datas são iguais')
 else if ano>ano1 then
 writeln(' A data ',dia,'/',mes,'/',ano,' é maior que ',dia1,'/',mes1,'/',ano1)
 else
 writeln(' A data ',dia1,'/',mes1,'/',ano1,' é maior que ',dia,'/',mes,'/',ano);
 if ano=ano1 then
 begin
 if mes1>mes then
 writeln(' A data ',dia1,'/',mes1,'/',ano1,' é maior que ',dia,'/',mes,'/',ano)
 else 
 writeln(' A data ',dia,'/',mes,'/',ano,' é maior que ',dia1,'/',mes1,'/',ano1);
 if mes1=mes then
 begin
 if dia1>dia then
 writeln(' A data ',dia1,'/',mes1,'/',ano1,' é maior que ',dia,'/',mes,'/',ano)
 else 
 writeln(' A data ',dia,'/',mes,'/',ano,' é maior que ',dia1,'/',mes1,'/',ano1);
 end;
 end;
 end.
