program ejercicio3practica2;
type
	lista=^nodo;
	nodo=record
		dato:integer;
		sig:lista;
	end;
	
	procedure generalista(var L:lista);
	var
		aux:lista;
		num:integer;
	begin
		num:=random(100);
		if(num<>0)then begin
			new(aux);
			aux^.dato:=num;
			aux^.sig:=L;
			L:=aux;
			write('-',L^.dato);
			generalista(L);
		end;
	end;
	
	
	function minimolista(L:lista;minimo:integer):integer;
	begin
		if(L<>nil)then begin
			if(L^.dato<minimo)then
				minimo:=L^.dato;
			minimo:=minimolista(L^.sig,minimo);
			end;
		minimolista:=minimo;
	end;
	
	function maximolista(L:lista;maximo:integer):integer;
	begin
		if(L<>nil)then begin
			if(L^.dato>maximo)then
				maximo:=L^.dato;
			maximo:=maximolista(L^.sig,maximo);
			end;
		maximolista:=maximo;
	end;
	
	function presencianumero(L:lista;bus:integer):boolean;
	var
		esta:boolean;
	begin
		esta:=false;
		if(L<>nil)then begin
			esta:=presencianumero(L^.sig,bus);
			if(L^.dato=bus)then
				esta:=true;
			end;
		presencianumero:=esta;
	end;
			
var
	L:lista;
	minimo:integer;
	maximo:integer;
	bus:integer;
begin
	maximo:=0;
	minimo:=999;
	randomize;
	L:=nil;
	generalista(L);
	writeln();
	write('el numero mas pequenio es: ');
	writeln(minimolista(L,minimo));
	write('el numero mas grande es: ');
	writeln(maximolista(L,maximo));
	writeln('Inserte el numero que desee buscar');
	readln(bus);
	if(presencianumero(L,bus))then
		writeln('el numero esta')
	else
		writeln('el numero no esta');
end.

	
