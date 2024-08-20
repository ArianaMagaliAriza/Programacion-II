program Recursion;

var 
  num, maximo: integer;

{procedure digitoMaximo(n: integer; max: integer);NOTA: OJO, LOS DIGITOSVAN DE DERECHA A IZQUIERDA
var
  dig: integer;
begin
  dig:= n mod 10;
  if ( dig > max ) then
    max:= dig;
  n:= n div 10;
  if (n <> 0) then
    digitoMaximo(n, max);
  writeln('max: ',max);
end;}

function digitoMaximo(n: integer; max: integer):integer;
var
  dig: integer;
begin
  dig:= n mod 10;
  if ( dig > max ) then
    max:= dig;
  n:= n div 10;
  if (n <> 0) then
    digitoMaximo:=digitoMaximo(n, max);
  writeln('max: ',max);
end;

Begin
  maximo := -1;
  writeln( 'Ingrese un entero no negativo:');
  readln (num);
  writeln ( 'El digito maximo del numero ', num, ' es: ', digitoMaximo (num, maximo));
  readln;
End.

