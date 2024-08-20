Program twitter;{}
Uses
     sysutils;
Type
     tweet = record
	      codigoUsuario: integer;
	      nombreUsuario: string;
	      mensaje: string;
	      esRetweet: boolean;
     end;

     listaTweets = ^nodoLista;
     nodoLista = record
               dato: tweet;
               sig: listaTweets;
     end;
     
     usuario=record
              codigo:integer;
              nombre:string;
             end;
             
     arbol=^nodoArbol;
     nodoArbol=record
                info:usuario;
                cantTweets:integer;
                HI:arbol;
                HD:arbol;
               end;
     {Completar agregando aquí las estructuras de datos necesarias en el ejercicio}

{agregarAdelante - Agrega nro adelante de l}
Procedure agregarAdelante(var l: listaTweets; t: tweet);
var
   aux: listaTweets;
begin
     new(aux);
     aux^.dato := t;
     aux^.sig := l;
     l:= aux;
end;



{crearLista - Genera una lista con tweets aleatorios}
procedure crearLista(var l: listaTweets);
var
   t: tweet;
   texto: string;
begin
     t.codigoUsuario := random(2000);
     while (t.codigoUsuario <> 0) do Begin
          texto:= Concat(IntToStr(t.codigoUsuario), '-mensaje-', IntToStr(random (200)));
          t.nombreUsuario := Concat('Usuario-',IntToStr(t.codigoUsuario));
          t.mensaje := texto;
          t.esRetweet := (random(2)=0);
          agregarAdelante(l, t);
          t.codigoUsuario := random(2000);
     end;
end;


{imprimir - Muestra en pantalla el tweet}
procedure imprimir(t: tweet);
begin
     with (t) do begin
          write('Tweet del usuario @', nombreUsuario, ' con codigo ',codigoUsuario, ': ', mensaje, ' RT:');
          if(esRetweet)then
               writeln(' Si')
          else
               writeln('No ');
     end;
end;


{imprimirLista - Muestra en pantalla la lista l}
procedure imprimirLista(l: listaTweets);
begin
     while (l <> nil) do begin
          imprimir(l^.dato);
          l:= l^.sig;
     end;
end;

Procedure insertar(Var a: arbol;t:tweet);

Var 
  aux: arbol;
Begin
  If (a=Nil) Then
    Begin
      new(aux);
      aux^.info.codigo:= t.codigoUsuario;
      aux^.info.nombre:= t.nombreUsuario;
      aux^.cantTweets:=1;
      aux^.HI := Nil;
      aux^.HD := Nil;
      a := aux;
    End
  Else
    Begin
      If (t.codigoUsuario<a^.info.codigo) Then
        insertar(a^.HI, t)
      Else If (t.codigoUsuario>a^.info.codigo) Then
             insertar(a^.HD, t)
      Else If (t.codigoUsuario=a^.info.codigo) Then
             Begin
               a^.cantTweets:=a^.cantTweets+1;
             End;
    End;
End;

procedure cargarArbol(l:listaTweets;var a:arbol);
begin
  while(l<>nil)do begin
       insertar(a, l^.dato);
       l:=l^.sig;
     end;
end;

procedure recorridoAcotado(a: arbol; inf:integer; sup:integer);
Begin
  If (a <> Nil) Then
    If (a^.info.codigo >= inf) Then
      If (a^.info.codigo <= sup) Then
        Begin
          writeln('El ',a^.info.nombre,' tiene ',a^.cantTweets,' tweets');
          recorridoAcotado(a^.hi, inf, sup);
          recorridoAcotado (a^.hd, inf, sup);
        End
  Else
    recorridoAcotado(a^.hi, inf, sup)
  Else
    recorridoAcotado(a^.hd, inf, sup);
End;

Procedure mayorCantTweet(a:arbol; Var max:Integer; Var nombre:string);
Begin
  If (a<>Nil) Then
    Begin
      If (a^.cantTweets>max) Then
        Begin
          max := a^.cantTweets;
          nombre:= a^.info.nombre;
          mayorCantTweet(a^.HI, max, nombre);
          mayorCantTweet(a^.HD, max, nombre);
        End
      Else
        Begin
          mayorCantTweet(a^.HI, max, nombre);
          mayorCantTweet(a^.HD, max, nombre)
        End;
    End;
End;


var
   l: listaTweets;
   a:arbol;
   nombre:string;
   max:integer;
begin
     Randomize;

     l:= nil;
     a:=nil;
     crearLista(l);
     writeln ('Lista generada: ');
     imprimirLista(l);
     cargarArbol(l,a);
     recorridoAcotado(a,100,700);
     mayorCantTweet(a,max,nombre);
     writeln('El usuario con mayor cantidad de tweets es ',nombre);
     {Completar el programa}

     writeln('Fin del programa');
     readln;
end.

