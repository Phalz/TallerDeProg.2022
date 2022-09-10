program ej1_prac5;
{
1.- El administrador de un edificio de oficinas, cuenta en papel, con la información del pago de las expensas de dichas oficinas. 
Implementar un programa que:
Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina se ingresa código de identificación, DNI del propietario y valor de la expensa.
La lectura finaliza cuando llega el código de identificación -1.
Ordene el vector, aplicando uno de los métodos vistos en la cursada, para obtener el vector ordenado por código de identificación de la oficina.
Realice una búsqueda dicotómica que recibe el vector generado en b) y un código de identificación de oficina y retorne si dicho código está en el vector.
En el caso de encontrarlo, se debe informar el DNI del propietario y en caso contrario informar que el código buscado no existe.
Tenga un módulo recursivo que retorne el monto total de las expensas.
}

const 
    dimf = 300;
type 
    rango = 1..dimf;

    oficina = record
        code:integer;
        dni:integer;
        valor:real;
    end;

    vector=array [rango] of oficina;

procedure inicializar_vec (var v:vector);
var
    i:integer;
begin
    for i:=1 to dimf do begin
        v[i] := 0;
    end;
end;

procedure leer_oficina(var o:oficina);
begin
    writeln('--INFORMACION DE LAS OFICINAS--');
    writeln('-->Codigo de oficina: ');read(o.code);
    writeln('-->Dni del propietario: ');read(o.dni);
    writeln('-->Valor de las expensas: ');read(o.valor);
end;

procedure armar_vec(var v:vector;var diml:integer);
var
    o:oficina;
begin 
    diml:=0;
    leer_oficina(o);
    while (oficina.code <> 0) and (diml <> dimf) do begin
        diml:=diml+1;
        v[diml]:=o;
    end;
end;

procedure orden_insercion(var v:vector;diml:integer);
var 
    i,j,aux:integer;
begin   
    for i:=2 to diml-1 do begin
        aux:=v[i];
        j:=i-1;
        while (j > 0) and (v[j]>aux) do begin
            v[j+1]:=v[j];
            j:=j+1;
        end;
        v[j+1]:=aux;
    end;
end;

procedure dicotomica(v:vector;ini,fin:integer;iden:integer;pos:integer);
var 
    med:integer;
begin
    if (pos <> 0) then begin
        med:= (ini + fin) div 2;
        if (num = v[med]) then
            writeln('encontrado (ultra nashe)',' dni: ',v[med].dni)
        else
            if(num < v[med]) then 
                busquedadicotomica(v,med-1,fin,iden,pos-1)
            else busquedadicotomica(v,ini,med+1,iden,pos+1);
    end
    else writeln('no lo encontre (muy poco nashe)');
end;

procedure totalnashe(v:vector;diml:integer);
var
    i:integer;
    total:integer;
begin   
    for i:=1 to diml do begin
        total:= total + v[i].valor;
    end;
    writeln('total: ', total);
end;

var 
    v:vector;
    diml:integer;
    iden:integer;
    ini,fin:integer;
    pos:integer;
begin   
    inicializar_vec(v);
    armar_vec(v,diml);
    ordenar_insercion(v,diml);
    writeln('--IDENTIFICACION A BUSCAR--');
    readln(iden);
    pos:=diml;
    ini:=1;
    fin:=diml;
    dicotomica(v,ini,fin,iden,pos);
    totalnashe(v);
end.