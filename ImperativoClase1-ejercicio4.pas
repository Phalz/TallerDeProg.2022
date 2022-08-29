{Una librería requiere el procesamiento de la información de sus productos. De cada producto se conoce el código del producto, código de rubro (del 1 al 8) y precio. 
Implementar un programa modularizado que:
a. Lea los datos de los productos y los almacene ordenados por código de producto y agrupados por rubro, en una estructura de datos adecuada.
 El ingreso de los productos finaliza cuando se lee el precio 0.
b. Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro.
c. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3. Considerar que puede haber más o menos de 30 productos del rubro 3.
 Si la cantidad de productos del rubro 3 es mayor a 30, almacenar los primeros 30 que están en la lista e ignore el resto. 
d. Ordene, por precio, los elementos del vector generado en b) utilizando alguno de los dos métodos vistos en la teoría. 
e. Muestre los precios del vector ordenado.
}
program Imperativo-ejercicio4;
const   
    dimf = 8;
    dimf2 = 30;
type
    rango = 1..dimf;
    rango2 = 1..dimf2;

    productos = record  
        code: integer;
        rubro: rango;
        precio: real;
    end;

    {punto C}
    treinta = array [rango2] of productos;

    lista = ^nodo;

    nodo = record
        dato: productos;
        sig: lista;
    end;

    vector = array [rango] of lista;

procedure inicializarvector (var v:treinta);
var 
    i:integer;
begin
    for i:=1 to dimf2 do begin
        v[i]:= 0;
    end;
end;

procedure leerproductos(var p:productos);
begin
    writeln('Ingrese el codigo del producto: ');readln(p.code);
    writeln('Ingrese el rubro del producto: ');readln(p.rubro);
    writeln('Ingrese el precio (real) del producto: ');readln(p.precio);
end;

procedure armarnodo(var l:lista; p:productos);
var
    aux,act,ant:lista;
begin
    new(aux);
    aux^.dato:= p;
    act:=l;
    ant:=l;
    while (act <> nil) and (p.precio > act^.dato.precio) do begin
        ant := act;
        act := act^.sig;
    end;
    if (act = ant)  then 
        l:= aux;
    else 
        ant^.sig := act;
    aux^.sig := act;
end;

procedure armarlista (var l:lista; p:productos)
begin
        leerproducto(p);
        while (p.precio <> 0) do begin
            armarnodo(l,p);
            leerproducto(p);
        end;
end;

procedure armarvector (var v:vector; l:lista;)
var
    i:integer;
    p:productos;
begin
    for i:=1 to dimf1 do begin  
        v[i]:= armarlista(l,p);
    end;
end;

procedure imprimircodigos(v:vector); {hice cualquiera aca}
var 
    i:integer;
    aux: lista;
begin
    for i:=1 to dimf do begin
        while (aux <> nil) do begin
            writeln(v[i].aux^.dato.precio);
            aux:= aux^.sig;
        end;
    end;
end;

procedure armarvector(v:vector; var t:treinta);
var
    i:integer;
    aux:lista;
begin


