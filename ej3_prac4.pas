{     Implementar un programa que procese la información de las ventas de productos de una librería que tiene 4 sucursales.
*  De cada venta se lee fecha de venta, código del producto vendido, código de sucursal y cantidad vendida. 
* El ingreso de las ventas finaliza cuando se lee el código de sucursal 0. Implementar un programa que:
        a. Almacene las ventas ordenadas por código de producto y agrupados por sucursal, en una estructura de datos adecuada.
        b. Contenga un módulo que reciba la estructura generada en el punto a y retorne una estructura donde esté acumulada la cantidad total
        *  vendida para cada código de producto.
}
program ejercicio3_prac14;
const
	dimf = 4;
	valorgrande = 9999;
type
	rango = 1..dimf;
	
	venta = record
		fecha:integer;
		code:integer;
		suc:integer;
		cant:integer;
	end;
	
	acumulado = record
		code:integer;
		total:integer;
	end;
	
	lista = ^nodo;
	
	nodo = record
		dato:venta;
		sig:lista;
	end;
	
	vector = array [rango] of lista;
	
	lista_acumulador = ^m_nodo;
	
	m_nodo = record
		dato:acumulado;
		sig:lista_acumulador;
	end;
	
procedure inicializarvec(var v:vector);
var i:integer;
begin
	for i:= 1 to dimf do begin
		v[i]:=nil;
	end;
end;

procedure armar_vector_listas(var v:vector);
	
	procedure leer_venta(var d:venta);
	begin
		writeln('---VENTA---');
		writeln('Ingrese la fecha: ');readln(d.fecha);
		writeln('Ingrese el codigo de producto: ');readln(d.code);
		writeln('Ingrese la sucursal: ');readln(d.suc);
		writeln('Ingrese la cantidad: ');readln(d.cant);
	end;
	
	procedure agregar_ordenado(var l:lista; d:venta);
	var
		aux,act,ant: lista;
	begin
		new(aux);
		aux^.dato:=d;
		act:=l;
		ant:=l;
		while (act <> nil) and (act^.dato.code <= d.code) do begin
			ant:=act;
			act:=act^.sig;
		end;
		if (ant = act) then 
			l:=aux
		else 
			ant^.sig:=aux;
		aux^.sig:=act;
	end;
	
var
	d:venta;
begin
	leer_venta(d);
	if (d.suc <> 0) then begin
		agregar_ordenado(v[d.suc],d);
		armar_vector_listas(v);
	end;
end;

procedure minimo(var v:vector;var min:venta);
var
	indicemin,i:integer;
begin
	min.code := valorgrande;
	for i:=1 to dimf do begin
		if (v[i] <> nil) then begin
			if (v[i]^.dato.code <= min.code) then begin
				indicemin := i;
				min.code := v[i]^.dato.code;
			end;
		end;
	end;
	if (v[i]^.dato.code <> valorgrande) then begin
		v[indicemin]:=v[indicemin]^.sig;
	end;
end;

procedure merge_acumulador(v:vector;var l:lista_acumulador);
	procedure agregar_atras(var l,ult:lista_acumulador; d:acumulado);
	var
		aux:lista_acumulador;
	begin
		new(aux);
		aux^.dato:=d;
		aux^.sig := nil;
		if (l = nil) then l := aux
			else ult^.sig := aux;
		ult := aux;
	end;

var 
	min:venta;
	ult:lista_acumulador;
	actual:acumulado;
begin
	l:=nil;
	minimo(v,min);
	while (min.code <> valorgrande) do begin
		actual.code := min.code;
		actual.total := 0;
		while (actual.code = min.code) do begin
			actual.total := actual.total + 1;
			minimo(v,min);
		end;
		agregar_atras(l,ult,actual);
	end;
end;


var 
	v:vector;
	l:lista_acumulador;
begin
	armar_vector_listas(v);
	merge_acumulador(v,l);
end.
