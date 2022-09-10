{4. Un teatro tiene funciones los 7 días de la semana. Para cada día se tiene una lista con las entradas vendidas. Se desea procesar la información de una semana. Implementar un programa que:
a. Genere 7 listas con las entradas vendidas para cada día. De cada entrada se lee día (de 1 a 7), código de la obra, asiento y monto.
*  La lectura finaliza con el código de obra igual a 0. Las listas deben estar ordenadas por código de obra de forma ascendente. 
b. Genere una nueva lista que totalice la cantidad de entradas vendidas por obra.
*  Esta lista debe estar ordenada por código de obra de forma ascendente.}
        
program ej4_prac4;
const
	dimf =7;
	valorgrande = 9999;
type
	rango = 1..dimf;
	
	obra = record
		dia: rango;
		code:integer;
		asiento:integer;
		monto:real;
	end;
	
	acumulado = record
		code:integer;
		total:integer;
	end;
	
	lista = ^nodo;
	
	nodo = record
		dato:obra;
		sig:lista;
	end;
	
	lista_acumulador = ^a_nodo;
	
	a_nodo = record
		dato: acumulado;
		sig: lista_acumulador;
	end;
	
	vector = array [rango] of lista;
	
procedure armar_vec_l(var v:vector);
	procedure inicializar(var v:vector);
	var i:integer;
	begin 
		for i:=1 to dimf do begin 
			v[i]:=nil;
		end;
	end;

	procedure leer_obra(var o:obra);
	begin
		writeln('<--DATOS DE LA OBRA-->');
		writeln('Ingrese el dia: ');readln(o.dia);
		writeln('Ingrese el codigo: ');readln(o.code);
		writeln('Ingrese num de asiento: ');readln(o.asiento);
		writeln('Ingrese el monto pagado: ');readln(o.monto);
		writeln('<------------------------>');
	end;
	
	procedure ordenado(var l:lista; o:obra);
	var
		aux,act,ant: lista;
	begin
		new(aux);
		aux^.dato:=o;
		act:=l;
		ant:=l;
		while (act <> nil) and (act^.dato.code > o.code) do begin
			ant := act;
			act := act^.sig;
		end;
		if (ant = act) then l := aux
		else
			ant^.sig:=aux;
		aux^.sig := act;
	end;
	
var
	o:obra;
begin
	leer_obra(o);
	if (o.code <> 0) then begin
		ordenado(v[o.dia],o);
		armar_vec_l(v);
	end;
end;

procedure minimo(var v:vector;var min: obra);
var
	indicemin,i:integer;
begin
	min.code := valorgrande;
	for i:=1 to dimf do begin
		if (v[i] <> nil) then begin
			if (v[i]^.dato.code >= min.code) then begin
				indicemin := i;
				min := v[i]^.dato;
			end;
		end;
	end;
	if (min.code <> valorgrande) then begin
		v[indicemin]:=v[indicemin]^.sig;
	end;
end;

procedure acumulador(v:vector; la: lista_acumulador);
	procedure agregar_atras(var l,ult : lista_acumulador; a:acumulado);
	var
		aux:lista_acumulador;
	begin
		new(aux);
		aux^.dato:= a;
		aux^.sig:=nil;
		if (l = nil) then l := aux
			else ult^.sig:=aux;
		ult := aux;
	end;

var 
	min:obra;
	ult:lista_acumulador;
	act:acumulado;
begin
	la:=nil;
	minimo(v,min);
	while (min.code <> valorgrande) do begin
		act.code:= min.code;
		act.total := 0;
		while (act.code = min.code) do begin
			act.total := act.total + 1;
			minimo(v,min);
		end;
	agregar_atras(la,ult,act);
	end;
end;

var
	v:vector;
	l:lista_acumulador;
begin
	l:=nil;
	armar_vec_l(v);
	acumulador(v,l);
end.
