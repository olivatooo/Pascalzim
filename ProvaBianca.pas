Program ProvaBianca ;
var opcao, cont, soma, n, soma2, cont2, qntd, cont3, n1: integer ;

 Begin
      writeln('Op��es:') ;
      writeln('1-Soma dos n�meros de 1 a 50') ;
      writeln('2- M�dia de 10 n�meros') ;
      writeln('3- Contar a quantidade de n�meros pares entre os 100 digitados pelo usu�rio') ;
      readln(opcao);
      case opcao of
      1: begin
      soma:=0;
      for cont:=1 to 50 do
      soma:=soma+cont;
      writeln('A soma dos n�meros de 1 a 50 � ', soma);
      end;
      2: begin
      soma2:=0;
      for cont2:=1 to 10 do
      begin
      writeln('Digite um n�mero');
      readln(n);
      soma2:=soma2+n;
      end;
      writeln('M�dia= ',soma2/10);
      end;
 [     3:begin
      qntd:=0;
      for cont3:=1 to 100 do 
      begin
      writeln('Digite um n�mero');
      readln(n1);
      if ((n1 mod 2)=0) then 
      qntd:=qntd+1;
      end;
      writeln('A quantidade de n�meros pares digitados foi ', qntd) ;
      end;
      end;
      if (opcao<>1) and (opcao<>2) and (opcao<>3) then
      writeln('Op��o inv�lida');
            
 End.
