program ejercicio2_practica4;
const
	dimf = 8;
type
	rango = 1..dimf;
	
	pelicula = record
		codep: integer;
		codeg:rango;
		punt:real;
	end;
	
	lista = ^nodo;
	
	nodo = record
		dato:pelicula;
		sig:lista;
	end;
	
	vec = array [rango] of lista;
	
procedure inicializarvec(var v:vec);
var
	i:integer;
begin
	for i:=1 to dimf do begin
		v[i]:= nil;
	end;
end;

procedure armarnodo(var l:lista;p:pelicula);
var
	act,ant,aux:lista;
begin
	new(aux);
	aux^.dato:=p;
	act:=l;
	ant:=l;
	if (act <> nil) and (act^.dato.codep < p.codep) then begin
		ant:=act;
		act:=act^.sig;
	end;
	if (ant = act) then l:=aux
	else
		ant^.sig:=aux;
	aux^.sig:=act;
end;

procedure leerproducto(var p:pelicula);
begin
	writeln('--codep--');readln(p.codep);
	writeln('--genero--');readln(p.codeg);
	writeln('--puntaje--');readln(p.punt);
end;

procedure ubicarenvector(var v:vec);
var
	p:pelicula;
begin
	leerproducto(p);
	if (p.codep <> -1) then begin
		armarnodo(v[p.codep],p);
		ubicarenvector(v);
	end;
end;

procedure merge(v:vec; l:lista);
	procedure imprimir(l:lista);
	begin
		if (l <> nil) then begin
			writeln(l^.dato.codep);
			writeln(l^.dato.codeg);
			writeln(l^.dato.punt);
			l:=l^.sig;
		end;
	end;
var
	i:integer;
begin
	l:=nil;
	for i:=1 to dimf do begin
		if (v[i] <> nil) then begin
			armarnodo(l,v[i]^.dato);
			v[i]:=v[i]^.sig;
		end;
	end;
	imprimir(l);
end;

var
	v:vec;
	l:lista;
begin
	l:=nil;
	inicializarvec(v);
	ubicarenvector(v);
	merge(v,l);
end.


