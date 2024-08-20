
Program Ejercicio2;

Uses 
sysutils;

Type 

{ ---------- CREACION LISTAS Y ARBOL ---------- }
  pasaje = Record
    codVuelo: String;
    cantMillas: integer;
    DNI: integer;
    nombreApellido: string;
    clase: string;
  End;

  lista = ^nodoLista;
  nodoLista = Record
    dato: pasaje;
    sig: lista;
  End;
  listaP = ^nodoP;
  nodoP = Record
    dato: integer;
    sig: listaP;
  End;

  pasajero = Record
    DNI: integer;
    nombreApellido: string;
    puntaje: integer;
    listaPun: listaP;
  End;
  arbol = ^nodo;
  nodo = Record
    dato: pasajero;
    HI: arbol;
    HD: arbol;
  End;

{ ---------- CREACION LISTAS Y ARBOL ---------- }


{ ---------- CARGAR LISTA ---------- }
Procedure pregunta (Var r: pasaje);

Var 
  v : array [1..2] Of string;
  vl : array [1..26] Of Char;
Begin
  vl[1] := 'A';
  vl[2] := 'B';
  vl[3] := 'C';
  vl[4] := 'D';
  vl[5] := 'E';
  vl[6] := 'F';
  vl[7] := 'G';
  vl[8] := 'H';
  vl[9] := 'I';
  vl[10] := 'J';
  vl[11] := 'K';
  vl[12] := 'L';
  vl[13] := 'M';
  vl[14] := 'N';
  vl[15] := 'O';
  vl[16] := 'P';
  vl[17] := 'Q';
  vl[18] := 'R';
  vl[19] := 'S';
  vl[20] := 'T';
  vl[21] := 'U';
  vl[22] := 'V';
  vl[23] := 'W';
  vl[24] := 'X';
  vl[25] := 'Y';
  vl[26] := 'Z';

  r.codVuelo := Concat(vl[random(25)+1],vl[random(25)+1],IntToStr(random(3001)+
                1000));
  //Codigo de vuelo
  r.cantMillas := random(20000)+1;
  //Millas
  r.DNI := random(10)+40;
  //DNI
  r.nombreApellido := Concat('Pasajero-',IntToStr(r.DNI));
  //Nombre y Apellido
  v[1] := 'ejecutiva';
  v[2] := 'turista';
  r.clase := v[random(2)+1];
  //Clase
End;

Procedure crearLista (Var l: lista; r: pasaje);

Var 
  nue, ant, act: lista;
Begin
  new(nue);
  nue^.dato := r;
  nue^.sig := Nil;

  If (l = Nil) Then
    l := nue
  Else
    Begin
      ant := l;
      act := l;

      While (act <> Nil) And (act^.dato.codVuelo < nue^.dato.codVuelo) Do
        Begin
          ant := act;
          act := act^.sig;
        End;

      If (ant = act) Then
        l := nue
      Else
        ant^.sig := nue;
      nue^.sig := act;
    End;
End;

Procedure cargarLista (Var l: lista);

Var 
  r: pasaje;
  x: Integer;
Begin
  For x:=1 To 300 Do
    Begin
      pregunta(r);
      crearlista(l,r);
    End;
End;
{ ---------- CARGAR LISTA ---------- }


{ ---------- IMPRIMIR LISTA ---------- }
Procedure imprimir(r: pasaje);
Begin
  With r Do
    writeln('Cod. Vuelo: ',codVuelo,' | Millas: ',cantMillas,' | DNI: ',DNI,
            ' | Nombre y Apellido: ',nombreApellido,' | Clase: ',clase);
End;

Procedure imprimirLista(l: lista);
Begin
  While (l <> Nil) Do
    Begin
      imprimir(l^.dato);
      l := l^.sig;
    End;
End;
{ ---------- IMPRIMIR LISTA ---------- }


{ ---------- CREAR ARBOL ---------- }
Procedure agregarAdeante(Var l:listaP;p:integer);

Var 
  nue: listaP;
Begin
  new(nue);
  nue^.dato := p;
  nue^.sig := l;
  l := nue;
End;

Function calcularPuntaje(p:pasaje): integer;

Var 
  aux: integer;
Begin
  If (p.clase='ejecutiva')Then aux := p.cantMillas*100
  Else aux := p.cantMillas*25;
  calcularPuntaje := aux;
End;

Procedure insertar(Var a:arbol;p:pasaje);

Var 
  aux: arbol;
Begin
  If (a=Nil)Then
    Begin
      new(aux);
      aux^.dato.DNI := p.DNI;
      aux^.dato.nombreApellido := p.nombreApellido;
      aux^.dato.puntaje := calcularPuntaje(p);
      aux^.dato.listaPun := Nil;
      agregarAdeante(aux^.dato.listaPun,calcularPuntaje(p));
      aux^.sig := a;
    End
  Else
    If (a^.DNI > p.DNI)Then
      insertar(a^.HI, p);
  Else
    If (a^.DNI < p.DNI)Then
      insertar(a^.HD, p);
  Else
    If (a^.DNI = p.DNI)Then
      a^.dato.puntaje := a^.dato.puntaje+calcularPuntaje(p);
  agregarAdeante(a^.dato.listaPun,calcularPuntaje(p));
End;
{ ---------- CREAR ARBOL ---------- }

{ ---------- CALCULAR MAYOR PUNTAJE TOTAL ---------- }
Function maxPuntaje(a:arbol): integer;

Var 
  max: integer;
Begin
  max := -1;
  If (a<>Nil)Then
    Begin
      If (a^.dato.puntaje>max)Then max := a^.dato.puntaje;
      maxPuntaje(a^.HI);
      maxPuntaje(a^.HD);
      writeln(max);
      If (maxPuntaje(a)>max)Then max := maxPuntaje(a);
    End;
  maxPuntaje := max;
End;
{ ---------- CALCULAR MAYOR PUNTAJE TOTAL ---------- }

{ ---------- CALCULAR MAYOR PUNTAJE ---------- }
Procedure calcularMayor(p:pasajero;Var max:integer);
Begin
  While (p.listaPun<>Nil) Do
    Begin
      If (p.listaPun.dato>max) Then max := p.listaPun.dato;
      p.listaPun := p.listaPun^.sig;
    End;
  writeln('el puntaje maximo del pasajero',p.DNI,' es: ',max);
End;
Procedure busquedaAcotada(a: arbol; inf, sup:integer);

Var max: integer;
Begin
  max := -1;
  If (a <> Nil) Then
    Begin
      If (a^.dato.dni >= inf) Then
        If (a^.dato.dni <= sup) Then
          Begin
            calcularMayor(a^.dato,max);
            max := -1;
            busquedaAcotada(a^.hi, inf, sup);
            busquedaAcotada (a^.hd, inf, sup);
          End
      Else
        busquedaAcotada(a^.hi, inf, sup)
      Else
        busquedaAcotada(a^.hd, inf, sup);
    End;
End;
{ ---------- CALCULAR MAYOR PUNTAJE ---------- }

Var 
  l: lista;
  lp: listaP;
  a: arbol;
Begin
  Randomize;
  a := Nil;
  l := Nil;
  cargarLista(l);
  aux := l;
  writeln('------- IMPRIMIR LISTA -------');
  imprimirLista(l);
  While (aux<>Nil) Do
    Begin
      insertar(a,l^.dato);
      l := l^.sig;
    End;
  writeln('EL MAYOR PUNTAJE TOTAL ES ',maxPuntaje(a));
  busquedaAcotada(a,20,25);
  writeln();

End.
{ ---------- PROGRAMA PRINCIPAL ---------- }
