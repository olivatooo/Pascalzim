Program Vet_String ;
var vet:array[1..3,1..3] of string;
column,row:integer;
Begin
  vet[1,1]:='Alface';
  vet[1,2]:='Almeirão';
  vet[1,3]:='Acelga';
  vet[2,1]:='Laranja';
  vet[2,2]:='Maçã';
  vet[2,3]:='Banana';
  vet[3,1]:='Minhoca';
  vet[3,2]:='Aranha';
  vet[3,3]:='Barata';
  for column:=1 to 3 do
  Begin
    for row:=1 to 3 do
    Begin
      writeln(vet[row,column]);
    End;
  End;
End.