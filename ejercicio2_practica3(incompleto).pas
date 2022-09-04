{
    a. Implemente un módulo que lea información de ventas de un comercio. De cada venta se lee código de producto, fecha y cantidad de unidades vendidas.
     La lectura finaliza con el código de producto 0. Un producto puede estar en más de una venta. Se pide:
i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de producto.
ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por código de producto.
 Cada nodo del árbol debe contener el código de producto y la cantidad total vendida.
               Nota: El módulo debe retornar los dos árboles.
b. Implemente un módulo que reciba el árbol generado en i. y un código de producto y retorne la cantidad total de unidades vendidas de ese producto.
c. Implemente un módulo que reciba el árbol generado en ii. y un código de producto y retorne la cantidad total de unidades vendidas de ese producto.

}
program ejercicio2_practica3;
type
    producto = record
        code: integer;
        fecha: integer;
        cant: integer;
    end;

    vendidos = record
        code: integer;
        total: integer;
    end;

    arbol = ^nodo;
    segundo = ^nodo2;

    nodo = record
        dato: producto;
        hi:arbol;
        hd:arbol;
    end;

    nodo2 = record
        dato: vendidos;
        hi:segundo;
        hd:segundo;
    end;

procedure leerproducto(var p:producto);
var
    writeln('--codigo de producto--);
    readln(p.code);
    writeln('fecha: ');readln(p.fecha);
    writeln('cantidad de compras: ');readln(p.cant);
end;

procedure armararbol(var a:arbol;p:producto);
begin
    if (a = nil) then begin
      new(a);
      a^.dato:= p.code; a^.hi:= nil; a^.hd:= nil;
    end;
    else
        if (p.code > a^.dato.code) then armararbol(a^.hi, p);
        else armararbol(a^.hd,p);
end;

procedure leeryarmar(var a:arbol);
var
    p:producto;
begin
    leerproducto(p);
    if (p.code <> 0);
    armararbol(a,p);
    leeryarmar(a);
end;

function ordenado(a:arbol;c:integer;var t:integer):arbol;
begin
    if (a = nil) then ordenado:=nil
    else if (c = a^.dato.code) then begin
        t:= t + a^.dato.cant;
    end;
    ordenado(a^.hd,c,t);
end;

procedure armararbol(var s:segundo;a:arbol;v:vendidos);
begin
    if (s = nil) then begin
        new(s);
        
        




