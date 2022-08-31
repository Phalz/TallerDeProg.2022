{2.- Realizar un programa que lea números hasta leer el valor 0 e imprima, para cada número leído,
 sus dígitos en el orden en que aparecen en el número. Debe implementarse un módulo recursivo que reciba el número e imprima lo pedido. 
 Ejemplo si se lee el valor 256, se debe imprimir 2  5  6
}
program clase2-ejercicio2;
type
    lista = ^nodo;

    nodo = record
        dato:integer;
        sig:lista;
    end;

procedure armarnodo(var l:lista;n:integer);
var
    aux:lista;
begin
  new(aux);
  aux^.dato:= n;
  aux^.sig:= l;
  l:=aux;
end;

procedure armarlista (var l:lista);
var
    n:integer;
begin
    writeln('ingrese un numero: ');readln(n);
    while(n <> 0) do begin
        armarnodo(l,n);
        writeln('ingrese un numero: ');readln(n);
    end;
end;

procedure separarendigitos(var n:integer);
var
    dig:integer;
begin
    if (n <> 0) do begin
        dig:= n mod 10;
        writeln(dig);
        n:= n div 10;
        separarendigitos(n);
    end;
end;

procedure imprimir(l:lista);
begin
    if (l <> nil) then begin
        separarendigitos(l^.dato);
        l:=l^.sig;
        imprimir(l);
    end;
end;

var
    l:lista;
begin
    l:=nil;
    armarlista(l);
    imprimir(l);
end;
