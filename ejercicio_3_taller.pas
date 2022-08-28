program ejercicio_3_taller;
const
    dimf = 7;
type
    rango = 1..dimf;

    mayor = array [rango] of integer;

    peliculas = record
        codigo: integer;
        genero: integer;
        puntaje: integer;
    end;

    lista = ^nodo;

    nodo = record
        dato: peliculas;
        sig: lista;
    end;

procedure inicializarvector(var v:mayor);
var
    i:integer;
begin
    for i:=1  to dimf do begin
        v[i]:=0;
    end;
end;

procedure leerpeli(var p:peliculas);
begin   
    writeln('-Ingrese el codigo de la pelicula: ');readln(p.codigo);
    writeln('-Ingrese el genero de la pelicula: ');readln(p.genero);
    writeln('-Ingrese el puntaje de la pelicula: ');readln(p.puntaje);
    writeln('-Se registro todo nashe-');
end;

procedure armarnodo(var l:lista; peli:peliculas);
var
    nue:lista;
    act,ant:lista;
begin
    new(nue);
    nue^.dato:=peli;
    act:=l;
    ant:=l;
    while (act <> nil) and (peli.genero < act^.dato.genero) do begin
        ant:=act;
        act:=act^.sig;
    end;
    if (act = ant) then begin
      l:=nue;
    end
    else 
        ant^.sig := nue;
    nue^.sig := act;
end;

procedure armarlista (var l:lista);
var
    p:peliculas;
begin
    leerpeli(p);
    while (p.codigo <> -1) do begin
        armarnodo(l,p);
        leerpeli(p);
    end;
end;

{parte 2}

procedure leerlista (l:lista; var v:vector);
var
    aux:lista;
    mayor,codemayor,i: integer;
begin
    aux:=l;
    ant:=l;
    for i:=1 to dimf do begin
        mayor:= -1;
        codemayor:= 0;
        while (aux <> nil) and (aux <> i) do begin
        aux:=aux^.sig;
        end;
        while (aux <> nil)  and (aux = i ) do begin
            if (aux^.dato.puntaje > mayor) then begin
                mayor := aux^.dato.puntaje;
                codemayor:=  aux^.dato.coigo;
            aux:= aux^.sig
        end;
        end;
        v[i]:= codemayor;
    end;
end;

{parte 3}

procedure ordenar(var v:vector);
var 
    i,j,p:dimf;
    item:integer;
begin
    for i:=1 to dimf-1 do begin
        p:=i;
        for j:= i+1 to dimf do
          if v[j] < v[p] then p:=j;
        item := v[p];
        v[p]:=v[i];
        v[i]:=item;
    end;
end;

{parte 4}

procedure leervector (v:vector;l:lista);
var
    mayor,menor,codemayor,codemenor,i:integer;
    aux:lista;
begin
    mayor:= -1;
    menor:= 9999;
    codemayor:=0;
    codemenor:=0;
    aux:=l;
    for i:=1 to dimf do begin
        while (aux <> nil) and (aux^.dato.codigo <> v[i]) do begin
          aux:=aux^.sig
        end;
        if (aux^.dato.puntaje > mayor) then begin
            menor:= mayor;
            codemenor := codemayor;
            codemayor := aux^.dato.codigo;
            mayor:= aux^.dato.puntaje;
        end
        else
            if (aux^.dato.puntaje < menor) then begin
              menor:= aux^.dato.puntaje;
              codemenor:= aux^.dato.codigo;
            end;
    end;
    writeln('la pelicula con mayor puntaje fue: ', codemayor, 'y la pelicula con menor puntaje fue: ', codemenor);
end;

var
    l:lista;
    v:vector;
begin
    l:=nil;
    inicializarvector(v);
    armarlista(l);
    leerlista(l,v);
    ordenar(v);
    leervector(v,l);
end.

