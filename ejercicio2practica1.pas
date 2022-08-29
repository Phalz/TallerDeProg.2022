program ej2practica1;
const
	dimF=300;
type
	rango=1..dimF;
	oficina=record
		codI:integer;
		DNI:integer;
		valor:real;
	end;
	vector=array[1..300] of oficina;

procedure InicializarVector(var v:vector);
var
	i:integer;
begin
	for i:=1 to dimF do begin
		v[i].codI:=0;
		v[i].DNI:=0;
		v[i].valor:=0;
		end;
end;

procedure CargarVector(var v:vector;var dimL:rango);
var
	codI:integer;
	i:integer;
begin
	i:=0;
	writeln('Ingrese el codigo de identificacion');
	readln(codI);
	i:=i+1;
	if(codI>=0)and (i<=dimF)then begin
		v[i].codI:=codI;
		while(i<=dimF)and (v[i].codI<>-1) do begin
			writeln('Ingrese el DNI');
			readln(v[i].codI);
			writeln('Ingrese el valor de la expensa');
			readln(v[i].valor);
			i:=i+1;
			writeln('Ingrese el codigo de identificacion');
			readln(v[i].codI);
			end;
		end;
	dimL:=i;
end;

procedure OrdenarInsercion(var v:vector;dimL:rango);
	var 
		i,j:integer;
		actual:oficina;
	begin
		for i:=2 to dimL do begin
			actual:=v[i];
			j:=i-1;
			while(j>0)and(v[j].codI>actual.codI)do
				begin
					v[j+1]:=v[j];
					j:=j-1;
				end;
			v[j+1]:=actual;
			end;
	end;

procedure OrdenarSeleccion(var v:vector; dimL:rango);
var
	i,j,p:integer;
	item:oficina;
begin
	for i:=1 to (dimL-1) do begin
		p:=i;
		for j:=i+1 to dimL do
			if v[j].codI<v[p].codI then
				p:=j;
			item:=v[p];
			v[p]:=v[i];
			v[i]:=item;
		end;
	end;
	
var
	v:vector;
	dimL:rango;
begin
	InicializarVector(v);
	CargarVector(v,dimL);
	OrdenarInsercion(v,dimL);
end.
