Program Ampulheta ;
var left,right:integer;
Begin
  repeat
    left:=60;
    right:=0;
    for  right:=0 to 60 do
    Begin
      clrscr;
      gotoxy(40,10);
      writeln(left,'-',right);
      left:=left-1;
      delay(100);
    end;
  until(left>60);
End.