Program pg29ex1 ;
var idade:integer;
sexo:string;
 Begin
      writeln('Digite sua idade');
      readln(idade);
      if (idade>=18) then
      begin
      	writeln('Maior de idade');
      	writeln('Já pode dirigir');
      	writeln('Digite seu sexo(m ou f).');
      	readln(sexo);
      	sexo:=upcase(sexo);
      	
      	
      	
      	if sexo='M' then
      	
      	writeln('Serviço militar obrigatório.');
      	end
      	else
      	writeln('Menor de idade');
 End.
 

      
