program ejercicio3_practica1;
const
    dimf = 8;
type
    rango = 1..dimf;

    pelicula = record;
        code:integer;
        genero:rango;
        puntaje:real;
    end;

    segundodato = record;
        code:integer;
        puntaje:real;
    end;
    lista = ^nodo;

    nodo = record
        dato:pelicula;
        sig:lista;
    end;

    vec = array[rango] of lista;

    pun = array [rango] of segundodato;

procedure inicializarvector(var v:vec);
var
    i:integer;
begin
  for i:=1 to dimf do begin
    v[i].dato.code:=0;
    v[i].dato.genero:=i;
    v[i].dato.puntaje:=0;
    v[i].sig:=nil;
end;

procedure leerpeli(var p:pelicula);
begin
    writeln('--Ingrese codigo, genero y puntaje--');
    readln(p.code);
    readln(p.genero);
    readln(p.puntaje);
end;

procedure armarnodo(var l:lista;p:pelicula);
var
    aux:lista;
begin
    new(a);
    aux^.dato:=p;
    aux^.sig:=l;
    l:=aux;
end;

procedure armandolista(var l:lista);
var
    p:pelicula;
begin
    leerpeli(p);
    if (p.code <> 0) then begin
        armarnodo(l,p);
        armandolista(l);
    end;
end;

procedure organizarenvector(var v:vec;var l:lista);
var
    i:integer;
begin
    for i:=1 to dimf do begin
        while (l <> nil) and (l^.dato.genero = i); 
            armandolista(l);
        end;
    end;
end;

procedure maximo(var pmax:real;var cmax:integer;code:integer;puntaje1:real);
begin
    if (puntaje > pmax) then begin
        pmax := puntaje1;
        cmax:= code;
    end;
end;

procedure recorrolista(v:vec;var p:pun);
var
    i,cmax:integer;
    aux:lista;
    pmax:real;
begin
    for i:=1 to dimf do begin
        aux:= v[i];
        cmax:=0;
        pmax:=0;
        while (aux <> nil) do begin
            maximo(pmax,cmax,aux^.dato.code;aux^.dato.puntaje);
            aux:=aux.sig;
        end;
        p[i].code:=cmax;
        p[i].puntaje:pmax;
    end;
end;

procedure insercion(var p:pun;dimf:rango);
var
    i,j:integer;
    item:pelicula;
begin
    for i:=1 to diml do begin
        actual:=p[i];
        j:=i-1;
        while (j > 0) and (v[j].puntaje > item.puntaje) do begin
            v[j+1]:=v[j];
            j:=j-1;
        end;
        v[j-1]:=item;
    end;
end;

procedure imprimir(p:pun);
begin
    writeln('la pelicula con mayor puntaje fue: ');readln(p[1]);
    writeln('la pelicula con menor puntaje fue: ');readln(p[dimf]);
end;

var
    p:pun;
    v:vec;
    l:lista;
begin
    l:=nil;
    inicializarvector(v);
    organizarenvector(v,l);
    recorrolista(v,p);
    insercion(p);
    imprimir(p);


    

        
    

