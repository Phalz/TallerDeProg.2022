program ej2_prac5;
const
    dimf = 2018;
type
    rango = 2010..2018;

    auto = record
        patente: integer;
        ano:rango;
        marca:string;
        modelo:string;
    end;

    arbol = ^nodo;

    nodo = record
        dato: auto;
        hi:arbol;
        hd:arbol;
    end;

    lista = ^nodo2;

    nodo2 = record
        dato: auto;
        sig: lista;
    end;

    vector = array [rango] of lista;

procedure armar_arbol(var a:arbol);
    procedure leer_auto(var a:auto);
    begin
      writeln('<---INFO DEL AUTO--->');
      writeln('>>>Patente: ');readln(a.patente);
      writeln('>>>ano: ');readln(a.ano);
      writeln('>>>marca: ');readln(a.marca);
      writeln('>>>modelo: ');readln(a.modelo);
    end;

    procedure crear(var a:arbol;u:auto);
    begin
        if (a = nil) then begin
            new(a);
            a^.dato:=u;
            a^.hi:=nil;
            a^.hd:=nil;
        end
        else 
            if(u.patente < a^.dato.patente) then crear(a^.hi,u)
            else crear(a^.hd,u);
    end;

var 
    u:auto;
begin
    leer_auto(u);
    if (u.patente <> -1) then begin
        crear(a,u);
        armar_arbol(a);
    end;
end;

procedure buscar_marca(a:arbol;marca:string;var total:integer);
begin
    if (a = nil) then writeln('el auto no es de esta marca')
    else begin
        if (a^.dato.marca = marca) then 
            total:= total + 1;
    buscar_marca(a^.hi,marca,total);
    buscar_marca(a^.hd,marca,total);
	end;
end;

procedure inicializar_vec(var v:vector);
var
    i:integer;
begin
    for i:=2010 to dimf do begin
        v[i]:=nil;
    end;
end;

procedure armarnodo(var v:vector; a:arbol);
    procedure nodo_ordenado(var l:lista; a:auto);
    var
        act,ant,aux:lista;
    begin
        new(aux);
        aux^.dato := a;
        act:= l;
        ant:= l;
        while (act <> nil) and (act^.dato.patente < a.patente) do begin
            ant:=act;
            act:=act^.sig;
        end;
        if (ant = act) then begin
            l:=aux;
        end
        else
            ant^.sig:=aux;
        aux^.sig:=act;
    end;

begin
    if (a <> nil) then begin    
        nodo_ordenado(v[a^.dato.ano],a^.dato);
        armarnodo(v,a);
    end;
end;

procedure buscar_patente(a:arbol;p:integer);
begin
    if (a = nil) then
        writeln('el valor no se encuentra en el arbol')
    else begin
        if (a^.dato.patente = p) then 
            writeln('ano: ',a^.dato.ano)
        else begin
            if (a^.dato.patente > p) then 
                buscar_patente(a^.hi,p)
            else
                buscar_patente(a^.hd,p);
        end;
    end;
end;

var 
    v:vector;
    a:arbol;
    marca:string;
    patente:integer;
    total:integer;
begin
	total:=0;
    inicializar_vec(v);
    armar_arbol(a);
    writeln('--Ingrese una marca a buscar--');readln(marca);
    buscar_marca(a,marca,total);
    writeln('Total de autos de esta marca: ',total);
    writeln('--Ingrese una patente a buscar--');readln(patente);
    buscar_patente(a,patente);
end.
