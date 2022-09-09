program ejercicio2practica4ahoracompleto;
const
	cantg=8;
type	
	rango8=1..cantg;
	datos=record
		codigo:integer;
		codigog:rango8;
		puntaje:integer;
	end;
	lista=^nodo;
	nodo=record
		dato:datos;
		sig:lista;
	end;
	vectorg=array[rango8]of lista;
	
procedure inicializarlistas(var v:vectorg);
var
	i:rango8;
begin
	for i:=1 to cantg do 
		v[i]:=nil;
end;

procedure agregarordenado(var L:lista;d:datos);
var
	ant,aux,act:lista;
begin
	new(aux);
	aux^.dato.codigo:=d.codigo;
	aux^.dato.codigog:=d.codigog;
	aux^.dato.puntaje:=d.puntaje;
	aux^.sig:=nil;
	if(L=nil)then
		L:=aux
	else
		begin
		act:=L;ant:=L;
		while(act<>nil)and(act^.dato.codigo<aux^.dato.codigo)do begin
			ant:=act;
			act:=act^.sig;
			end;
		if(act=L)then begin
			aux^.sig:=L;
			L:=aux;
			end
		else
			begin
				ant^.sig:=aux;
				aux^.sig:=act;
			end;
		end;
end;		

procedure generarlistas(var v:vectorg);
var
	d:datos;
begin
	randomize;
	d.codigo:=random(50)-1;
	while(d.codigo<>-1)do begin
		d.codigog:=random(cantg)+1;
		d.puntaje:=random(100);
		agregarordenado(v[d.codigog],d);
		d.codigo:=random(50)-1;
		end;
end;

procedure agregaratras(var L,ult:lista;d:datos);
var
	nuevo:lista;
begin
	new(nuevo);
	nuevo^.sig:=nil;
	nuevo^.dato.codigo:=d.codigo;
	nuevo^.dato.puntaje:=d.puntaje;
	nuevo^.dato.codigog:=d.codigog;
	if(L=nil)then begin
		L:=nuevo;
		ult:=nuevo;
		end
	else
		begin
			ult^.sig:=nuevo;
			ult:=nuevo;
		end;
end;	
		
procedure minimo(var todos:vectorg;var dmin:datos);
var
	i,indicemin:integer;
begin
	dmin.codigo:=999;
	for i:=1 to cantg do 
		if(todos[i]<>nil)then 
			if(todos[i]^.dato.codigo<=dmin.codigo)then begin
				indicemin:=i;
				dmin.codigo:=todos[i]^.dato.codigo;
				end;
	if(dmin.codigo<>999)then
		begin
			dmin.puntaje:=todos[indicemin]^.dato.puntaje;
			dmin.codigog:=todos[indicemin]^.dato.codigog;
			todos[indicemin]:=todos[indicemin]^.sig;
		end;
end;
procedure imprimirnuevaL(L:lista);
var
	aux:lista;
begin
	aux:=L;
	writeln;
	writeln('La lista de todas las peliculas es: ');
	while(aux<>nil)do begin
		write('-',aux^.dato.codigo);
		aux:=aux^.sig;
		end;
end;

procedure merge(todos:vectorg;var NuevaL:lista);
var
	dmin:datos;
	ult:lista;
begin
	minimo(todos,dmin);
	while(dmin.codigo<>999)do begin
		agregaratras(NuevaL,ult,dmin);
		minimo(todos,dmin);
		end;
	imprimirnuevaL(NuevaL);
end;

procedure imprimirlistas(v:vectorg);
var
	i:rango8;
begin
	for i:=1 to cantg do begin
		writeln('lista ',i);
		while(v[i]<>nil)do begin
			write('-',v[i]^.dato.codigo);
			v[i]:=v[i]^.sig;
		end;
		writeln;
	end;
end;
var
	v:vectorg;
	nl:lista;
begin
	nl:=nil;
	inicializarlistas(v);
	generarlistas(v);
	imprimirlistas(v);
	merge(v,nl);
end.
		
