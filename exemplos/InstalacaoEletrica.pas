Program InterfaceTexto;
{ -------------------------------------------------------------
   Interface em Texto Pzim - vers�o 1.1

   Autor   : Alexandre Moreira Versiani
   Contato : alexandre-versiani@hotmail.com

  -------------------------------------------------------------

   Este programa tem como principal objetivo apresentar uma in-
   terface de usu�rio baseada em texto, semelhante a chamada
   'interface gr�fica', com elementos interativos vis�veis na
   tela, como bot�es, listas, campos etc. Tomou-se como refe-
   r�ncia a interface do Microsoft Word 6.0 para MS-DOS, com
   algumas diferen�as.

   A interface do Word 6.0 apresenta seus componentes contidos
   em janelas. No entanto, a interface implementada para o Pzim
   n�o possui esse sistema. Em vez disso, para simplifica��o,
   foi criado o tipo de dado 'Fundo' que representa toda a tela
   de 80x25. Nela ficam vis�veis todos os componentes de inter-
   face e o programa trabalha com a troca de telas. A interface
   Word 6.0 pode ser vista no v�deo do link:

   http://www.youtube.com/watch?v=Nqz-KtCEpZ8

   O Word 6.0 tamb�m pode ser baixado e instalado numa m�quina
   virtual com MS-DOS. O download se encontra no link:

   http://vetusware.com/download/Microsoft%20Word%206.0%20MS-DOS%20Portugues%20_PT-PT_%206.0%20PT/?id=9443

   Como exemplo demonstrativo, o atual programa implementa uma
   calculadora de pot�ncia para projetos de instala��o el�tri-
   ca residencial. Todos os c�lculos aqui presentes est�o de a-
   cordo com as normas da NBR 5410:2004 e com o manual da Prys-
   mian Cables & Systems, que pode ser baixado no link:

   http://www.prysmian.com.br/export/sites/prysmian-ptBR/energy/pdfs/Manualinstalacao.pdf

   Este programa foi concebido com finalidade meramente ilus-
   trativa. Existem no mercado solu��es em softwares mais pro-
   fissionais para um projeto de instala��o el�trica.

   A interface desse programa possui os seguintes componentes:

   � Borda;
   � Lista;
   � Bot�o;
   � Campo de texto;
   � Caixa de Sele��o.

   Os componentes abaixo n�o s�o implementados nesse programa:

   � �rea de texto;
   � Painel de rolamento;
   � Bot�o de op��o;
   � Caixa de combina��o;
   � Barra de menu;
   � Explorador de arquivos.

   Nota: Este c�digo � livre e pode ser reaproveitado, modiica-
   do e aperfei�oado, sem que haja preju�zos legais.
  ------------------------------------------------------------- }

 type
     Botao = record
               X: integer;
               Y: integer;
               Tamanho: integer;
               Status: integer;
               Titulo: string[80];
               CoordTtl: integer;
             end;
     Quadro = record
                X: integer;
                Y: integer;
                Base: integer;
                Altura: integer;
                Titulo: string[80];
                LinhaTitulo: integer;
              end;
     Campo = record
               X: integer;
               Y: integer;
               Tamanho: integer;
               Capacidade: integer;
               Conteudo: string;
               Status: boolean;
             end;
     Lista = record
               X: integer;
               Y: integer;
               i: integer;
               j: integer;
               Base: integer;
               Altura: integer;
               Linha: integer;
               Coluna: integer;
               BarraX: integer;
               BarraY: integer;
               Total: integer;
               NoInicio: ^Elemento;
               NoTopo: ^Elemento;
               NoAtual: ^Elemento;
               NoFim: ^Elemento;
             end;
     Elemento = record
                  Titulo: string[80];
                  Ante: ^Elemento;
                  Prox: ^Elemento;
                end;
     CaixaSelec = record
                    X: integer;
                    Y: integer;
                    Titulo: string[80];
                    Selecao: boolean;
                    Status: boolean;
                  end;
     Fundo = record
               Titulo: string[80];
               CoordTtl: integer;
             end;
     Dependencia = record
                     Area: real;
                     Perimetro: real;
                     NumTUG: integer;
                     PotIlum: integer;
                     PotTUG: real;
                     PotTUE: integer;
                   end;

 Var
     // vari�veis de uso geral

     B: integer;          // �ndice do vetor de bot�es (referente ao bot�o atual selecionado)
     k: integer;          // Contador de uso geral
     Temp: real;          // Vari�vel tempor�ria
     Linha: integer;      // Contador para linha do cursor na tela
     Tecla: char;         // C�digo ASCII da tecla (exemplo: Esc = #27, Enter = #13)
     IndDep: integer;     // �ndice no vetor de depend�ncias da casa (referente � �ltima posi��o)
     CodErro: integer;    // Posi��o no campo em que foi digitado um caractere inv�lido
     ErroPot: boolean;    // Verdadeiro = erro nos campos de pot�ncia
     ZeroDep: boolean;    // Verdadeiro = nenhuma depend�ncia cadastrada
     MaxDep: boolean;     // Verdadeiro = alcan�ou o n�mero m�ximo de depend�ncias

     // vari�veis do projeto de instala��o el�trica

     NomeDep: string;     // Nome da depend�ncia
     Area: real;          // �rea da depend�ncia
     Perimetro: real;     // Per�metro da depend�ncia
     NumTomadas: integer; // N�mero de tomadas de uso geral da depend�ncia
     PotIlum: integer;    // Pot�ncia de ilumina��o da depend�ncia
     PotTUG: real;        // Pot�ncia das tomadas de uso geral (TUG)
     PotTUE: integer;     // Pot�ncia das tomadas de uso espec�fico (TUE)
     PotTemp: integer;    // Vari�vel Tempor�ria (intermedi�ria para o c�lculo de PotTUE)
     PotAtiva: real;      // Pot�ncia ativa total da casa
     VetDependencia: array[1..20] of Dependencia; // Vetor com informa��es de cada depend�ncia da casa

     // vari�veis dos elementos de interface com o usu�rio

     TelaInicio: Fundo;   // Fundo inicial do programa
     TelaNovaDep: Fundo;  // Fundo para cadastro de nova depend�ncia
     TelaPotTotal: Fundo; // Fundo para pot�ncia ativa total
     ListPadrao: Lista;   // Lista contendo os tipos padr�es das depend�ncias (sala, quarto, cozinha, etc)
     ListNovaDep: Lista;  // Lista contendo as depend�ncias cadastradas
     QuadInfo: Quadro;    // Quadro para informa��es da depend�ncia selecionada no menu
     QuadTomada: Quadro;  // Quadro das tomadas de uso espec�fico
     CampNome: Campo;     // Campo para nome da depend�ncia
     CampArea: Campo;     // Campo para �rea da depend�ncia
     CampPerim: Campo;    // Campo para per�metro da depend�ncia
     VetBotao: array[0..7] of Botao;         // Vetor que agrupa todos os bot�es
     VetCaixaSel: array[1..7] of CaixaSelec; // Vetor que agrupa todas as caixas de sele��o
     VetCampPot: array[1..7] of Campo;       // Vetor que agrupa os campos referentes a pot�ncia das TUE

{------------------------------------------------------------------
 Procedure novoBotao: Inicializa a vari�vel do tipo Botao
 ------------------------------------------------------------------}
 Procedure novoBotao(var Bot: Botao; X, Y, Tamanho, Status: integer; Titulo: string[80]);
 begin
     Bot.X := X;
     Bot.Y := Y;
     Bot.Tamanho := Tamanho;
     Bot.Status := Status;
     Bot.Titulo := Titulo;
     Bot.CoordTtl := round((Tamanho - length(Titulo))/2) + X + 1;
 end;

{------------------------------------------------------------------
 Procedure desenhaBotao: Desenha o bot�o na tela
 ------------------------------------------------------------------}
 Procedure desenhaBotao(var Bot: Botao);
 Var
     C: array[1..6] of char;
     Cor1: integer;
     Cor2: integer;
     i: integer;
 begin
     case(Bot.Status) of
         0, 1: begin
             C[1] := #218;
             C[2] := #196;
             C[3] := #191;
             C[4] := #179;
             C[5] := #217;
             C[6] := #192;
         end;
         2: begin
             C[1] := #201;
             C[2] := #205;
             C[3] := #187;
             C[4] := #186;
             C[5] := #188;
             C[6] := #200;
         end;
         else
             exit;
     end;

     case(Bot.Status) of
         0: begin
             Cor1 := DARKGRAY;
             Cor2 := DARKGRAY;
         end;
         1, 2: begin
             Cor1 := WHITE;
             Cor2 := BLACK;
         end;
     end;

     textbackground(LIGHTGRAY);
     textcolor(Cor1);
     gotoxy(Bot.X, Bot.Y);
     write(C[1]);
     for i:=1 to Bot.Tamanho do
         write(C[2]);
     textcolor(Cor2);
     write(C[3]+#10+#8+C[4]);
     textcolor(Cor1);
     gotoxy(Bot.X, Bot.Y + 1);
     write(C[4]+#10+#8+C[6]);
     textcolor(Cor2);
     for i:=1 to Bot.Tamanho do
         write(C[2]);
     write(C[5]);
     gotoxy(Bot.CoordTtl, Bot.Y + 1);
     write(Bot.Titulo);
 end;

{------------------------------------------------------------------
 Procedure restauraBotao: muda o status do bot�o para habilitado e
 n�o selecionado, atualizando seu desenho. Se o bot�o j� tem esse
 status, nenhuma a��o � tomada.
 ------------------------------------------------------------------}
 Procedure restauraBotao(var Bot: Botao);
 begin
     if(Bot.Status <> 1) then
     begin
         Bot.Status := 1;
         desenhaBotao(Bot);
     end;
 end;

{------------------------------------------------------------------
 Procedure desabilitaBotao: muda o status do bot�o para desabilita-
 do, atualizando seu desenho. Se o bot�o j� tem esse status, nenhu-
 ma a��o � tomada.
 ------------------------------------------------------------------}
 Procedure desabilitaBotao(var Bot: Botao);
 begin
     if(Bot.Status <> 0) then
     begin
         Bot.Status := 0;
         desenhaBotao(Bot);
     end;
 end;

{------------------------------------------------------------------
 Procedure selecionaBotao: muda o status do bot�o para selecionado,
 atualizando seu desenho e movendo o cursor para seu t�tulo. Se o
 bot�o j� tem esse status, o procedimento apenas move o cursor para
 o t�tulo do bot�o.
 ------------------------------------------------------------------}
 Procedure selecionaBotao(var Bot: Botao);
 begin
     if(Bot.Status <> 2) then
     begin
         Bot.Status := 2;
         desenhaBotao(Bot);
     end;
     gotoxy(Bot.CoordTtl, Bot.Y + 1);
 end;

{------------------------------------------------------------------
 Procedure pressionaBotao: desenha o bot�o de modo que pare�a pres-
 sionado, sem alterar, no entanto, seu status. N�o foi implementado
 um status de bot�o pressionado porque, em geral, o seu desenho a-
 parece na transi��o de telas. 
 ------------------------------------------------------------------}
 Procedure pressionaBotao(var Bot: Botao);
 Var
     i: integer;
 begin
     textbackground(LIGHTGRAY);
     textcolor(BLACK);
     gotoxy(Bot.X, Bot.Y);
     write(#201);
     for i:=1 to Bot.Tamanho do
         write(#205);
     textcolor(WHITE);
     write(#187+#10+#8+#186);
     textcolor(BLACK);
     gotoxy(Bot.X, Bot.Y + 1);
     write(#186+#10+#8+#200);
     textcolor(WHITE);
     for i:=1 to Bot.Tamanho do
         write(#205);
     write(#188);
     textbackground(BLACK);
     textcolor(LIGHTGRAY);
     gotoxy(Bot.CoordTtl, Bot.Y + 1);
     write(Bot.Titulo);
     delay(400);
 end;

{------------------------------------------------------------------
 Procedure novoFundo: inicializa a vari�vel do tipo Fundo.
 ------------------------------------------------------------------}
 Procedure novoFundo(var Fund: Fundo; Titulo: string[80]);
 begin
     Fund.Titulo := Titulo;
     Fund.CoordTtl := round((80 - length(Titulo))/2) + 1;
 end;

{------------------------------------------------------------------
 Procedure desenhaFundo: limpa a tela com a a cor LIGHTGRAY e dese-
 nha uma faixa superior com o t�tulo da tela.
 ------------------------------------------------------------------}
 Procedure desenhaFundo(var Fund: Fundo);
 Var
     i: integer;
     Lim1: integer;
     Lim2: integer;
 begin
     textbackground(LIGHTGRAY);
     textcolor(WHITE);
     Lim1 := Fund.CoordTtl - 1;
     
     if(odd(length(Fund.Titulo))) then
         Lim2 := Lim1 - 1
     else
         Lim2 := Lim1;    
     
     clrscr;
     textbackground(LIGHTMAGENTA);
     gotoxy(1, 1);
     
     for i:=1 to Lim1 do
         write(#32);

     write(Fund.Titulo);

     for i:=1 to Lim2 do
         write(#32);
 end;

{------------------------------------------------------------------
 Procedure novoQuadro: inicializa a vari�vel do tipo Quadro.
 ------------------------------------------------------------------}
 Procedure novoQuadro(var Quad: Quadro; X, Y, Base, Altura: integer; Titulo: string[80]);
 begin
     Quad.X := X;
     Quad.Y := Y;
     Quad.Base := Base;
     Quad.Altura := Altura;
     Quad.Titulo := Titulo;
     Quad.LinhaTitulo := Base - length(Titulo) - 2;
 end;

{------------------------------------------------------------------
 Procedure desenhaQuadro: desenha o quadro na tela.
 ------------------------------------------------------------------}
 Procedure desenhaQuadro(var Quad: Quadro);
 Var
     i: integer;
 begin
     textbackground(LIGHTGRAY);
     textcolor(BLACK);

     gotoxy(Quad.X, Quad.Y);
     write(#218+#32+Quad.Titulo+#32);
     for i:=1 to Quad.LinhaTitulo do
         write(#196);
     textcolor(WHITE);
     write(#191+#10+#8);
     for i:=1 to Quad.Altura do
         write(#179+#10+#8);
     textcolor(BLACK);
     gotoxy(Quad.X, Quad.Y + 1);
     for i:=1 to Quad.Altura do
         write(#179+#10+#8);
     write(#192);
     textcolor(WHITE);
     for i:=1 to Quad.Base do
         write(#196);
     write(#217);
 end;

{------------------------------------------------------------------
 Procedure novoCampo: inicializa a vari�vel do tipo Campo.
 ------------------------------------------------------------------}
 Procedure novoCampo(var Camp: Campo; X, Y, Tamanho, Capacidade: integer; Status: boolean);
 begin
     Camp.X := X;
     Camp.Y := Y;
     Camp.Tamanho := Tamanho;
     Camp.Capacidade := Capacidade;
     Camp.Status := Status;
     delete(Camp.Conteudo, 1, 255);
 end;

{------------------------------------------------------------------
 Procedure desenhaCampo: desenha o campo na tela.
 ------------------------------------------------------------------}
 Procedure desenhaCampo(var Camp: Campo);
 Var
     i: integer;
     Lim1: integer;
     Lim2: integer;
 begin
     textbackground(LIGHTGRAY);
     if(Camp.Status) then
         textcolor(BLACK)
     else
         textcolor(DARKGRAY);

     Lim1 := length(Camp.Conteudo);
     if(Lim1 > Camp.Tamanho) then
     begin
         Lim1 := Camp.Tamanho;
         Lim2 := 0;
     end
     else
         Lim2 := Camp.Tamanho - Lim1;

     gotoxy(Camp.X, Camp.Y);
     write('[');

     for i:=1 to Lim1 do
         write(Camp.Conteudo[i]);
     for i:=1 to Lim2 do
         write(#250);
     write(']');
 end;

{------------------------------------------------------------------
 Procedure habilitaCampo: muda o status do campo para habilitado,
 atualizando o seu desenho. Se o campo j� tem esse status, nenhuma
 a��o � tomada.
 ------------------------------------------------------------------}
 Procedure habilitaCampo(var Camp: Campo);
 begin
     if(not(Camp.Status)) then
     begin
         Camp.Status := true;
         desenhaCampo(Camp);
     end;
 end;

{------------------------------------------------------------------
 Procedure desabilitaCampo: muda o status do campo para desabilita-
 do, atualizando o seu desenho. Se o campo j� tem esse status, ne-
 nhuma a��o � tomada.
 ------------------------------------------------------------------}
 Procedure desabilitaCampo(var Camp: Campo);
 begin
     if(Camp.Status) then
     begin
         Camp.Status := false;
         desenhaCampo(Camp);
     end;
 end;

{------------------------------------------------------------------
 Procedure limpaCampo: remove todos os caracteres digitados no cam-
 po. A a��o � feita apenas na mem�ria, sem atualizar o desenho.
 ------------------------------------------------------------------}
 Procedure limpaCampo(var Camp: Campo);
 begin
     delete(Camp.Conteudo, 1, 255);
 end;

{------------------------------------------------------------------
 Procedure digitaCampo: permite ao usu�rio digitar no campo, caso o
 mesmo esteja habilitado. O procedimento � encerrado caso o usu�rio
 pressione <ESC>, <TABLE> ou <ENTER>. O c�digo ASCII da tecla pres-
 sionada � transferido ao par�metro Tecla. Se o campo est� desabi-
 litado, Tecla recebe #0 e o procedimento � encerrado.
 ------------------------------------------------------------------}
 Procedure digitaCampo(var Camp: Campo; var Tecla: char);
 Var
     i: integer;      // �ndice da string referente � posi��o do cursor
     j: integer;      // �ndice da string referente ao limite esquerdo do desenho
     k: integer;      // �ndice da string referente ao limite direito do desenho
     cont: integer;   // Contador
     Fim: integer;    // �ndice da string referente � �ltima posi��o 
     Cursor: integer; // Coordenada 'x' do cursor na tela
     Lim1: integer;   // Coordenada 'x' do limite esquerdo do desenho
     Lim2: integer;   // Coordenada 'x' do limite direito do desenho
 begin
     if(not(Camp.Status)) then
     begin
         tecla := #0;
         exit;
     end;

     textbackground(LIGHTGRAY);
     textcolor(BLACK);

     Lim1 := Camp.X + 1;            // posi��o ap�s o colchete [
     Lim2 := Camp.X + Camp.Tamanho; // posi��o antes do colchete ]
     Fim := length(Camp.Conteudo);
     i := Fim + 1;                  // �ndice atual recebe a posi��o seguinte do fim da string

     if(i <= Camp.Tamanho) then     // se �ndice atual � menor ou igual ao tamanho do desenho
     begin
         j := 1;
         k := Camp.Tamanho;
         Cursor := Camp.X + i;
         gotoxy(Cursor, Camp.Y);    // posiciona o cursor logo ap�s o �ltimo caractere do campo
     end
     else
     begin
         j := i - Camp.Tamanho + 1;
         k := i;
         Cursor := Lim2;
         gotoxy(Lim1, Camp.Y);

         for cont:=j to Fim do
             write(Camp.Conteudo[cont]); // imprime os �ltimos caracteres da string
         write(#250+#8);                 // o caractere 'ponto centralizado' �, por padr�o, impresso na �ltima posi��o do campo
     end;

     while(true) do
     begin
         Tecla := readkey;
         case(Tecla) of
             #0:
                 case(readkey) of
                     #77:                                // SETA_DIREITA
                         if(i <= Fim) then
                             if(Cursor < Lim2) then
                             begin
                                 inc(i);
                                 inc(Cursor);
                                 gotoxy(Cursor, Camp.Y);
                                 continue;
                             end
                             else
                             begin
                                 inc(i);
                                 inc(j);
                                 inc(k);
                                 cont := j;
                                 gotoxy(Lim1, Camp.Y);
                             end
                         else
                             continue;
                     #75:                                // SETA_ESQUERDA
                         if(Cursor > Lim1) then
                         begin
                             dec(i);
                             dec(Cursor);
                             gotoxy(Cursor, Camp.Y);
                             continue;
                         end
                         else
                             if(i > 1) then
                             begin
                                 dec(i);
                                 dec(j);
                                 dec(k);
                                 cont := j;
                             end
                             else
                                 continue;
                     #83:                                // DELETE
                         if(i <= Fim) then
                         begin
                             dec(Fim);
                             delete(Camp.Conteudo, i, 1);
                             cont := i;
                         end
                         else
                             continue;
                     #71:                                // HOME
                         if(j > 1) then
                         begin
                             i := 1;
                             j := 1;
                             k := Camp.Tamanho;
                             Cursor := Lim1;
                             cont := 1;
                             gotoxy(Lim1, Camp.Y);
                         end
                         else
                             if(i <> 1) then
                             begin
                                 i := 1;
                                 Cursor := Lim1;
                                 gotoxy(Lim1, Camp.Y);
                                 continue;
                             end
                             else
                                 continue;
                     #79:                                // END
                         if(Fim >= k) then
                         begin
                             i := Fim + 1;
                             j := i - Camp.Tamanho + 1;
                             k := i;
                             Cursor := Lim2;
                             cont := j;
                             gotoxy(Lim1, Camp.Y);
                         end
                         else
                             if(i <= Fim) then
                             begin
                                 i := Fim + 1;
                                 Cursor := Lim1 + (i - j);
                                 gotoxy(Cursor, Camp.Y);
                                 continue;
                             end
                             else
                                 continue;
                     else
                         continue;
                 end;
             #8:                                         // BACKSPACE
                 if(Cursor > Lim1 + 1) then              // se Cursor � maior que a segunda posi��o
                 begin
                     dec(i);
                     dec(Fim);
                     dec(Cursor);
                     delete(Camp.Conteudo, i, 1);
                     cont := i;
                     gotoxy(Cursor, Camp.Y);
                 end
                 else if(Cursor = Lim1 + 1) then         // se Cursor est� na segunda posi��o
                     if(j = 1) then
                     begin
                         dec(i);
                         dec(Fim);
                         dec(Cursor);
                         delete(Camp.Conteudo, i, 1);
                         cont := 1;
                         gotoxy(Lim1, Camp.Y);
                     end
                     else
                     begin
                         dec(i);
                         dec(j);
                         dec(k);
                         dec(Fim);
                         delete(Camp.Conteudo, i, 1);
                         cont := j;
                         gotoxy(Lim1, Camp.Y);
                     end
                 else                                    // se n�o, o cursor est� na primeira posi��o
                     if(j > 2) then
                     begin
                         dec(i);
                         dec(Fim);
                         inc(Cursor);
                         j := j - 2;
                         k := k - 2;
                         delete(Camp.Conteudo, i, 1);
                         cont := j;
                     end
                     else if(j = 2) then
                     begin
                         dec(i);
                         dec(j);
                         dec(k);
                         dec(Fim);
                         delete(Camp.Conteudo, i, 1);
                         cont := 1;
                     end
                     else
                         continue;

             #9, #13, #27:                               // TABLE, ENTER ou ESC
             begin
                 if(j <> 1) then
                 begin
                     if(Fim > Camp.Tamanho) then
                         Fim := Camp.Tamanho;
                     gotoxy(Lim1, Camp.Y);
                     for cont:=1 to Fim do
                         write(Camp.Conteudo[cont]);     // imprime os primeiros caracteres da string
                 end;
                 exit;                                   // finaliza o procedmento
             end;
             
             else                                        // se n�o, a tecla � um caractere alfanum�rico
                 if(Fim < Camp.Capacidade) then
                     if(Cursor < Lim2) then
                     begin
                         inc(Fim);
                         inc(Cursor);
                         insert(Tecla, Camp.Conteudo, i);
                         cont := i;
                         inc(i);
                     end
                     else
                     begin
                         inc(j);
                         inc(k);
                         inc(Fim);
                         insert(Tecla, Camp.Conteudo, i);
                         inc(i);
                         cont := j;
                         gotoxy(Lim1, Camp.Y);
                     end
                 else    
                     continue;
         end;

         if(Fim < k) then
         begin
             for cont:=cont to Fim do
                 write(Camp.Conteudo[cont]);
             write(#250);
         end
         else
             for cont:=cont to k do
                 write(Camp.Conteudo[cont]);
         gotoxy(Cursor, Camp.Y);
     end;
 end;

{------------------------------------------------------------------
 Procedure novaLista: inicializa a vari�vel do tipo Lista.
 ------------------------------------------------------------------}
 Procedure novaLista(var List: Lista; X, Y, Base, Altura: integer);
 begin
     List.i := 1;
     List.j := 1;
     List.Total := 0;
     List.X := X;
     List.Y := Y;
     List.Base := Base;
     List.Altura := Altura;
     List.Linha := Y + 1;
     List.Coluna := X + 1;
     List.BarraX := X + Base + 1;
     List.BarraY := Y + 2;
     List.NoInicio := nil;
     List.NoTopo := nil;
     List.NoAtual := nil;
     List.NoFim := nil;
 end;
 
{------------------------------------------------------------------
 Procedure desenhaLista: desenha a lista na tela.
 ------------------------------------------------------------------}
 Procedure desenhaLista(var List: Lista);
 Var
     Cont: integer;
     Lim: integer;
     PtrAux: ^Elemento;
 begin
     textbackground(LIGHTGRAY);
     textcolor(BLACK);
     Lim := List.Altura - 2;

     gotoxy(List.X, List.Y);
     write(#218);
     for Cont:=1 to List.Base do
         write(#196);
     textcolor(WHITE);
     write(#191+#10+#8);
     textcolor(BLACK);
     write(#24+#10+#8);
     for Cont:=1 to Lim do
         write(#176+#10+#8);
     write(#25);
     gotoxy(List.X, List.Y + 1);
     for Cont:=1 to List.Altura do
         write(#179+#10+#8);
     write(#192);
     textcolor(WHITE);
     for Cont:=1 to List.Base do
         write(#196);
     write(#217);
     textcolor(BLACK);
     gotoxy(List.BarraX, List.BarraY);
     write(#219);

     if(List.Total = 0) then
         exit;

     PtrAux := List.NoTopo;

     if(List.Total < List.Altura) then
         Lim := List.Y + List.Total
     else
         Lim := List.Y + List.Altura;

     for Cont:=List.Y+1 to Lim do
     begin
         gotoxy(List.Coluna, Cont);
         write(PtrAux^.Titulo);
         PtrAux := PtrAux^.Prox;
     end;

     textbackground(BLACK);
     textcolor(LIGHTGRAY);
     gotoxy(List.Coluna, List.Linha);
     write(List.NoAtual^.Titulo);
 end;
 
{------------------------------------------------------------------
 Procedure selecionaLista: permite ao usu�rio selecionar itens da
 lista, pressionando as teclas <SETA_ACIMA> e <SETA_ABAIXO>. O pro-
 cedimento � encerrado caso o usu�rio pressione <ESC>, <TABLE> ou
 <ENTER>. O c�digo ASCII da tecla pressionada � transferido ao pa-
 r�metro Tecla. Se a lista n�o possui elementos, Tecla recebe #0 e
 o procedimento � encerrado.
 ------------------------------------------------------------------}
 Procedure selecionaLista(var List: Lista; var Tecla: char);
 Var
     Cont: integer;
     Temp: integer;
     Atualizacao: boolean;
     LimSuperior: integer;
     LimInferior: integer;
     PtrAux: ^Elemento;
 begin
     if(List.Total = 0) then
     begin
         Tecla := #0;
         exit;
     end;

     LimSuperior := List.Y + 1;
     
     if(List.Total < List.Altura) then
         LimInferior := List.Y + List.Total
     else
         LimInferior := List.Y + List.Altura;

     gotoxy(List.Coluna, List.Linha);
     
     while(true) do
     begin
         case(readkey) of
             #0:
                 case(readkey) of
                     #80:
                         if(List.Linha <> LimInferior) then
                         begin
                             inc(List.i);
                             inc(List.Linha);
                             PtrAux := List.NoAtual;
                             List.NoAtual := List.NoAtual^.Prox;
                             Atualizacao := false;
                         end
                         else
                             if(List.i <> List.Total) then
                             begin
                                 inc(List.i);
                                 inc(List.j);
                                 List.NoTopo := List.NoTopo^.Prox;
                                 List.NoAtual := List.NoAtual^.Prox;
                                 Atualizacao := true;
                             end
                             else
                                 continue;
                     #72:
                         if(List.Linha <> LimSuperior) then
                         begin
                             dec(List.i);
                             dec(List.Linha);
                             PtrAux := List.NoAtual;
                             List.NoAtual := List.NoAtual^.Ante;
                             Atualizacao := false;
                         end
                         else
                             if(List.i <> 1) then
                             begin
                                 dec(List.i);
                                 dec(List.j);
                                 List.NoTopo := List.NoTopo^.Ante;
                                 List.NoAtual := List.NoAtual^.Ante;
                                 Atualizacao := true;
                             end
                             else
                                 continue;    
                     else
                         continue;
                 end;
	        
             #9: begin
                 Tecla := #9;
                 exit;
             end;
             #13: begin
                 Tecla := #13;
                 exit;
             end;
             #27: begin
                 Tecla := #27;
                 exit;
             end;
             else
                 continue;
         end;

         if(Atualizacao) then
         begin
             Temp := List.BarraY;
             PtrAux := List.NoTopo;
             List.BarraY := round((List.j - 1)*(List.Altura - 3)/(List.Total - List.Altura)) + List.Y + 2;

             textbackground(LIGHTGRAY);
             textcolor(BLACK);
		   
             for Cont:=LimSuperior to LimInferior do
             begin
                 gotoxy(List.Coluna, Cont);
                 write(PtrAux^.Titulo);
                 PtrAux := PtrAux^.Prox;
             end;

             gotoxy(List.BarraX, Temp);
             write(#176);
             gotoxy(List.BarraX, List.BarraY);
             write(#219);

             textbackground(BLACK);
             textcolor(LIGHTGRAY);
             gotoxy(List.Coluna, List.Linha);
             write(List.NoAtual^.Titulo);
             gotoxy(List.Coluna, List.Linha);
         end
         else
         begin
             textbackground(LIGHTGRAY);
             textcolor(BLACK);
             write(PtrAux^.Titulo);

             textbackground(BLACK);
             textcolor(LIGHTGRAY);
             gotoxy(List.Coluna, List.Linha);
             write(List.NoAtual^.Titulo);

             gotoxy(List.Coluna, List.Linha);
         end;
     end;
 end;

{------------------------------------------------------------------
 Procedure insereFimLista: insere um novo elemento no final da lis-
 ta, com o t�tulo passado para Cadeia. A a��o � feita apenas na me-
 m�ria, sem atualizar o desenho. Se Cadeia for vazia, nenhum ele-
 mento � inserido e o procedimento � encerrado.
 ------------------------------------------------------------------}
 Procedure insereFimLista(var List: Lista; Cadeia: string[80]);
 Var
     Cont: integer;
     Lim: integer;
     PtrAux: ^Elemento;
 begin
     if(length(Cadeia) = 0) then
         exit;

     new(PtrAux);
     if(PtrAux = nil) then
         exit;

     Lim := length(Cadeia) + 1;

     PtrAux^.Titulo[0] := chr(List.Base);
     PtrAux^.Titulo[1] := #32;
     for Cont:=2 to Lim do
         PtrAux^.Titulo[Cont] := Cadeia[Cont-1];
     for Cont:=Lim+1 to List.Base do
         PtrAux^.Titulo[Cont] := #32;

     inc(List.Total);
     PtrAux^.Prox := nil;

     if(List.Total > 1) then
     begin
         PtrAux^.Ante := List.NoFim;
         List.NoFim^.Prox := PtrAux;
         List.NoFim := PtrAux;
         if(List.j > 1) then
             List.BarraY := round((List.j - 1)*(List.Altura - 3)/(List.Total - List.Altura)) + List.Y + 2;
     end
     else
     begin
         PtrAux^.Ante := nil;
         List.NoInicio := PtrAux;
         List.NoTopo := PtrAux;
         List.NoAtual := PtrAux;
         List.NoFim := PtrAux;
     end;
 end;

{------------------------------------------------------------------
 Procedure removeSelecLista: remove o elemento atualmente selecio-
 nado na lista, liberando mem�ria alocada. O procedimento n�o atua-
 liza o desenho.
 ------------------------------------------------------------------}
 Procedure removeSelecLista(var List: Lista);
 Var
     PtrAux1: ^Elemento;
     PtrAux2: ^Elemento;
 Begin
     if(List.Total = 0) then
         exit;

     if(List.i = 1) then
     begin
         if(List.Total > 1) then
         begin
             List.NoInicio := List.NoInicio^.Prox;
             dispose(List.NoAtual);
             List.NoInicio^.Ante := nil;
             List.NoTopo := List.NoInicio;
             List.NoAtual := List.NoInicio;
         end
         else
         begin
             dispose(List.NoAtual);
             List.NoInicio := nil;
             List.NoTopo := nil;
             List.NoAtual := nil;
             List.NoFim := nil;
         end;

         dec(List.Total);
         exit;
     end
     else
     begin
         if(List.i < List.Total) then
         begin
             PtrAux1 := List.NoAtual^.Ante;
             PtrAux2 := List.NoAtual^.Prox;
             dispose(List.NoAtual);
             PtrAux1^.Prox := PtrAux2;
             PtrAux2^.Ante := PtrAux1;
         end
         else
         begin
             PtrAux1 := List.NoAtual^.Ante;
             dispose(List.NoAtual);
             List.NoFim := PtrAux1;
             List.NoFim^.Prox := nil;
         end;

         if(List.Total - List.j >= List.Altura) then
         begin
             List.NoAtual := PtrAux2;

             if(List.i = List.j) then
                 List.NoTopo := PtrAux2;

             dec(List.Total);
         end
         else
             if(List.j > 1) then
             begin
                 if(List.i > List.j) then
                     List.NoTopo := List.NoTopo^.Ante
                 else
                     List.NoTopo := PtrAux1;

                 if(List.i < List.Total) then
                 begin
                     inc(List.Linha);
                     List.NoAtual := PtrAux2;
                 end
                 else
                 begin
                     dec(List.i);
                     List.NoAtual := PtrAux1;
                 end;

                 dec(List.j);
                 dec(List.Total);
             end
             else
             begin
                 if(List.i < List.Total) then
                     List.NoAtual := PtrAux2
                 else
                 begin
                     dec(List.i);
                     dec(List.Linha);
                     List.NoAtual := PtrAux1;
                 end;
                 
                 dec(List.Total);
                 exit;
             end;

         if(List.j > 1) then
             List.BarraY := round((List.j - 1)*(List.Altura - 3)/(List.Total - List.Altura)) + List.Y + 2
         else
             List.BarraY := List.Y + 2;
     end;
 End;

{------------------------------------------------------------------
 Procedure atualizaLista: Imprime as strings armazenadas na lista,
 atualizando a mesma, em caso de remo��o ou inser��o de elementos.
 Se os elementos n�o completam o quadro, espa�os vazios s�o impres-
 sos. O procedimento n�o imprime as bordas do quadro, logo � neces-
 s�rio que a lista esteja previamente desenhada.
 ------------------------------------------------------------------}
 Procedure atualizaLista(var List: Lista);
 Var
     ContX: integer;
     ContY: integer;
     Lim1: integer;
     Lim2: integer;
     PtrAux: ^Elemento;
 Begin
     Lim1 := List.Altura - 2;
     Lim2 := List.Y + List.Altura;
     PtrAux := List.NoTopo;
     textbackground(LIGHTGRAY);
     textcolor(BLACK);
     gotoxy(List.BarraX, List.Y + 2);

     for ContY:=1 to Lim1 do
         write(#176+#10+#8);

     gotoxy(List.BarraX, List.BarraY);
     write(#219);

     if(List.Total < List.Altura) then
         Lim1 := List.Y + List.Total
     else
         Lim1 := List.Y + List.Altura;

     for ContY:=List.Y+1 to Lim1 do
     begin
         gotoxy(List.Coluna, ContY);
         write(PtrAux^.Titulo);
         PtrAux := PtrAux^.Prox;
     end;

     for ContY:=Lim1+1 to Lim2 do
     begin
         gotoxy(List.Coluna, ContY);
         for ContX:=1 to List.Base do
             write(#32);
     end;

     if(List.Total <> 0) then
     begin
         textbackground(BLACK);
         textcolor(LIGHTGRAY);
         gotoxy(List.Coluna, List.Linha);
         write(List.NoAtual^.Titulo);
     end;
 End;

{------------------------------------------------------------------
 Procedure resetaLista: move o cursor da lista para o primeiro ele-
 mento, assim como o �ndice recebe 1 e a barra de rolamento retorna
 � primeira posi��o. A a��o � feita apenas na mem�ria, sem aatuali-
 zar o desenho.
 ------------------------------------------------------------------}
 Procedure resetaLista(var List: Lista);
 Begin
     if(List.i > 1) then
     begin
         List.i := 1;
         List.j := 1;
         List.Linha := List.Y + 1;
         List.BarraY := List.Y + 2;
         List.NoTopo := List.NoInicio;
         List.NoAtual := List.NoInicio;
     end;
 End;

{------------------------------------------------------------------
 Procedure limpaLista: remove todos os itens inseridos na lista,
 liberando mem�ria alocada. O procedimento n�o atualiza o desenho.
 ------------------------------------------------------------------}
 Procedure limpaLista(var List: Lista);
 Var
     PtrAux1: ^Elemento;
     PtrAux2: ^Elemento;
 begin
     if(List.Total = 0) then
         exit;

     PtrAux1 := List.NoFim;
     PtrAux2 := List.NoFim^.Ante;
     dispose(PtrAux1);

     while(PtrAux2 <> nil) do
     begin
         PtrAux1 := PtrAux2;
         PtrAux2 := PtrAux2^.Ante;
         dispose(PtrAux1);
     end;

     List.i := 1;
     List.j := 1;
     List.Total := 0;
     List.Linha := List.Y + 1;
     List.BarraY := List.Y + 2;
     List.NoInicio := nil;
     List.NoTopo := nil;
     List.NoAtual := nil;
     List.NoFim := nil;
 end;

{------------------------------------------------------------------
 Procedure novaCaixaSel: inicializa a vari�vel do tipo CaixaSelec.
 ------------------------------------------------------------------}
 Procedure novaCaixaSel(var Caixa: CaixaSelec; X, Y: integer; Selecao, Status: boolean; Titulo: string[80]);
 begin
     Caixa.X := X;
     Caixa.Y := Y;
     Caixa.Titulo := Titulo;
     Caixa.Selecao := Selecao;
     Caixa.Status := Status;
 end;

{------------------------------------------------------------------
 Procedure desenhaCaixaSel: desenha a caixa de sele��o na tela.
 ------------------------------------------------------------------}
 Procedure desenhaCaixaSel(var Caixa: CaixaSelec);
 begin
     textbackground(LIGHTGRAY);
     if(Caixa.Status) then
         textcolor(BLACK)
     else
         textcolor(DARKGRAY);

     gotoxy(Caixa.X, Caixa.Y);
     
     if(Caixa.Selecao) then
         write('[X] ' + Caixa.Titulo)
     else
         write('[ ] ' + Caixa.Titulo);
 end;
 
{------------------------------------------------------------------
 Procedure habilitaCaixaSel: muda o status da caixa de sele��o para
 habilitado, atualizando seu desenho. Se a caixa j� tem esse sta-
 tus, nenhuma a��o � tomada.
 ------------------------------------------------------------------}
 Procedure habilitaCaixaSel(var Caixa: CaixaSelec);
 begin
     if(not(Caixa.Status)) then
     begin
         Caixa.Status := true;
         desenhaCaixaSel(Caixa);
     end;
 end;
 
{------------------------------------------------------------------
 Procedure desabilitaCaixaSel: muda o status da caixa de sele��o
 para desabilitado, atualizando seu desenho. Se a caixa j� tem esse
 status, nenhuma a��o � tomada.
 ------------------------------------------------------------------}
 Procedure desabilitaCaixaSel(var Caixa: CaixaSelec);
 begin
     if(Caixa.Status) then
     begin
         Caixa.Status := false;
         desenhaCaixaSel(Caixa);
     end;
 end;
 
{------------------------------------------------------------------
 Procedure selecionaCaixaSel: se a caixa est� em branco, o caracte-
 re 'X' � desenhado no centro, ou, se est� marcada com 'X', o ca-
 ractere � apagado.
 ------------------------------------------------------------------}
 Procedure selecionaCaixaSel(var Caixa: CaixaSelec);
 Var
     Marca: char;
 Begin
     if(Caixa.Status) then
     begin
         textbackground(BLACK);
         textcolor(LIGHTGRAY);

         if(Caixa.Selecao) then
         begin
             Marca := #32;
             Caixa.Selecao := false;
         end
         else
         begin
             Marca := #88;
             Caixa.Selecao := true;
         end;

         gotoxy(Caixa.X, Caixa.Y);
         write(#91+Marca+#93+#8+#8);
         delay(200);
         textbackground(LIGHTGRAY);
         textcolor(BLACK);
         write(#8+#91+Marca+#93+#8+#8);
     end;
 end;
 
{---------------------------------------------------------------------
 Procedure novaDependencia: inicializa a vari�vel do tipo Dependencia.
 ---------------------------------------------------------------------}
 Procedure novaDependencia(var Dep: Dependencia; Area, Perimetro, PotTUG: real; NumTUG, PotIlum, PotTUE: integer);
 begin
     Dep.Area := Area;
     Dep.Perimetro := Perimetro;
     Dep.NumTUG := NumTUG;
     Dep.PotTUG := PotTUG;
     Dep.PotIlum := PotIlum;
     Dep.PotTUE := PotTUE;
 end;

{------------------------------------------------------------------
                         PROGRAMA PRINCIPAL
 ------------------------------------------------------------------}
 Begin
     novoFundo(TelaInicio, 'Instala��o El�trica Pzim');
     novoFundo(TelaNovaDep, 'Nova Depend�ncia');
     novoFundo(TelaPotTotal, 'Pot�ncia Total');
     novoQuadro(QuadInfo, 33, 6, 40, 7, 'Info');
     novoQuadro(QuadTomada, 28, 10, 41, 8, 'Tomada de Uso Espec�fico');
     novaLista(ListNovaDep, 5, 6, 24, 7);
     novaLista(ListPadrao, 2, 10, 22, 8);
     novoCampo(CampNome, 28, 4, 15, 25, true);
     novoCampo(CampArea, 28, 5, 15, 7, true);
     novoCampo(CampPerim, 28, 6, 15, 7, true);
     novoCampo(VetCampPot[1], 63, 12, 5, 4, false);
     novoCampo(VetCampPot[2], 63, 13, 5, 4, false);
     novoCampo(VetCampPot[3], 63, 14, 5, 4, false);
     novoCampo(VetCampPot[4], 63, 15, 5, 4, false);
     novoCampo(VetCampPot[5], 63, 16, 5, 4, false);
     novoCampo(VetCampPot[6], 63, 17, 5, 4, false);
     novoCampo(VetCampPot[7], 63, 18, 5, 4, false);
     novoBotao(VetBotao[0], 9, 22, 10, 2, 'Novo...');
     novoBotao(VetBotao[1], 22, 22, 10, 0, 'Info');
     novoBotao(VetBotao[2], 35, 22, 10, 0, 'Deletar');
     novoBotao(VetBotao[3], 48, 22, 10, 0, 'Calcular');
     novoBotao(VetBotao[4], 61, 22, 10, 1, 'Sair');
     novoBotao(VetBotao[5], 46, 22, 10, 2, 'OK');
     novoBotao(VetBotao[6], 59, 22, 10, 1, 'Cancelar');
     novoBotao(VetBotao[7], 35, 22, 10, 2, 'OK');
     novaCaixaSel(VetCaixaSel[1], 30, 12, false, true, 'Chuveiro');
     novaCaixaSel(VetCaixaSel[2], 30, 13, false, true, 'Ar Condicionado');
     novaCaixaSel(VetCaixaSel[3], 30, 14, false, true, 'Torneira El�trica');
     novaCaixaSel(VetCaixaSel[4], 30, 15, false, true, 'Microondas');
     novaCaixaSel(VetCaixaSel[5], 30, 16, false, true, 'Geladeira');
     novaCaixaSel(VetCaixaSel[6], 30, 17, false, true, 'M�quina de Lavar');
     novaCaixaSel(VetCaixaSel[7], 30, 18, false, true, 'Secadora de Roupa');

    {-------------------------------------------------
     A lista inicialmente � vazia. O procedimento a-
     baixo insere os itens vis�veis da lista.
     -------------------------------------------------}
     insereFimLista(ListPadrao, 'Sala');
     insereFimLista(ListPadrao, 'Quarto');
     insereFimLista(ListPadrao, 'Copa');
     insereFimLista(ListPadrao, 'Cozinha');
     insereFimLista(ListPadrao, 'Banheiro');
     insereFimLista(ListPadrao, '�rea de Servi�o');
     insereFimLista(ListPadrao, 'Corredor');
     insereFimLista(ListPadrao, 'Varanda');
     insereFimLista(ListPadrao, 'Hall');
     insereFimLista(ListPadrao, 'S�t�o');
     insereFimLista(ListPadrao, 'Garagem');

     IndDep := 0;
     ZeroDep := true;
     MaxDep := false;
     cursoron;

    {-------------------------------------------------
     while para o retorno � tela inicial.
     -------------------------------------------------}
     while(true) do
     begin

         // Desenha todos os componentes vis�veis na primeira tela.

         desenhaFundo(TelaInicio);
         desenhaLista(ListNovaDep);
         desenhaBotao(VetBotao[0]);
         desenhaBotao(VetBotao[1]);
         desenhaBotao(VetBotao[2]);
         desenhaBotao(VetBotao[3]);
         desenhaBotao(VetBotao[4]);
         desenhaQuadro(QuadInfo);
         
         textcolor(BLACK);
         gotoxy(5, 5);
         write('Depend�ncia cadastrada:');

         textcolor(DARKGRAY);
         gotoxy(35, 8);
         write('�rea (m'+#253+')');
         gotoxy(35, 9);
         write('Per�metro (m)');
         gotoxy(35, 10);
         write('N�mero de TUG'+#39+'s');
         gotoxy(35, 11);
         write('Pot�ncia Ilumina��o (VA)');
         gotoxy(35, 12);
         write('Pot�ncia TUG'+#39+'s (VA)');
         gotoxy(35, 13);
         write('Pot�ncia TUE'+#39+'s (VA)');

         gotoxy(70, 8);
         write('0.00'+#10+#8+#8+#8+#8+
               '0.00'+#10+#8+#8+#8+#8+
               '0.00'+#10+#8+#8+#8+#8+
               '0.00'+#10+#8+#8+#8+#8+
               '0.00'+#10+#8+#8+#8+#8+
               '0.00');

         if(MaxDep) then
             B := 1
         else
             B := 0;

        {-------------------------------------------------
         while para retorno � lista ap�s a exibi��o de in-
         forma��es no quadro ou ap�s remo��o de elemento.
         -------------------------------------------------}
         while(true) do
         begin

            {-------------------------------------------------
             while para retorno � lista ap�s o usu�rio apertar
             a tecla <TABLE> com o cursor no bot�o 'Sair'.
             -------------------------------------------------}
             while(true) do
             begin
                 selecionaLista(ListNovaDep, Tecla);
                 if(Tecla = #13) then                 // Se �ltima tecla for <ENTER>
                     break;                           // Encerra imediatamente o la�o while

                 selecionaBotao(VetBotao[B]);

                {-------------------------------------------------
                 while para o controle dos bot�es.
                 -------------------------------------------------}
                 while(true) do
                 begin
                     Tecla := readkey;
                     case(Tecla) of
                         #0:                                            // #0 = tecla especial
                             case(readkey) of
                                 #77:                                   // #77 = <SETA_DIREITA>
                                     if((B <> 4) and not(ZeroDep)) then
                                     begin
                                         restauraBotao(VetBotao[B]);
                                         selecionaBotao(VetBotao[B+1]);
                                         inc(B);
                                     end
                                     else if((B = 0) and ZeroDep) then
                                     begin
                                         restauraBotao(VetBotao[0]);
                                         selecionaBotao(VetBotao[4]);
                                         B := 4;
                                     end;

                                 #75:                                   // #75 = <SETA_ESQUERDA>
                                     if( ((B <> 0) and not(ZeroDep) and not(MaxDep)) or
                                         ((B <> 1) and MaxDep) ) then
                                     begin
                                         restauraBotao(VetBotao[B]);
                                         selecionaBotao(VetBotao[B-1]);
                                         dec(B);
                                     end
                                     else if((B = 4) and ZeroDep) then
                                     begin
                                         restauraBotao(VetBotao[4]);
                                         selecionaBotao(VetBotao[0]);
                                         B := 0;
                                     end;
                             end;

                         #9:                                            // #9 = <TABLE>
                             if((B <> 4) and not(ZeroDep)) then
                             begin
                                 restauraBotao(VetBotao[B]);
                                 selecionaBotao(VetBotao[B+1]);
                                 inc(B);
                             end
                             else if((B = 0) and ZeroDep) then
                             begin
                                 restauraBotao(VetBotao[0]);
                                 selecionaBotao(VetBotao[4]);
                                 B := 4;
                             end
                             else if(not(MaxDep)) then
                             begin
                                 restauraBotao(VetBotao[4]);
                                 selecionaBotao(VetBotao[0]);
                                 B := 0;
                                 break;
                             end
                             else
                             begin
                                 restauraBotao(VetBotao[4]);
                                 selecionaBotao(VetBotao[1]);
                                 B := 1;
                                 break;
                             end;

                         #13:                                           // #13 = <ENTER>
                             break;
                     end;
                 end;

                 if(Tecla = #13) then    // Se �ltima tecla for <ENTER>
                     break;              // Encerra imediatamente o la�o while

             end;

             pressionaBotao(VetBotao[B]);

             if(B = 1) then
             begin
                 desenhaBotao(VetBotao[1]);
                 k := ListNovaDep.i;

                 textbackground(LIGHTGRAY);
                 textcolor(BLACK);
                 gotoxy(35, 8);
                 write('�rea (m'+#253+')                ', VetDependencia[k].Area:14:2);
                 gotoxy(35, 9);
                 write('Per�metro (m)            ', VetDependencia[k].Perimetro:14:2);
                 gotoxy(35, 10);
                 write('N�mero de TUG'+#39+'s          ', VetDependencia[k].NumTUG:11, '.00');
                 gotoxy(35, 11);
                 write('Pot�ncia Ilumina��o (VA) ', VetDependencia[k].PotIlum:11, '.00');
                 gotoxy(35, 12);
                 write('Pot�ncia TUG'+#39+'s (VA)      ', VetDependencia[k].PotTUG:14:2);
                 gotoxy(35, 13);
                 write('Pot�ncia TUE'+#39+'s (VA)      ', VetDependencia[k].PotTUE:11, '.00');
             end
             else if(B = 2) then
             begin
                 desenhaBotao(VetBotao[2]);
                 k := ListNovaDep.i;
                 removeSelecLista(ListNovaDep);
                 atualizaLista(ListNovaDep);
                 dec(IndDep);
                 
                 for k:=k to IndDep do
                     VetDependencia[k] := VetDependencia[k+1];
                 
                 if(IndDep = 0) then
                 begin
                     ZeroDep := true;
                     B := 0;
                     selecionaBotao(VetBotao[0]);
                     desabilitaBotao(VetBotao[1]);
                     desabilitaBotao(VetBotao[2]);
                     desabilitaBotao(VetBotao[3]);
                 end;
                 
                 if(MaxDep) then
                 begin
                     MaxDep := false;
                     restauraBotao(VetBotao[0]);
                 end;
             end
             else
                 break;
         end;

         if(B = 0) then
         begin
             desenhaFundo(TelaNovaDep);

             textbackground(LIGHTGRAY);
             textcolor(BLACK);

             gotoxy(1, 4);
             write(' Nome para depend�ncia:'+#10+#13+
                   ' �rea (m'+#253+'):'+#10+#13+
                   ' Per�metro (m):'+#10+#10+#10+#13+
                   ' Tipo de depend�ncia:');

             desenhaCampo(CampNome);
             desenhaCampo(CampArea);
             desenhaCampo(CampPerim);
             desenhaLista(ListPadrao);
             desenhaQuadro(QuadTomada);

             for k:=1 to 7 do
                 desenhaCaixaSel(VetCaixaSel[k]);

             textcolor(DARKGRAY);

             for Linha:=12 to 18 do
             begin
                 gotoxy(53, Linha);
                 write('Pot�ncia:');
             end;

             for k:=1 to 7 do
                 desenhaCampo(VetCampPot[k]);

             desenhaBotao(VetBotao[5]);
             desenhaBotao(VetBotao[6]);

             B := 5;
             Linha := 0;

            {-------------------------------------------------
             while para retorno aos campos ap�s a verifica��o
             e confirma��o de erros nos campos.
             -------------------------------------------------}
             while(true) do
             begin

                {-------------------------------------------------
                 while para retorno aos campos ap�s o usu�rio a-
                 pertar a tecla <TABLE> com o cursor no bot�o
                 'Cancelar'.
                 -------------------------------------------------}
                 while(true) do
                 begin
                     digitaCampo(CampNome, Tecla);
                     if((Tecla = #13) or (Tecla = #27)) then
                         break;

                     digitaCampo(CampArea, Tecla);
                     if((Tecla = #13) or (Tecla = #27)) then
                         break;

                     digitaCampo(CampPerim, Tecla);
                     if((Tecla = #13) or (Tecla = #27)) then
                         break;

                     selecionaLista(ListPadrao, Tecla);
                     if((Tecla = #13) or (Tecla = #27)) then
                         break;

                     k := 1;
                     Linha := 12;
                     gotoxy(31, 12);
                 
                    {-------------------------------------------------
                     while para controle das caixas de sele��o e dos
                     campos de pot�ncia.
                     -------------------------------------------------}
                     while(true) do
                     begin
                         Tecla := readkey;
                         case(Tecla) of
                             #0:
                                 case(readkey) of
                                     #80:
                                         if(Linha < 18) then
                                         begin
                                             inc(k);
                                             inc(Linha);
                                             gotoxy(31, Linha);
                                         end;
                                     #72:
                                         if(Linha > 12) then
                                         begin
                                             dec(k);
                                             dec(Linha);
                                             gotoxy(31, Linha);
                                         end;
                                 end;

                             #9: begin
                                 if(VetCaixaSel[k].Selecao) then
                                 begin
                                     digitaCampo(VetCampPot[k], Tecla);
                                     if((Tecla = #13) or (Tecla = #27)) then
                                         break;
                                 end;

                                 if(Linha < 18) then
                                 begin
                                     inc(k);
                                     inc(Linha);
                                     gotoxy(31, Linha);
                                 end
                                 else
                                     break;
                             end;

                             #32: begin
                                 selecionaCaixaSel(VetCaixaSel[k]);

                                 if(VetCaixaSel[k].Selecao) then
                                 begin
                                     VetCampPot[k].Status := true;
                                     textcolor(BLACK);
                                 end
                                 else
                                 begin
                                     VetCampPot[k].Status := false;
                                     textcolor(DARKGRAY);
                                 end;

                                 gotoxy(53, Linha);
                                 write('Pot�ncia:');
                                 desenhaCampo(VetCampPot[k]);
                                 gotoxy(31, Linha);
                             end;

                             #13, #27:
                                 break;
                         end;
                     end;

                     if((Tecla = #13) or (Tecla = #27)) then
                         break;

                     selecionaBotao(VetBotao[5]);

                    {---------------------------------------------------
                     while para o controle dos bot�es 'OK' e 'Candelar'.
                     ---------------------------------------------------}
                     while(true) do
                     begin
                         Tecla := readkey;
                         case(Tecla) of
                             #0:
                                 case(readkey) of
                                     #77:
                                         if(B <> 6) then
                                         begin
                                             restauraBotao(VetBotao[B]);
                                             selecionaBotao(VetBotao[B+1]);
                                             inc(B);
                                         end;
                                     #75:
                                         if(B <> 5) then
                                         begin
                                             restauraBotao(VetBotao[B]);
                                             selecionaBotao(VetBotao[B-1]);
                                             dec(B);
                                         end;
                                 end;

                             #9:
                             begin
                                 if(B = 6) then
                                 begin
                                     restauraBotao(VetBotao[6]);
                                     selecionaBotao(VetBotao[5]);
                                     B := 5;
                                     break;
                                 end;
                                 restauraBotao(VetBotao[B]);
                                 selecionaBotao(VetBotao[B+1]);
                                 inc(B);
                             end;

                             #13, #27:
                                 break;
                         end;
                     end;

                     if((Tecla = #13) or (Tecla = #27)) then
                         break;
                 end;

                 // Quando apertar <Esc>
                 if(Tecla = #27) then
                     break;

                 if(B = 5) then
                 begin
                     pressionaBotao(VetBotao[5]);
                 
                     if(length(CampNome.Conteudo) = 0) then
                     begin
                         //mensagem de erro
                         desenhaBotao(VetBotao[5]);
                         write(#7);
                         continue;
                     end;

                     val(CampArea.Conteudo, Area, CodErro);
                     if((CodErro <> 0) or (Area <= 0)) then
                     begin
                         //mensagem de erro
                         desenhaBotao(VetBotao[5]);
                         write(#7);
                         continue;
                     end;
                 
                     val(CampPerim.Conteudo, Perimetro, CodErro);
                     if((CodErro <> 0) or (Perimetro <= 0)) then
                     begin
                         //mensagem de erro
                         desenhaBotao(VetBotao[5]);
                         write(#7);
                         continue;
                     end;

                     PotTUE := 0;
                     ErroPot := false;
                     
                     for k:=1 to 7 do
                         if(VetCampPot[k].Status) then
                         begin
                             val(VetCampPot[k].Conteudo, PotTemp, CodErro);
                             
                             if((CodErro <> 0) or (PotTemp <= 0)) then
                             begin
                                 //mensagem de erro
                                 desenhaBotao(VetBotao[5]);
                                 write(#7);
                                 ErroPot := true;
                                 break;
                             end;
                             
                             PotTUE := PotTUE + PotTemp;
                         end;

                     if(ErroPot) then
                         continue;

                     insereFimLista(ListNovaDep, CampNome.Conteudo);

                     // Pot�ncia de Ilumina��o------------------------------

                     if(Area > 6) then
                         PotIlum := 100 + 60*trunc((Area - 6)/4)
                     else
                         PotIlum := 100;

                     // N�mero de TUG's-------------------------------------

                     case(ListPadrao.i) of
                         
                         // sala, quarto, hall
                         1, 2, 9:  
                             if(Area > 6) then
                             begin
                                 Temp := Perimetro/5;
                                 if(frac(Temp) > 0) then
                                     NumTomadas := trunc(Temp) + 1
                                 else
                                     NumTomadas := trunc(Temp);
                             end
                             else
                                 NumTomadas := 1; // c�modos com �rea igual
                                                  // ou inferior a 6m�

                         // cozinha, copa, �rea de servi�o
                         3, 4, 6:
                             if(Area > 6) then
                             begin
                                 Temp := Perimetro/3.5;
                                 if(frac(Temp) > 0) then
                                     NumTomadas := trunc(Temp) + 1
                                 else
                                     NumTomadas := trunc(Temp);
                             end
                             else
                                 NumTomadas := 2;

                         // banheiros, varandas, subsolos, garagens, sot�os
                         5, 8, 10, 11:
                             NumTomadas := 1;

                         // corredor
                         7:
                             NumTomadas := 0;
                     end;

                     // Potencia das TUG's----------------------------------

                     case(ListPadrao.i) of
                     
                         // banheiro, cozinha, copa, area de servi�o
                         3, 4, 5, 6:
                             if(NumTomadas > 3) then
                                 PotTUG := 1800 + 100*(NumTomadas - 3)
                             else
                                 PotTUG := 600*NumTomadas;
                         else
                             PotTUG := 100*NumTomadas; // demais c�modos
                     end;
                     
                     inc(IndDep);
                     novaDependencia(VetDependencia[IndDep], Area, Perimetro, PotTUG, NumTomadas, PotIlum, PotTUE);

                     if(IndDep = 20) then
                     begin
                         MaxDep := true;
                         VetBotao[0].Status := 0;
                         VetBotao[1].Status := 2;
                     end;
                     
                     if(ZeroDep) then
                     begin
                         ZeroDep := false;
                         VetBotao[1].Status := 1;
                         VetBotao[2].Status := 1;
                         VetBotao[3].Status := 1;
                     end;

                     break;
                 end
                 else
                 begin
                     //quando cancelar
                     pressionaBotao(VetBotao[6]);
                     break;
                 end;
             end;

             limpaCampo(CampNome);
             limpaCampo(CampArea);
             limpaCampo(CampPerim);
             resetaLista(ListPadrao);
             VetBotao[5].Status := 2;
             VetBotao[6].Status := 1;

             for k:=1 to 7 do
             begin
                 VetCaixaSel[k].Selecao := false;
                 limpaCampo(VetCampPot[k]);
                 VetCampPot[k].Status := false;
             end;
         end
         else if(B = 3) then
         begin
             desenhaFundo(TelaPotTotal);
             desenhaBotao(VetBotao[7]);

             PotIlum := 0;
             PotTUG := 0;
             PotTUE := 0;

             for k:=1 to IndDep do
             begin
                 PotIlum := PotIlum + VetDependencia[k].PotIlum;
                 PotTUG := PotTUG + VetDependencia[k].PotTUG;
                 PotTUE := PotTUE + VetDependencia[k].PotTUE;
             end;

             PotTUG := PotTUG*0.8;
             PotAtiva := PotTUG + PotIlum + PotTUE;

             textbackground(LIGHTGRAY);
             textcolor(BLACK);
             gotoxy(1, 4);

             write(' Pot�ncia Ativa Total de Ilumina��o (W).........', PotIlum, '.00'+#10+#13+
                   ' Pot�ncia Ativa Total das TUG'+#39+'s (W).............', PotTUG:0:2, #10+#13+
                   ' Pot�ncia Ativa Total das TUE'+#39+'s (W).............', PotTUE, '.00'+#10+#13+
                   ' Pot�ncia Ativa Total da Resid�ncia (W).........', PotAtiva:0:2, #10+#10+#13+
                   ' Sua instala��o necessita de um padr�o de entrada ');

             if(PotAtiva <= 12000) then
                 write('monof�sico.')
             else if((PotAtiva > 12000) and (PotAtiva <= 25000)) then
                 write('bif�sico.')
             else
                 write('trif�sico.');

             gotoxy(1, 15);
             write(' Nota: TUG = Tomada de Uso Geral;'+#10+#13+
                   '       TUE = Tomada de Uso Espec�fico.');

             selecionaBotao(VetBotao[7]);

             while(true) do
             begin
                 Tecla := readkey;
                 if(Tecla = #13) then
                 begin
                     pressionaBotao(VetBotao[7]);
                     break;
                 end;
                 if(Tecla = #27) then
                     break;
             end;

             if(MaxDep) then
                 VetBotao[1].Status := 2
             else
                 VetBotao[0].Status := 2;

             VetBotao[3].Status := 1;
         end
         else
         begin
             limpaLista(ListNovaDep);  // Limpa a lista, liberando mem�ria antes do programa encerrar.
             limpaLista(ListPadrao);
             exit;
         end;
     end;
 End.