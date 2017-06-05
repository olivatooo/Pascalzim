Program Pzim ;
var jogada1,cont,x1,x2,x3,x4,x5,x6,x7,x8,x9,jogada,jogada2,g1,g2,g3,g4,g5,g6,g7,g8,g9:integer;


 Begin
x1:=0;
x2:=0;
x3:=0;
x4:=0;
x5:=0;
x6:=0;
x7:=0;
x8:=0;
x9:=0;
 gotoxy(30,5);
   write('1  |  2  | 3');
 gotoxy(30,6);	
   write('   |     |  ');
   gotoxy(30,7);	
   write('   |     |  ');
    gotoxy(30,8);	
  	  write('- - - - - - -');
  	  gotoxy(30,9);
   write('4  |  5  | 6');
 gotoxy(30,10);	
   write('   |     |  ');
   gotoxy(30,11);	
   write('   |     |  ');
   gotoxy(30,12);	
  	  write('- - - - - - - -');
  	  gotoxy(30,13);
   write('7  |  8  | 9');
 gotoxy(30,14);	
   write('   |     |  ');
   gotoxy(30,15);	
   write('   |     |  ');
   For cont:=1 to 15 do
   begin
   g1:=x1+x2+x3;
   g2:=x4+x5+x6;
   g3:=x7+x8+x9;
   g4:=x1+x4+x7;
   g5:=x2+x5+x8;
   g6:=x3+x6+x9;
   g7:=x1+x5+x9;
   g8:=x3+x5+x7;
   if (g1=6) or (g2=6) or (g3=6) or (g4=6) or (g5=6) or (g6=6) or (g7=6) or (g8=6) then
   begin
   clrscr;
   gotoxy(30,10);
   write('Jogador 2 Ganhou!');
   end;
   if (g1=21) or (g2=21) or (g3=21) or (g4=21) or (g5=21) or (g6=21) or (g7=21) or (g8=21) then
   begin
   clrscr;
   gotoxy(30,10);
   write('Jogador 1 Ganhou!');
   end;
   if x1+x2+x3+x4+x5+x6+x7+x8+x9=43 then
   begin
   clrscr;
   gotoxy(30,10);
   write('  Deu Velha');
   end;
   //---- BEGIN IF ----//
   if cont mod 2<>0 then
   begin;
   gotoxy(30,20);
   write('Vez do jogador 1 => ');
   read(jogada1);
   jogada:=jogada1;
   if (jogada1=1) and (x1=2) then
   begin
   while jogada1=1 do
   begin
   gotoxy(20,22);
   write('Jogada Inválida : Vez do jogador 1 => ');
   readln(jogada1);
   end;
   end;
   if (jogada1=2) and (x2=2) then
   begin
   while jogada1=2 do
   begin
   gotoxy(20,22);
   write('Jogada Inválida : Vez do jogador 1 => ');
   readln(jogada1);
   end;
   end;
   if (jogada1=3) and (x3=2) then
   begin
   while jogada1=3 do
   begin
   gotoxy(20,22);
   write('Jogada Inválida : Vez do jogador 1 => ');
   readln(jogada1);
   end;
   end;
   if (jogada1=4) and (x4=2) then
   begin
   while jogada1=4 do
   begin
   gotoxy(20,22);
   write('Jogada Inválida : Vez do jogador 1 => ');
   readln(jogada1);
   end;
   end;
   if (jogada1=5) and (x5=2) then
   begin
   while jogada1=5 do
   begin
   gotoxy(20,22);
   write('Jogada Inválida : Vez do jogador 1 => ');
   readln(jogada1);
   end;
   end;
   if (jogada1=6) and (x6=2) then
   begin
   while jogada1=6 do
   begin
   gotoxy(20,22);
   write('Jogada Inválida : Vez do jogador 1 => ');
   readln(jogada1);
   end;
   end;
   if (jogada1=7) and (x7=2) then
   begin
   while jogada1=7 do
   begin
   gotoxy(20,22);
   write('Jogada Inválida : Vez do jogador 1 => ');
   readln(jogada1);
   end;
   end;
   if (jogada1=8) and (x8=2) then
   begin
   while jogada1=8 do
   begin
   gotoxy(20,22);
   write('Jogada Inválida : Vez do jogador 1 => ');
   readln(jogada1);
   end;
   end;
   if (jogada1=9) and (x9=2) then
   begin
   while jogada1=9 do
   begin
   gotoxy(20,22);
   write('Jogada Inválida : Vez do jogador 1 => ');
   readln(jogada2);
   end;
   end;
   //----- BEGIN CASE ----//
   case jogada1 of
   1:begin
     gotoxy(30,7);
   x1:=7;
     write('X');
     end;
     2:begin
   gotoxy(36,7);
   x2:=7; 
     write('X');
     end;
     3:begin
   gotoxy(41,7);
   x3:=7; 
     write('X');
     end;
     4:begin
   gotoxy(30,11);
   x4:=7;
     write('X');
     end;
     5:begin
   gotoxy(36,11);
   x5:=7;
     write('X');
     end;
     6:begin
   gotoxy(41,11);
   x6:=7;
     write('X');
     end;
     7:begin
   gotoxy(30,15);
   x7:=7;
     write('X');
     end;
     8:begin
   gotoxy(36,15);
   x8:=7;
     write('X');
     end;
     9:begin
   gotoxy(41,15);
   x9:=7;
     write('X');
     end;
     end;
     end;
     //----- END CASE -----//
   if cont mod 2=0 then 
   begin;
   gotoxy(30,20);
   write('Vez do jogador 2 => ');
   read(jogada2);
   jogada2:=jogada2;
   if (jogada2=1) and (x1=7) then
   begin
   while jogada2=1 do
   begin
   gotoxy(20,22);
   write('Jogada Inválida : Vez do jogador 2 => ');
   readln(jogada2);
   end;
   end;
   if (jogada2=2) and (x2=7) then
   begin
   while jogada2=2 do
   begin
   gotoxy(20,22);
   write('Jogada Inválida : Vez do jogador 2 => ');
   readln(jogada2);
   end;
   end;
   if (jogada2=3) and (x3=7) then
   begin
   while jogada2=3 do
   begin
   gotoxy(20,22);
   write('Jogada Inválida : Vez do jogador 2 => ');
   readln(jogada2);
   end;
   end;
   if (jogada2=4) and (x4=7) then
   begin
   while jogada2=4 do
   begin
   gotoxy(20,22);
   write('Jogada Inválida : Vez do jogador 2 => ');
   readln(jogada2);
   end;
   end;
   if (jogada2=5) and (x5=7) then
   begin
   while jogada2=5 do
   begin
   gotoxy(20,22);
   write('Jogada Inválida : Vez do jogador 2 => ');
   readln(jogada2);
   end;
   end;
   if (jogada2=6) and (x6=7) then
   begin
   while jogada2=6 do
   begin
   gotoxy(20,22);
   write('Jogada Inválida : Vez do jogador 2 => ');
   readln(jogada2);
   end;
   end;
   if (jogada2=7) and (x7=7) then
   begin
   while jogada2=7 do
   begin
   gotoxy(20,22);
   write('Jogada Inválida : Vez do jogador 2 => ');
   readln(jogada2);
   end;
   end;
   if (jogada2=8) and (x8=7) then
   begin
   while jogada2=8 do
   begin
   gotoxy(20,22);
   write('Jogada Inválida : Vez do jogador 2 => ');
   readln(jogada2);
   end;
   end;
   if (jogada2=9) and (x9=7) then
   begin
   while jogada2=9 do
   begin
   gotoxy(20,22);
   write('Jogada Inválida : Vez do jogador 2 => ');
   readln(jogada2);
   end;
   end;
   //----- BEGIN CASE ----//
   case jogada2 of
   1:begin
   gotoxy(30,7);
   x1:=2;
     write('O');
     end;
     2:begin
   gotoxy(36,7);
   x2:=2; 
     write('O');
     end;
     3:begin
   gotoxy(41,7);
   x3:=2; 
     write('O');
     end;
     4:begin
   gotoxy(30,11);
   x4:=2;
     write('O');
     end;
     5:begin
   gotoxy(36,11);
   x5:=2;
     write('O');
     end;
     6:begin
   gotoxy(41,11);
   x6:=2;
     write('O');
     end;
     7:begin
   gotoxy(30,15);
   x7:=2;
     write('O');
     end;
     8:begin
   gotoxy(36,15);
   x8:=2;
     write('O');
     end;
     9:begin
   gotoxy(41,15);
   x9:=2;
     write('O');
     end;
     end;
     //----- END CASE -----//
     
     end;
     end;
     
    
    
   
    
   
 End.
