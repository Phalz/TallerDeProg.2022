program ejercicio2practica4;
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
		while(act<>nil)and(act^.dato.codigo<L^.dato.codigo)do begin
			ant:=act;
			act:=act^.sig;
			end;
		if(act=nil)then begin
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
	i:rango8;
	d:datos;
begin
	randomize;
	for i:=1 to cantg do begin
		writeln('insete un codigo de peli');
		readln(d.codigo);
		while(d.codigo<>0)do begin
			d.codigog:=i;
			d.puntaje:=random(100);
			agregarordenado(v[i],d);
			writeln('insete un codigo de peli');
			readln(d.codigo);
			end;
		end;	
end;

procedure imprimirlistas(v:vectorg);
var
	i:rango8;
begin
	for i:=1 to cantg do begin
		while(v[i]<>nil)do begin
			writeln('-',v[i]^.dato.codigo);
			v[i]:=v[i]^.sig;
		end;
		writeln('lista ',i,' finalizada');
	end;
end;
var
	v:vectorg;
begin
	inicializarlistas(v);
	generarlistas(v);
	imprimirlistas(v);
end.		

		
