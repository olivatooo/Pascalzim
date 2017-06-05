Program zika ;
var contm,contf,idade,cont,idadet,idadett,maior,menor:integer;
mediam,mediaf:real;
sexo:char;
    
 Begin
 contm:=0;
 contf:=0;
 idade:=0;
 idadet:=0;
 idadett:=0;
 maior:=0;
 menor:=0;
 for cont:=1 to 10 do
 begin
 writeln('Digite seu sexo (M ou F)');
 readln(sexo);
 sexo:=upcase(sexo);
 writeln('Digite sua idade');
 readln(idade);
 
 if cont=1 then
 begin
 	maior:=idade;
 	menor:=idade;
 end;
 if idade>maior then
  maior:=idade
 else if idade<menor then
 menor:=idade; 
 
 if sexo='M' then
 begin
 contm:=contm+1;
 idadet:=idadet+idade; 
 end
 
 else if sexo='F' then
 begin
 contf:=contf+1;
 idadett:=idadett+idade;
 end
 
 
 
 else if (sexo<>'M') and (sexo<>'F') then
 writeln('Digite um sexo válido');
 end;
 
 
 writeln(contm);
 mediam:=idadet/contm;
 mediaf:=idadett/contf;
 writeln('A média de idade dos homens foi: ',mediam:0:2);
 writeln('A média de idade dos mulheres foi: ',mediaf:0:2);
 writeln('Maior idade = ',maior);
 writeln('Menor idade = ',menor);
 
 
 
 
 
    
 End.
