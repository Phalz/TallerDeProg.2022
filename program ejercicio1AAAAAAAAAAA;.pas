program ejercicio1;
const   
    dimf = 300;
type
    rango = 1..dimf;

    oficina = record
        code:integer;
        dni:integer;
        exp:real;
    end;

    vector = array [rango] of oficina;

procedure inicializar(var v:vector);
var
    i:integer;
begin
    for i:=1 to dimf do begin
        v[i].code:=0;
        v[i].dni:=0;
        v[i].exp:=0;
    end;
end;

procedure vec(var v:vector;var diml:integer);
    procedure leer_datos(var o:oficina);
    begin
        writeln('<<<<<Datos de las oficinas>>>>>');
        writeln('Ingrese codigo: ');readln(o.code);
        writeln('Ingrese dni: ');readln(o.dni);
        writeln('Ingrese exp: ');readln(o.exp);
    end;
var
    i:integer;
    o:oficina;
begin
    leer_datos(o);
    for i:=1 to dimf do begin
        while (o.code <> -1) do begin
            v[i]:=o;
            diml:=diml+1;
            leer_datos(o);
        end;
    end;
end;

procedure insercion (var v:vector);
var
    i,j:integer;
    actual: oficina;
begin
    for i:=2 to dimf do begin
        actual := v[i];
        j:=i-1;
        while (j > 0) and (v[i].code > actual.code)do begin
            v[j+1]:=v[j];
            j:=j-1;
        end;
    v[j+1]:= actual;
    end;
end;

procedure dicotomica(var v:vector; ini,fin:integer;code:integer);
var
    med:integer;
begin
    if (ini <= fin) then begin
        med:=(ini + fin) div 2;
        if (v[med].code = code) then 
            writeln('encontrado')
        else 
            if (code > v[med].code) then 
                dicotomica(v,med+1,fin,code)
            else
                dicotomica(v,ini,med-1,code);
    end
    else writeln('No se encontro el codigo');
end;

function ventastotales(v:vector;dimL:integer):real;
begin
    if(dimL>0)then
        ventastotales:=ventastotales(v,dimL-1)+v[dimL].exp
end;

var 
    diml:integer;
    v:vector;
    code:integer;
begin
    diml:=0;
    inicializar(v);
    vec(v,diml);
    writeln('<<<Ingrese codigo a buscar>>>');readln(code);
    dicotomica(v,1,diml,code);
    ventastotales(v,diml);
end.

