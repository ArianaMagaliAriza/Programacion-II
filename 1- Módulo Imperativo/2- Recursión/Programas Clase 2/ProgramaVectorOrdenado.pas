program VectorOrdenado;

const
    dimF = 8;  {Dimensión física del vector}

type

    vector = array [1..dimF] of integer;

    dim = 0..dimF;

{-----------------------------------------------------------------------------
CARGARVECTORORDENADO - Carga ordenadamente nros aleatorios entre 0 y 100 en el
vector hasta que llegue el nro 99 o hasta que se complete el vector}

Procedure cargarVectorOrdenado ( var vec: vector; var dimL: dim);
var
   d, pos, j: integer;
begin
    Randomize;  { Inicializa la secuencia de random a partir de una semilla}
    dimL := 0;
    d:= random(100);
    while (d <> 99)  and ( dimL < dimF ) do begin
       pos:= 1;
       while (pos <= dimL) and (vec[pos]< d) do pos:= pos + 1;
       for  j:= dimL downto pos do vec[j+1]:= vec[j] ;
       vec[pos]:= d;
       dimL := dimL + 1;
       d:= random(100)
     end;
end;

{-----------------------------------------------------------------------------
IMPRIMIRVECTOR - Imprime todos los nros del vector }

Procedure imprimirVector ( var vec: vector; var dimL: dim );
var
   i: dim;
begin
     for i:= 1 to dimL do
         write ('-----');
     writeln;
     write (' ');
     for i:= 1 to dimL do begin
        if(vec[i] < 9)then
            write ('0');
        write(vec[i], ' | ');
     end;
     writeln;
     for i:= 1 to dimL do
         write ('-----');
     writeln;
     writeln;
End;

{procedure buscar(v:vector; var dimL: dim; var num:integer);
var
  i:integer;
  es_pri:boolean;
begin
  es_pri:=true;
  if (dimL=0)then writeln('el vector esta vacio')
  else 
    if(es_pri)then i:=dimL div 2;
    if(num=v[i])then writeln('el numero esta en la pos: ',i)
    else if(num<v[i])then begin
          dimL:=i;
          buscar(v,dimL,num);
        end
        else if(num>v[i])then begin
          es_pri:=false;
          i:=(i-dimL)+100;
          buscar(v,dimL,num);
        end;
end;}
function busqueda(v: vector; ini, fin, dato: integer): integer;  //Devuelve la posicion
var
   central: integer;
begin
    if(fin=0) or (fin<ini)then busqueda:=0
    else begin
      central:= (ini + fin) div 2;
      if (dato = v[central]) then
          busqueda:= central
      else
        if (dato < v[central]) then
            busqueda:= busqueda(v,ini,central-1,dato)
        else
          if (dato > v[central]) then
            busqueda:= busqueda(v,central+1,fin,dato);
    end;
end;

{PROGRAMA PRINCIPAL}
var
   v: vector;
   dimL : dim;
   num:integer;
begin

     cargarVectorOrdenado(v,dimL);

     writeln('Nros almacenados: ');
     imprimirVector(v, dimL);
     writeln('ingrese un numero:');
     readln(num);
     if(busqueda(v, 1, diml, num)=0) then
       writeln('No se encontro el numero en el vector')
     else
       writeln('El numero se encuentra en la posicion: ', busqueda(v, 1, diml, num));
     readln;
end.
