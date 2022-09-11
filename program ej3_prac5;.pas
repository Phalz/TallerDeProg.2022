program ej3_prac5;
const   
    dimf = 10;
type
    rango = 1..dimf;

    producto = record
        code:integer;
        rubro:rango;
        stock:integer;
        precio:real;
    end;

    arbol = ^hoja;

    hoja = record
        dato:productos;
        hi:arbol;
        hd:arbol;
    end;

    vector = array [rango] of arbol;

procedure inicializar_vector(var v:vector);
var 
    i:integer;
begin
    for I:=1 to dimf do begin
        v[i]:=nil;
    end;
end;

procedure armar_arbol(var a:arbol;var v:vector);
    procedure leer_productos(var p:producto);
    begin
        writeln('<--INFO DEL PRODUCTO-->');
        writeln('Codigo: ');readln(p.code);
        writeln('rubro: ');readln(p.rubro);
        writeln('stock: ');readln(p.stock);
        writeln('precio: ');readln(p.precio);
    end;

    procedure crear(a var:arbol; p:producto);
    begin
        if (a = nil) then 
            begin
                new(a);
                a^.dato:= p;
                a^.hi:= nil;
                a^.hd:= nil;
            end
            else
                if (p.code < a^.dato.code) then crear(a^.hi,p);
                    else crear(a^.hd,p);
    end;
var
    p:producto;
begin
    leer_producto(p);
    if (p.code <> 0) then begin
        crear(v[p.rubro],p);
        armar_arbol(a,v);
    end;
end;

procedure rubro_y_code(v:vector;rubro:rango;code:integer);
begin
    if (v[i] = nil) then
        writeln('no se encuentra el codigo ANAACHHUCHUUU');
    else begin
        if(v[rubro]^.dato.code = code) then 
            writeln('Se encontro');
        else begin
            if (v[rubro]^.dato.code > code) then
                rubro_y_code(v[rubro]^.hi,rubro,code);
            else
                rubro_y_code(v[rubro]^.hd,rubro,code);
        end;
    end;
end;

procedure maximo(v:vector; )
