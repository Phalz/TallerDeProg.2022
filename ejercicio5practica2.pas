program ejercicio5practica2;
const
	dimF=10;
	primero=-1;
type
	indice=primero..dimF;
	vector=array[1..dimF]of integer;

procedure cargarvector(var v:vector);
var
	i:integer;
begin
	randomize;
	for i:=1 to dimF do begin
		v[i]:=random(10)+i*10;
		writeln(v[i]);
	end;
end;

procedure busquedaDicotomica(v:vector;ini,fin:indice;dato:integer;var pos:indice);
var
	medio:indice;
begin
	medio:=(ini+fin)div 2;
	if(ini<=fin) and (dato<>v[medio])then
		begin
			if(dato<v[medio])then
				fin:= medio-1
			else
				ini:=medio+1;
			medio:=(ini+fin) div 2;
			busquedaDicotomica(v,ini,fin,dato,pos);
		end;
	if(ini<=fin)and(dato=v[medio])then
		pos:=medio;
end;

var
	v:vector;
	fin,ini,pos:indice;
	dato:integer;
begin
	pos:=-1;
	ini:=1;
	fin:=dimF;
	cargarvector(v);
	write('Ingrese el dato que desea buscar: ');readln(dato);
	busquedaDicotomica(v,ini,fin,dato,pos);
	writeln(pos);
end.
		
