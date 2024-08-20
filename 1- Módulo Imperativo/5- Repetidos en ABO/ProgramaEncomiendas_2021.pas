Program encomiendas;
Type

   encomienda = record
                  codigo: integer;
                  peso: integer;
                end;

  // Lista de encomiendas
  lista = ^nodoL;
  nodoL = record
    dato: encomienda;
    sig: lista;
  end;
  listaCod=^nodoC;
  nodoC=record
          cod:integer;
          sig:listaCod;
        end;
  datos=record
          peso:integer;
          codigos:listaCod;
        end;
  arbol=^nodoA;
  nodoA=record
          info:datos;
          HI:arbol;
          HD:arbol;
        end;
  // Lista de Arboles
  listaNivel = ^nodoN;
  nodoN = Record
    info: arbol;
    sig: listaNivel;
  End;

{-----------------------------------------------------------------------------
AgregarAdelante - Agrega una encomienda adelante en l}
procedure agregarAdelante(var l: Lista; enc: encomienda);
var
  aux: lista;
begin
  new(aux);
  aux^.dato := enc;
  aux^.sig := l;
  l:= aux;
end;


{-----------------------------------------------------------------------------
CREARLISTA - Genera una lista con datos de las encomiendas }
procedure crearLista(var l: Lista);
var
  e: encomienda;
  i: integer;
begin
 l:= nil;
 for i:= 1 to 20 do begin
   e.codigo := i;
   e.peso:= random (10);
   while (e.peso = 0) do e.peso:= random (10);
   agregarAdelante(L, e);
 End;
end;


{-----------------------------------------------------------------------------
IMPRIMIRLISTA - Muestra en pantalla la lista l }
procedure imprimirLista(l: Lista);
begin
 While (l <> nil) do begin
   writeln('Codigo: ', l^.dato.codigo, '  Peso: ', l^.dato.peso);
   l:= l^.sig;
 End;
end;


Procedure imprimir(a:arbol);
Begin
  writeln('El peso ', a^.info.peso, ' tiene los siguientes codigos');
  While (a^.info.codigos<>Nil) Do
    Begin
      write(a^.info.codigos^.cod, ' ');
      a^.info.codigos := a^.info.codigos^.sig;
    End;
End;

{CONTARELEMENTOS - Devuelve la cantidad de elementos de una lista l }

Function ContarElementos (l: listaNivel): integer;

Var c: integer;
Begin
  c := 0;
  While (l <> Nil) Do
    Begin
      c := c+1;
      l := l^.sig;
    End;
  contarElementos := c;
End;

{AGREGARATRAS - Agrega un elemento atrás en l}
Procedure AgregarAtras (Var l, ult: listaNivel; a:arbol);

Var nue: listaNivel;

Begin
  new (nue);
  nue^.info := a;
  nue^.sig := Nil;
  If (l= Nil) Then l := nue
  Else ult^.sig := nue;
  ult := nue;
End;

{IMPRIMIRPORNIVEL - Muestra los datos del árbol a por niveles}
Procedure imprimirpornivel(a: arbol);

Var 
  l, aux, ult: listaNivel;
  nivel, cant, i: integer;
Begin
  l := Nil;
  If (a <> Nil)Then
    Begin
      nivel := 0;
      agregarAtras (l,ult,a);
      While (l<> Nil) Do
        Begin
          nivel := nivel + 1;
          cant := contarElementos(l);
          write ('Nivel ', nivel, ': ');
          For i:= 1 To cant Do
            Begin
              imprimir(l^.info);
              If (l^.info^.HI <> Nil) Then agregarAtras (l,ult,l^.info^.HI);
              If (l^.info^.HD <> Nil) Then agregarAtras (l,ult,l^.info^.HD);
              aux := l;
              l := l^.sig;
              dispose (aux);
            End;
          writeln;
        End;
    End;
End;

Procedure agregarCod(Var l: listaCod; c:Integer);

Var 
  aux:listaCod;
Begin
  new(aux);
  aux^.cod:=c;
  aux^.sig:=l;
  l:=aux;
End;

Procedure insertar(Var a: arbol; e:encomienda);

Var 
  aux: arbol;
Begin
  If (a=Nil) Then
    Begin
      new(aux);
      aux^.info.peso:= e.peso;
      agregarCod(aux^.info.codigos,e.codigo);
      aux^.HI := Nil;
      aux^.HD := Nil;
      a:=aux;
    End
  Else
    Begin
      If (e.peso<a^.info.peso) Then
        insertar(a^.HI, e)
      Else If (e.peso>a^.info.peso) Then
             insertar(a^.HD, e)
      Else If (e.peso=a^.info.peso) Then
             agregarCod(a^.info.codigos, e.codigo);
    End;
End;

Procedure cargarArbol(l:lista; Var a:arbol);
Begin
  While (l<>Nil) Do
    Begin
      insertar(a, l^.dato);
      l := l^.sig;
    End;
End;

Var

 l: lista;
 a:arbol;
 

begin
 Randomize;

 crearLista(l);
 writeln ('Lista de encomiendas generada: ');
 imprimirLista(l);
 a:=nil;
 cargarArbol(l,a);
 imprimirpornivel(a);;

 readln;
end.
