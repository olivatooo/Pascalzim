Program ErroString;
uses crt ;

 Var cadeia, aux: string[80] ;
     lim, i: integer;

 Begin
     clrscr ;
     cadeia := 'Quarto' ;
     { aux:= '1234567890' ; }
     writeln(ord(cadeia[0]));   { Mostra 6 }
     Lim := length(Cadeia) + 1;

     aux[0] := chr(25) ;
     aux[1] := #32;              {// primeira posi��o � ocupada com o caractere SPACE }

     for i:=2 to Lim do
         aux[i] := Cadeia[i-1];  {// a partir da segunda posi��o, PtrAux^.Titulo recebe os caracteres de Cadeia }

     for i:=i+1 to 25 do
         aux[i] := #32;          {// na sequ�ncia, PtrAux^.Titulo recebe caracteres SPACE at� a posi��o 25 }

     delete(aux, 26, 255);       {// por fim, o excedente deve ser ignorado, ficando a string com um m�ximo de 25 caracteres }
 
     writeln('*', aux, '*', length(aux)) ; { Mostra * Quarto                  *25 }
     readln ;
 End.