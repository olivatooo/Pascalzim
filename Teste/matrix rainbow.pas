Program Pzim ;
var v,oi:integer;
Begin
  for v:=1 to 60 do
  Begin
    oi:=random(90);
    textcolor(random(white));
    delay(0);
    write(oi);
    if v>=59 then
    Begin
      v:=1;
    end;
  end;
End.
