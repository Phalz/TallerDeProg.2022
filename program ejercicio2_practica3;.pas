program ejercicio2_practica3;
type
    venta = record
        code:integer;
        fecha:integer;
        cant:integer;
    end;

    producto = record
        code:integer;
        cant:integer;
    end;

    arbol = ^nodo;

    segundo = ^2nodo;

    2nodo = record
        dato:producto;
        hi:segundo;
        hd:segundo;
    end;

    nodo = record
        dato:venta;
        hi:arbol;
        hd:arbol;
    end;

procedure cargararbol(var abb:arbol)
    procedure leerventa(var v:venta);
        begin
            writeln('-Code: ');readln(p.code);
            writeln('-fecha: ');readln(p.fecha);
            writeln('-cant: ');readln(p.cant);
        end;  
    procedure armararbol(var a:arbol;v:venta);
    begin
        if (a = nil) then begin
            new(a);
            a^.dato:=v; a^.hi:= nil;a^.hd:= nil;
        end
        else    
            if(v.code < a^.dato.code) then armararbol(a^.hi,v);
            else armararbol(a^.hd,num)
    end;
var
    v:venta;
begin
    leerventa(v);
    while(v.code<>0)do begin
        armararbol(abb,v);
        leerventa(v);
    end;
end;

procedure imprimir(a:arbol);
begin
    if (a <> nil) do begin
        imprimir(a^.hi);
        writeln(a.dato);
        imprimir(a^.hd);
    end;
end;

procedure cargarsegundo(var s:segundo;a:arbol);
    procedure contar(a:arbol;var t:integer;aux:segundo);
    begin
        
end;