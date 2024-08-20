program CalculoDePotencia;



{PROGRAMA PRINCIPAL}

function potencia1(x,n:integer):integer;

begin

  if(n=0)then potencia1:=1
  else
     potencia1:= x*potencia1(x,n-1);

end;

var
   n, x: integer;

begin

     write ('Ingrese base: ');
     Readln (x);
     write ('Ingrese exponente: ');
     Readln (n);
     writeln(potencia1(x,n));

     readln;
end.
