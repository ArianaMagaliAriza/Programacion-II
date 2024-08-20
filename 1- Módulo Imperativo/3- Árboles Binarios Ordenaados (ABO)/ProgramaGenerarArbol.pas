Program ProgramaGenerarArbol;

Type 

  // Lista de enteros
  lista = ^nodoL;
  nodoL = Record
    dato: integer;
    sig: lista;
  End;

  // Arbol de enteros
  arbol = ^nodoA;
  nodoA = Record
    dato: integer;
    HI: arbol;
    HD: arbol;
  End;

  // Lista de Arboles
  listaNivel = ^nodoN;
  nodoN = Record
    info: arbol;
    sig: listaNivel;
  End;


{-----------------------------------------------------------------------------
AgregarAdelante - Agrega nro adelante de l}
Procedure agregarAdelante(Var l: Lista; nro: integer);

Var 
  aux: lista;
Begin
  new(aux);
  aux^.dato := nro;
  aux^.sig := l;
  l := aux;
End;

Procedure insertar(Var a: arbol; nro: integer);

Var 
  aux: arbol;
Begin
  If (a=Nil) Then
    Begin
      new(aux);
      aux^.dato := nro;
      aux^.HI := Nil;
      aux^.HD := Nil;
      a := aux;
    End
  Else
    Begin
      If (nro<a^.dato) Then
        insertar(a^.HI, nro)
      Else If (nro>a^.dato) Then
             insertar(a^.HD, nro);
    End;
End;


{-----------------------------------------------------------------------------
CREARLISTA - Genera una lista con números aleatorios }
Procedure crearLista(Var l: Lista);

Var 
  n: integer;
Begin
  l := Nil;
  n := random (20);
  While (n <> 0) Do
    Begin
      agregarAdelante(L, n);
      n := random (20);
    End;
End;


{-----------------------------------------------------------------------------
IMPRIMIRLISTA - Muestra en pantalla la lista l }
Procedure imprimirLista(l: Lista);
Begin
  While (l <> Nil) Do
    Begin
      write(l^.dato, ' - ');
      l := l^.sig;
    End;
End;


{-----------------------------------------------------------------------------
CONTARELEMENTOS - Devuelve la cantidad de elementos de una lista l }

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


{-----------------------------------------------------------------------------
AGREGARATRAS - Agrega un elemento atrás en l}

Procedure AgregarAtras (Var l, ult: listaNivel; a:arbol);

Var nue: listaNivel;

Begin
  new (nue);
  nue^.info := a;
  nue^.sig := Nil;
  If l= Nil Then l := nue
  Else ult^.sig := nue;
  ult := nue;
End;


{-----------------------------------------------------------------------------
IMPRIMIRPORNIVEL - Muestra los datos del árbol a por niveles }

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
              write (l^.info^.dato, ' - ');
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

Procedure preOrden(a:arbol);
Begin
  If (a<>Nil) Then
    Begin
      write(a^.dato, ' ');
      preOrden(a^.HI);
      preOrden(a^.HD);
    End;
End;

Function Buscar2 (a: arbol; num: integer): arbol;
Begin
  If (num=a^.dato) Or (a = Nil) Then
    Buscar2 := a
  Else
    If (num>a^.dato) Then
      Buscar2 := Buscar2(a^.HD,num)
  Else
    Buscar2 := Buscar2(a^.HI,num);
End;

Function verMin(a:arbol): integer;
Begin
  If (a=Nil) Then verMin := -1
  Else
    If (a^.HI=Nil) Then
      verMin := a^.dato
  Else
    verMin := verMin(a^.HI);
End;

Function verMax(a:arbol): integer;
Begin
  If (a=Nil) Then verMax := -1
  Else
    If (a^.HD=Nil) Then
      verMax := a^.dato
  Else
    verMax := verMax(a^.HD);
End;

Procedure cargarArbol(l:lista; Var a:arbol);
Begin
  While (l<>Nil) Do
    Begin
      insertar(a, l^.dato);
      l := l^.sig;
    End;
End;

Procedure mostrarMin(a:arbol);
Begin
  If (verMin(a)<>-1) Then writeln('El menor numero es: ', verMin(a))
  Else writeln('El arbol esta vacio');
End;
Procedure mostrarMax(a:arbol);
Begin
  If (verMax(a)<>-1) Then writeln('El mayor numero es: ', verMax(a))
  Else writeln('El arbol esta vacio');
End;

Procedure verValoresEnRango(a: arbol; inf, sup:integer);
Begin
  If (a <> Nil) Then
    Begin
      If (a^.dato>= inf) Then
        If (a^.dato<= sup) Then
          Begin
            Write(a^.dato, ' ');
            verValoresEnRango(a^.hi, inf, sup);
            verValoresEnRango(a^.hd, inf, sup);
          End
      Else
        verValoresEnRango(a^.hi, inf, sup)
      Else
        verValoresEnRango(a^.hd, inf, sup);
    End;
End;

Procedure borrarElemento (Var a:arbol; dato:integer);

Var 
  aux: arbol;
Begin
  If (a<>Nil)Then
    If (a^.dato>dato)Then
      borrarElemento(a^.HI,dato)
  Else
    If (a^.dato<dato) Then
      borrarElemento(a^.HD,dato)
  Else
    If (a^.HI=Nil) Then
      Begin
        aux := a;
        a := a^.HD;
        dispose(aux);
      End
  Else
    If (a^.HD=Nil) Then
      Begin
        aux := a;
        a := a^.HI;
        dispose(aux);
      End
  Else
    Begin
      a^.dato := verMin(a^.HD);
      borrarElemento(a^.HD,a^.dato);
    End;
End;



Var 
  l: lista;
  a: arbol;
  num, inf, sup: integer;
Begin
  Randomize;
  a := Nil;
  crearLista(l);
  writeln ('Lista generada: ');
  {imprimirLista(l);}
  cargarArbol(l, a);
  imprimirpornivel(a);
  {preOrden(a);}
  Writeln;
 {writeln('Ingrese un numero a buscar: ');
  readln(num);
  If (Buscar2(a, num)<>Nil) Then writeln('El numero ', num, ' si se encuentra')
  Else writeln('El numero no se encuentra');}
  mostrarMin(a);
  mostrarMax(a);
  Write('Ingrese numero inferior del intervalo: ');
  readln(inf);
  Write('Ingrese numero superior del intervalo: ');
  readln(sup);
  verValoresEnRango(a, inf, sup);
  WriteLn;
  Write('Ingrese nodo a borrar ');
  ReadLn(num);
  borrarElemento(a, num);
  imprimirpornivel(a);
End.

