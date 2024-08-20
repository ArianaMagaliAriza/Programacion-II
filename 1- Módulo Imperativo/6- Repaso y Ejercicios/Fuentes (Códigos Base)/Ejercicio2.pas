program Ejercicio2;
Uses
  sysutils;
type

{ ---------- CREACION LISTAS Y ARBOL ---------- }
  pasaje = record
    codVuelo: String;
    cantMillas: integer;
    DNI: integer;
    nombreApellido: string;
    clase: string;
  end;

  lista = ^nodoLista;
  nodoLista = record
    dato: pasaje;
    sig: lista;
  end;
  pasajero=record
            DNI: integer;
            nombreApellido: string;
            puntajes:integer;
           end;
  arbol=^nodo;
  nodo=record
        dato:pasajero;
        HI:arbol;
        HD:arbol;
       end;
  listaP=^nodoP;
  nodoP=record
         puntaje:integer;
         sig:listaP;
        end;
{ ---------- CREACION LISTAS Y ARBOL ---------- }


{ ---------- CARGAR LISTA ---------- }
procedure pregunta (var r: pasaje);
  var
    v : array [1..2] of string;
    vl : array [1..26] of Char;
  begin
    vl[1]:= 'A';  vl[2]:= 'B';  vl[3]:= 'C';  vl[4]:= 'D';  vl[5]:= 'E';
    vl[6]:= 'F';  vl[7]:= 'G';  vl[8]:= 'H';  vl[9]:= 'I';  vl[10]:= 'J';
    vl[11]:= 'K'; vl[12]:= 'L'; vl[13]:= 'M'; vl[14]:= 'N'; vl[15]:= 'O';
    vl[16]:= 'P'; vl[17]:= 'Q'; vl[18]:= 'R'; vl[19]:= 'S'; vl[20]:= 'T';
    vl[21]:= 'U'; vl[22]:= 'V'; vl[23]:= 'W'; vl[24]:= 'X'; vl[25]:= 'Y';
    vl[26]:= 'Z';

    r.codVuelo:= Concat(vl[random(25)+1],vl[random(25)+1],IntToStr(random(3001)+1000)); //Codigo de vuelo
    r.cantMillas:= random(20000)+1; //Millas
    r.DNI:= random(10000000)+30000000; //DNI
    r.nombreApellido:= Concat('Pasajero-',IntToStr(r.DNI)); //Nombre y Apellido
    v[1]:= 'ejecutiva';
    v[2]:= 'turista';
    r.clase:= v[random(2)+1]; //Clase
  end;

procedure crearLista (var l: lista; r: pasaje);
var
  nue, ant, act: lista;
begin
  new(nue);
  nue^.dato:= r;
  nue^.sig:= nil;

  if (l = nil) then
    l:= nue
  else
    begin
      ant:= l;
      act:= l;

      while (act <> nil) and (act^.dato.codVuelo < nue^.dato.codVuelo) do
        begin
          ant:= act;
          act:= act^.sig;
        end;
            
        if (ant = act) then
          l:= nue
        else
          ant^.sig:= nue;
        nue^.sig:= act;
    end;
end;

procedure cargarLista (var l: lista);
var
  r: pasaje;
  x: Integer;
begin
  for x:=1 to 300 do
    begin
      pregunta(r);
      crearlista(l,r);
    end;
end;
{ ---------- CARGAR LISTA ---------- }


{ ---------- IMPRIMIR LISTA ---------- }
procedure imprimir(r: pasaje);
begin
  with r do
    writeln('Cod. Vuelo: ',codVuelo,' | Millas: ',cantMillas,' | DNI: ',DNI,' | Nombre y Apellido: ',nombreApellido,' | Clase: ',clase);
end;

procedure imprimirLista(l: lista);
begin
  while (l <> nil) do
    begin
      imprimir(l^.dato);
      l:= l^.sig;
    end;
end;
{ ---------- IMPRIMIR LISTA ---------- }

{ ---------- CREAR ARBOL ---------- }
function calcularPuntaje(p:pasaje):integer;
var
  aux:integer;
begin
  if(p.clase='ejecutiva')then aux:=p.cantMillas*100;
  else aux:=p.cantMillas*25;
  calcularPuntaje:=aux;
end;
procedure insertar(var a:arbol;p:pasaje);
var
  aux:arbol
begin
  if(a=nil)then begin
    new(a);
    aux^.dato.DNI:=p.DNI;
    aux^.dato.nombreApellido:=p.nombreApellido;
    aux^.dato.puntaje:=calcularPuntaje(p);
    aux^.sig:=a;
  end
  else
    if(a^.DNI > p.DNI)then
      insertar(a^.HI, p);
    else
      if(a^.DNI < p.DNI)then
        insertar(a^.HD, p);
    else
       if(a^.DNI = p.DNI)then
         a^.dato.puntaje:=a^.dato.puntaje+calcularPuntaje(p);
end;
{ ---------- CREAR ARBOL ---------- }

{ ---------- CALCULAR MAYOR PUNTAJE TOTAL ---------- }
function maxPuntaje(a:arbol):integer;
var
  max:integer;
begin
  max:=-1;
  if(a<>nil)then begin
    if(a^.dato.puntaje>max)then max:=a^.dato.puntaje;       
    maxPuntaje(a^.HI);
    maxPuntaje(a^.HD);
    writeln(max);
    if(maxPuntaje(a)>max)then max:=maxPuntaje(a);
  end;
  maxPuntaje:=max;
end;
{ ---------- CALCULAR MAYOR PUNTAJE TOTAL ---------- }

var
  l: lista;
  a: arbol;
begin
  Randomize;
  a:=nil;
  l:= nil;
  cargarLista(l);

  writeln('------- IMPRIMIR LISTA -------');
  imprimirLista(l);
  while(l<>nil)do begin
    insertar(a,l^.dato);
    l:=l^.sig;
  end;
  writeln();

end.
{ ---------- PROGRAMA PRINCIPAL ---------- }
