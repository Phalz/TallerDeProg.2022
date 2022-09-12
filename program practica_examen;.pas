program practica_examen;
type 
    rango = 1..31;

    registro = record
        codcliente:integer;
        dia:rango;
        cant:integer;
        monto:real;
    end;
    
     lista = ^nodo;

    nodo = record
        dato:registro;
        sig:lista;
    end;
    
     cliente = record
        code:integer;
        compras:lista;
    end;

    arbol = ^hoja;

    hoja = record
        dato:cliente;
        hi:arbol;
        hd:arbol;
    end;


procedure armar_lista(var l:lista);
    procedure leer_registro(var r:registro);
    begin
        writeln('<<<COMPRA>>>');
        writeln('cod cliente: ');readln(r.codcliente);
        writeln('dia: ');readln(r.dia);
        writeln('cant: ');readln(r.cant);
        writeln('monto: ');readln(r.monto);
        writeln('<<<<<<<<>>>>>>>>');
    end;
    
    procedure atras(var l,ult:lista;r:registro);
    var
        aux:lista;
    begin
        new(aux);
        aux^.dato:=r;
        aux^.sig:=l;
        l:=aux;
     end;
    
var
    r:registro;
    ult:lista;
begin
    leer_registro(r);
	if (r.cant <> -1) then begin
		atras(l,ult,r);
		armar_lista(l);
	end;
end;


procedure armar_arbol(var a:arbol);
    procedure leer_cliente(var c:cliente);
    begin
      writeln('Ingrese info del cliente');
      writeln('codigo: ');readln(c.code);
      armar_lista(c.compras);
    end;

    procedure generar(var a:arbol;c:cliente);
    begin
        if (a = nil) then begin
            new(a);
            a^.dato:=c; a^.hi:=nil; a^.hd:=nil;
        end
        else
            if (c.code < a^.dato.code) then generar(a^.hi,c)
            else
                generar(a^.hd,c);
    end;
var
    c:cliente;
begin
    leer_cliente(c);
    if (c.code <> -1) then begin
        generar(a,c);
        armar_arbol(a);
    end;
end;

//punto B
procedure imprimir_compras(l:lista);
begin
    while (l <> nil) do begin
        writeln(l^.dato.dia);
        writeln(l^.dato.cant);
        writeln(l^.dato.monto);
        l:=l^.sig;
    end;
end;

function busqueda_de_arbol(a:arbol;code:integer):lista;
begin
    if (a^.dato.code = code) then begin
        Writeln('Encontrado');
        imprimir_compras(a^.dato.compras);
        busqueda_de_arbol:= a^.dato.compras;
    end
    else begin
        if (code < a^.dato.code) then
            busqueda_de_arbol:=busqueda_de_arbol(a^.hi,code)
        else
            busqueda_de_arbol:=busqueda_de_arbol(a^.hd,code);
    end;
end;

//punto c
function total(l:lista;max:integer;monto:real):real;
begin
    if (l <> nil) then begin
        if (l^.dato.cant > max) then begin
            max:= l^.dato.cant;
            monto:= l^.dato.monto;
        end;
        total:= total(l^.sig,max,monto);
    end
    else total:= monto;
end;

var
    a:arbol;
    max:integer;
    code:integer;
    monto:integer;
begin
    max:=0;
    monto:=0;
    armar_arbol(a);
    writeln('Ingrese codigo de cliente a buscar: ');readln(code);
    total(busqueda_de_arbol(a,code),max,monto);
end.
