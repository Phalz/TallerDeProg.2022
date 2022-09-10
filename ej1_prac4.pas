program ejercicio1;
const
	dimf = 12;
 type 
	rango = 1..dimf;
	
	prestamo = record
		isbn: integer;
		socio:integer;
		dia:integer;
		mes:integer;
		cant:integer;
	end;
	
	lista = ^nodo;
	
	nodo = record
		dato:prestamo;
		sig:lista;
	end;
	
	vec = array [rango] of lista;
	
	prestamo_acumulador = record
		isbn: integer;
		veces:integer;
	end;
	
	lista_acum = ^nodo_acum;
	
	nodo_acum = record
		dato: prestamo_acumulador;
		sig: lista_acum;
	end;
	
//punto 1
procedure leerprestamo(var p:prestamo);
begin
	writeln('isbn: ');readln(p.isbn);
	writeln('socio: ');readln(p.socio);
	writeln('dia: ');readln(p.dia);
	writeln('mes: ');readln(p.mes);
	writeln('cant: ');readln(p.cant);
end;

procedure ordenado(var l:lista; p:prestamo);
var
	aux,act,ant:lista;
begin
	new(aux);
	aux^.dato:=p;
	act:=l;
	ant:=l;
	while (act <> nil) and ( act^.dato.isbn < p.isbn) do begin
		ant:=act;
		act:=act^.sig;
	end;
	if ( ant = act) then l:= aux
	else
		ant^.sig:=aux;
	aux^.sig:=act;
end;

procedure organizar_en_nodo(var v:vec); // recursivo si o si
var
	p:prestamo;
begin
	leerprestamo(p);
	if (p.isbn <> -1) then begin
		ordenado(v[p.mes], p);
		organizar_en_nodo(v);
	end;
end;
//punto 2
procedure imprimirlista(l:lista);
begin
	if (l <> nil) then begin
		writeln(l^.dato.isbn);
		writeln(l^.dato.socio);
		imprimirlista(l^.sig);
	end;
end;

procedure imprimirvector(var v:vec); //es un procedimiento que llama a otro procedimiento que si cumple con el requisito de que sea recursivo
var
	i:integer;
begin
	writeln('---Vector de Listas---'); 
	for i:=1 to dimf do begin
		if (v[i] <> nil) then imprimirlista(v[i]);
	end;
end;

//punto 3
procedure presminimo(var v:vec;var min:prestamo);
var
	indicemin, i : integer;
begin
	min.isbn:= 9999;
	for i:=1 to dimf do begin
		if (v[i] <> nil) then begin
			if (v[i]^.dato.isbn <= min.isbn) then begin
				indicemin:=i;
				min:= v[i]^.dato;
			end;
		end;
	end;
	if (min.isbn <>  9999) then v[indicemin] := v[indicemin]^.sig;
end;


procedure merge (v:vec; var  l: lista);
	procedure agregar_atras (var l,ult: lista; p:prestamo);
	var
		aux:lista;
	begin
		new(aux);
		aux^.dato:= p;
		aux^.sig := nil;
		if (l = nil) then begin
			l:=aux
			end
			else ult^.sig:=aux;
		ult := aux;
	end;
var
	min:prestamo;
	ult:lista;
begin
	l:= nil;
	presminimo(v,min);
	while (min.isbn <> 9999) do begin
		agregar_atras(l,ult,min);
		presminimo(v,min);
	end;
end;

procedure imprimir_recursivo(l:lista;numsoc:integer);
begin
	if (l <> nil) then begin
		if (l^.dato.socio = numsoc) then begin
			writeln('isbn asociado: ', l^.dato.isbn);
		end;
		imprimir_recursivo(l^.sig,numsoc);
	end;
end;

procedure acumulador (v:vec;var l:lista_acum);
	procedure agregaratras2 (var l,ult:lista_acum;e:prestamo_acumulador);
	var
		aux:lista_acum;
	begin
		new(aux);
		aux^.dato:= e;
		aux^.sig:=nil;
		if (l = nil) then l:= aux
		else ult^.sig:=aux;
		ult:= aux;
	end;
var 
	presmin:prestamo;
	ult:lista_acum;
	pa: prestamo_acumulador;
begin
	l:= nil;
	presminimo(v,presmin);
	while (presmin.isbn <> 9999) do begin
		pa.isbn := presmin.isbn;
		pa.veces:= 0;
		while (pa.isbn = presmin.isbn) do begin
			pa.veces := pa.veces + 1;
			presminimo(v,presmin);
		end;
		agregaratras2(l,ult,pa);
	end;
end;

procedure imprimir_acumulador(l:lista_acum);
begin
	if (l <> nil) then begin
		writeln('---ISBN Y VECES PRESTADO---');
		writeln(l^.dato.isbn);
		writeln(l^.dato.veces);
		imprimir_acumulador(l^.sig);
	end;
end;

var
	v:vec; 
	l1:lista;
	l2:lista_acum;
	numsoc:integer;
begin
	organizar_en_nodo(v);
	imprimirvector(v);
	merge(v,l1);
	numsoc := random(100);
	imprimir_recursivo(l1,numsoc);
	acumulador(v,l2);
	imprimir_acumulador(l2);
end.




