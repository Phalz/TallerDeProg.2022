program ejercicio4_practica2;
const
    dimf = 20;
type 
    rango = 1..dimf;

    vector = array [rango] of integer;

procedure inicilizarvec (var v:vec);
var
    i:integer;
begin
  for i:=1 to dimf do begin
    v[i]:=0;
  end;
end;

procedure vectorrecursivo(var v:vec;var diml:integer);
var
    num: integer;
begin
    diml := diml + 1;
    num:= random(101);
    write(' ',num);
    if (diml < dimf) then begin
        v[diml]:= num;
        vectorrecursivo(v,diml);
    end;
end;

procedure buscarmaximo (var v:vec;diml :integer);
var
    max: integer;
begin 
    if (diml = 0) then begin 
        max:= 1;
    end
    else begin
        if (diml < dimf) then begin
      	    dimL:= dimL + 1;
			    buscarMaximo(v,dimL);
			    if (v[dimL] > max) then 
				    max:= v[dimL];
		         end;
        end;
    writeln('el num maximo es: ', max);
end;   

var
    diml : integer;
    v:vec;
begin
    inicializarvec(v);
    vectorrecursivo(v,diml);
    buscarmaximo(v,diml);
end.