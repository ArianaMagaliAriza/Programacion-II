program repaso02;

Uses
  sysutils;

type
  { ---------- C. REGISTRO Y LISTA ---------- }
  REG_lista = record
    titulo: String;
    ISBN: Integer;
    clasificador: String;
  end;

  lista = ^nodo;
  nodo = record
    dato: REG_lista;
    sig: lista;
  end;
  { ---------- F. REGISTRO Y LISTA  ---------- }

{ ---------- C. CARGA DE LISTA ---------- }
procedure cargarLista (var l: lista; r: REG_lista);
var
  nue: lista;
begin
  New(nue);
  nue^.dato:= r;
  nue^.sig:= l;
  l:= nue;
end;

procedure pregunta (var l: lista);
var
  r: REG_lista;
  vl : array [1..26] of Char;
  x: Integer;
begin
  vl[1]:= 'A';  vl[2]:= 'B';  vl[3]:= 'C';  vl[4]:= 'D';  vl[5]:= 'E';
  vl[6]:= 'F';  vl[7]:= 'G';  vl[8]:= 'H';  vl[9]:= 'I';  vl[10]:= 'J';
  vl[11]:= 'K'; vl[12]:= 'L'; vl[13]:= 'M'; vl[14]:= 'N'; vl[15]:= 'O';
  vl[16]:= 'P'; vl[17]:= 'Q'; vl[18]:= 'R'; vl[19]:= 'S'; vl[20]:= 'T';
  vl[21]:= 'U'; vl[22]:= 'V'; vl[23]:= 'W'; vl[24]:= 'X'; vl[25]:= 'Y';
  vl[26]:= 'Z';

  for x:=1 to 150 do
    begin
      r.ISBN:= random(8001)+1000;
      r.titulo:= Concat('Titulo-',IntToStr(r.ISBN));     
      r.clasificador:= Concat(vl[random(25)+1],vl[random(25)+1],IntToStr(random(100)+1));
      cargarLista(l,r);
    end;
end;
{ ---------- F. CARGA DE LISTA ---------- }


{ ---------- C. IMPRIMIR LISTA ---------- }
procedure imprimirLista (l: lista);
begin
  while (l <> nil) do
    begin
      WriteLn('Titulo: ',l^.dato.titulo,'  ISBN: ',l^.dato.ISBN,'  Clasificador: ',l^.dato.clasificador);
      l:= l^.sig;
    end;
end;
{ ---------- F. IMPRIMIR LISTA ---------- }


{ ---------- C. PROGRAMA PRINCIPAL ----------}
var
  l: lista;
begin
  randomize;
  l:= nil;
  pregunta(l);
  WriteLn('===== IMPRIMIR LISTA =====');
  imprimirLista(l);
  WriteLn();

  { COMIENZO DE INCISOS }
end.
{ ---------- F. PROGRAMA PRINCIPAL ----------}