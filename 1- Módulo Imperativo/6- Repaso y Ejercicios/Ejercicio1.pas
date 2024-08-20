
Program ejercicio1;

Uses sysutils;

Type 
  str10 = string[10];
  jugador = Record
    dni: longint;
    nombreApellido: string;
    posicion: str10;
    puntaje: integer;
  End;

  lista = ^nodoLista;
  nodoLista = Record
    dato: jugador;
    sig: lista;
  End;

  partido = Record
    estadio: string;
    equipoLocal: string;
    equipoVisitante: string;
    fecha: str10;
    jugadores: lista;
  End;

  listaPartidos = ^nodoPartido;
  nodoPartido = Record
    dato: partido;
    sig: listaPartidos;
  End;

  Puntajes = ^nodoP;
  nodoP = Record
    fecha: str10;
    puntaje: Integer;
    sig: Puntajes;
  End;
  arbol = ^nodoA;
  nodoA = Record
    dato: jugador;
    p: Puntajes;
    HI: arbol;
    HD: arbol;
  End;
  listaNivel = ^nodoN;
  nodoN = Record
    info: arbol;
    sig: listaNivel;
  End;


Procedure cargarFecha(Var s: str10);

Var 
  dia, mes: integer;
Begin
  dia := random(30)+1;
  mes := random(12)+1;
  If (mes = 2) And (dia > 28)Then
    dia := 31;
  If ((mes = 4) Or (mes = 6) Or (mes =9) Or (mes = 11)) And (dia = 31)Then
    dia := 30;
  s := Concat('2022/',IntToStr(mes),'/',IntToStr(dia));
End;

Procedure agregar(Var l: listaPartidos; p: partido);

Var 
  aux: listaPartidos;
Begin
  new(aux);
  aux^.dato := p;
  aux^.sig := l;
  l := aux;
End;

Procedure agregarJugador(Var l: lista; j: jugador);

Var 
  aux: lista;
Begin
  new(aux);
  aux^.dato := j;
  aux^.sig := l;
  l := aux;
End;

Procedure cargarJugadores(Var l: lista);

Var 
  j: jugador;
  cant, i, pos: integer;
Begin
  cant := random(10)+22;
  For i:=1 To cant Do
    Begin
      With (j) Do
        Begin
          dni := random(20)+30;
          nombreApellido := Concat('Jugador ', IntToStr(dni));
          pos := random(4)+1;
          Case pos Of 
            1: posicion := 'arquero';
            2: posicion := 'defensa';
            3: posicion := 'mediocampo';
            4: posicion := 'delantero';
          End;
          puntaje := random(10)+1;
        End;
      agregarJugador(l, j);
    End;
End;

Procedure crearLista(Var l: listaPartidos);

Var 
  p: partido;
  cant, i: integer;
Begin
  cant := random(10);
  For i:=1 To cant Do
    Begin
      With (p) Do
        Begin
          estadio := Concat('Estadio-', IntToStr(random (500)+1));
          equipoLocal := Concat('Equipo-', IntToStr(random (200)+1));
          equipoVisitante := Concat('Equipo-', IntToStr(random (200)+1));
          cargarFecha(fecha);
          jugadores := Nil;
          cargarJugadores(jugadores);
        End;
      agregar(l, p);
    End;
End;

Procedure imprimirJugador(j: jugador);
Begin
  With (j) Do
    Begin
      writeln('Jugador: ', nombreApellido, ' con dni ',dni, ' en posicion: ',
              posicion, ' y puntaje: ', puntaje);
    End;
End;

Procedure imprimirJugadores(l: lista);
Begin
  While (l <> Nil) Do
    Begin
      imprimirJugador(l^.dato);
      l := l^.sig;
    End;
End;

Procedure imprimir(p: partido);
Begin
  With (p) Do
    Begin
      writeln('');
      writeln('Partido en el ', estadio, ' entre ',equipoLocal, ' y ',
              equipoVisitante, ' jugado el: ', fecha,
              ' por los siguientes jugadores: ');
      imprimirJugadores(jugadores);
    End;
End;

Procedure imprimirLista(l: listaPartidos);
Begin
  While (l <> Nil) Do
    Begin
      imprimir(l^.dato);
      l := l^.sig;
    End;
End;

Procedure agregarPuntaje(Var lp:puntajes;p:partido);

Var 
  aux: Puntajes;
Begin
  new(aux);
  aux^.fecha := p.fecha;
  aux^.puntaje := p.jugadores^.dato.puntaje;
  aux^.sig := lp;
  lp := aux;
End;

Procedure insertar(Var a: arbol; p:partido);

Var 
  aux: arbol;
Begin
  If (a=Nil) Then
    Begin
      new(aux);
      aux^.dato := p.jugadores^.dato;
      aux^.p := Nil;
      agregarPuntaje(aux^.p,p);
      aux^.HI := Nil;
      aux^.HD := Nil;
      a := aux;
    End
  Else
    Begin
      If (p.jugadores^.dato.dni<a^.dato.dni) Then
        insertar(a^.HI, p)
      Else If (p.jugadores^.dato.dni>a^.dato.dni) Then
             insertar(a^.HD, p)
      Else If (p.jugadores^.dato.dni=a^.dato.dni) Then
             Begin
               agregarPuntaje(a^.p,p);
             End;
    End;
End;

Procedure impPuntajes(a:arbol);
Begin
  writeln('El jugador ', a^.dato.nombreApellido,
          ' en la posicion ', a^.dato.posicion, ' tiene los siguientes puntajes'
  );
  While (a^.p<>Nil) Do
    Begin
      writeln('En la fecha ', a^.p^.fecha,' tuvo ', a^.p^.puntaje, ' ');
      a^.p := a^.p^.sig;
    End;
End;

Procedure impTotalPuntajes(a:arbol);

Var total: Integer;
Begin
  total := 0;
  While (a^.p<>Nil) Do
    Begin
      total := total+a^.p^.puntaje;
      a^.p := a^.p^.sig;
    End;
  writeln('El jugador ', a^.dato.nombreApellido,' suma un puntaje de ', total);
End;

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
          writeln ('Nivel ', nivel, ': ');
          For i:= 1 To cant Do
            Begin
              impPuntajes(l^.info);
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

Function busquedaAcotada(a: arbol; inf, sup:integer): Integer;

Var cont: integer;
Begin
  cont := 0;
  If (a <> Nil) Then
    Begin
      If (a^.dato.dni >= inf) Then
        If (a^.dato.dni <= sup) Then
          Begin
            cont := cont+1;
            cont := cont+busquedaAcotada(a^.hi, inf, sup);
            cont := cont+busquedaAcotada (a^.hd, inf, sup);
          End
      Else
        cont := cont+busquedaAcotada(a^.hi, inf, sup)
      Else
        cont := cont+busquedaAcotada(a^.hd, inf, sup);
    End;
  busquedaAcotada := cont;
End;

Function PosicionJ(a:arbol; pos:str10): integer;

Var cont: integer;
Begin
  cont := 0;
  If (a<>Nil) Then
    Begin
      If (a^.dato.posicion=pos) Then
        Begin
          cont := cont+1;
          cont := cont+PosicionJ(a^.HI, pos);
          cont := cont+PosicionJ(a^.HD, pos);
        End
      Else
        Begin
          cont := cont+PosicionJ(a^.HI, pos);
          cont := cont+PosicionJ(a^.HD, pos);
        End;


{Else If (a^.dato.posicion<pos) Then cont := cont+PosicionJ(a^.HI, pos)
      Else If (a^.dato.posicion>pos) Then cont := cont+PosicionJ(a^.HD, pos);}
    End;
  PosicionJ := cont;
End;


Var 
  l: listaPartidos;
  a: arbol;
  pos: str10;
Begin
  Randomize;

  l := Nil;
  crearLista(l); {carga automática de la estructura disponible}
  writeln ('Lista generada: ');
  imprimirLista(l);
  {Completar el programa}
  a := Nil;
  While (l<>Nil) Do
    Begin
      While (l<>Nil) And (l^.dato.jugadores<>Nil) Do
        Begin
          insertar(a, l^.dato);
          l^.dato.jugadores := l^.dato.jugadores^.sig;
        End;
      l := l^.sig;
    End;

  imprimirpornivel(a);
  writeln('La cantidad de jugadores entre 40 y 45 es: ', busquedaAcotada(a, 40,
          45));
  write('Ingrese la posicion: ');
  readln(pos);
  writeln('La posicion ', pos, ' tiene ', PosicionJ(a, pos), ' jugadores');
  writeln('Fin del programa');
  readln;
End.
