program ejercicio2practica3;
type
	arbol=^nodo;
	arbol2=^nodo2; 
	
	venta=record
		cod:integer;
		fecha:integer;
		vendidos:integer;
  end;
  
	venta2=record
		cod:integer;
		vendidos:integer;
	end;
	
	nodo=record
		dato:venta;
		HI:arbol;
		HD:arbol;
	end;
  
  nodo2=record
  	dato:venta2;
    HI:arbol2;
    HD:arbol2;
  end;

procedure armararbol1(var a:arbol; v:venta);
begin
	if(a=nil)then begin
		new(a);
		a^.HI:=nil;
		a^.HD:=nil;
		a^.dato.cod:=v.cod;
		a^.dato.fecha:=v.fecha;
		a^.dato.vendidos:=v.vendidos;
		end
	else
		if(v.cod<=a^.dato.cod)then
			armararbol1(a^.HI,v)
		else
			armararbol1(a^.HD,v);
	end;

function buscar2(a:arbol2;v:venta2):arbol2;
  begin
  	if(a=nil)then
    	buscar2:=nil
    else
    	if(a^.dato.cod=v.cod)then
      	buscar2:=a
      else
      	if(a^.dato.cod<v.cod)then
        	buscar2:=buscar2(a^.HD,v)
        else
        	buscar2:=buscar2(a^.HI,v);
  end;
  
procedure armararbol2(var a:arbol2; v:venta2);
begin
	if(a=nil)then begin
		new(a);
		a^.HI:=nil;
		a^.HD:=nil;
		a^.dato.cod:=v.cod;
		a^.dato.vendidos:=v.vendidos;
		end
	else
		if(v.cod<=a^.dato.cod)then
			armararbol2(a^.HI,v)
		else
			armararbol2(a^.HD,v);
	end;

procedure generaryarmar(var a:arbol;var a2:arbol2);
var
	v:venta;
	v2:venta2;
	pa:arbol2;
begin
	randomize;
	writeln('Ingrese un codigo de producto');
	readln(v.cod);
	v2.cod:=v.cod;
	while(v.cod<>0)do begin
		writeln('Ingrese un fecha del producto');
		v.fecha:=random(13);
		writeln(v.fecha);
		writeln('Ingrese la cantidad de unidades vendidas del producto');
		v.vendidos:=random(10);
		v2.vendidos:=v.vendidos;
		writeln(v.vendidos);
		armararbol1(a,v);
		pa:=buscar2(a2,v2);
		if(pa<>nil)then
			pa^.dato.vendidos:=pa^.dato.vendidos+v2.vendidos
		else
			armararbol2(a2,v2);
		writeln('Ingrese un codigo de producto');
		readln(v.cod);
		v2.cod:=v.cod;
		end;
end;
  
procedure verarbol(a:arbol);
begin
	if(a<>nil)then begin
		verarbol(a^.HI);
		writeln(a^.dato.cod);
		verarbol(a^.HD);
		end;
end;

function devolverv(a:arbol;producto:integer):arbol;
  begin
  	if(a=nil)then
    	devolverv:=nil
    else
    	if(a^.dato.cod=producto)then
			devolverv:=a
      else
      	if(a^.dato.cod<producto)then
        	devolverv:=devolverv(a^.HD,producto)
        else
        	devolverv:=devolverv(a^.HI,producto);
  end;
  
function devolverv2(a:arbol2;producto2:integer):arbol2;
  begin
  	if(a=nil)then
    	devolverv2:=nil
    else
    	if(a^.dato.cod=producto2)then
			devolverv2:=a
      else
      	if(a^.dato.cod<producto2)then
        	devolverv2:=devolverv2(a^.HD,producto2)
        else
        	devolverv2:=devolverv2(a^.HI,producto2);
  end;

procedure verarbol2(a2:arbol2);
begin
	if(a2<>nil)then begin
		verarbol2(a2^.HI);
		writeln(a2^.dato.cod);
		verarbol2(a2^.HD);
		end;
end;
var
	a,pa:arbol;
	a2,pa2:arbol2;
	producto,producto2:integer;
begin
	a:=nil;
	a2:=nil;
	generaryarmar(a,a2);
	writeln('arbol 1 ');
	verarbol(a);
	writeln('arbol 2 ');
	verarbol2(a2);
	writeln('Inserte el codigo de producto del cual desee averiguar su cantidad de productos vendidos en el arbol 1 ');
	readln(producto);
	writeln('Inserte el codigo de producto del cual desee averiguar su cantidad de productos vendidos en el arbol 2');
	readln(producto2);
	pa:=devolverv(a,producto);
	pa2:=devolverv2(a2,producto2);
	if(pa=nil)then
		writeln('la cantidad de unidades vendidas del codigo del producto ',producto,' es 0')
	else
		writeln('la cantidad de unidades vendidas del codigo del producto ',producto,' es ',pa^.dato.vendidos);
	if(pa2=nil)then
		writeln('la cantidad de unidades vendidas del codigo del producto ',producto2,' es 0')
	else
		writeln('la cantidad de unidades vendidas del codigo del producto ',producto2,' es ',pa2^.dato.vendidos);
end.
		
