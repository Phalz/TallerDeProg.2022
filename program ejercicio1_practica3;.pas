program ejercicio1_practica3;
type 
    socios = record
        num: integer;
        nombre: string;
        edad: integer;
    end;

    arbol = nodo;

    nodo = record
        dato : socios;
        hi: arbol;
        hd:arbol;
    end;

procedure leersocio(var s:socio);
begin
  writeln('Numero de socio: ');readln(s.num);
  writeln('Nombre: ');readln(s.nombre);
  writeln('Edad: ');readln(s.edad);
end;

procedure crear (var a:arbol;s:socio);
begin
    leersocio(s);
    if (s.num <>  0) then begin
        if (a = nil) then
            begin
                new(a);
                a^.dato := s;
                a^.hi:= nil;
                a^.hd := nil;
            end
        else begin
            if (s.num < a^.dato.num) then begin
                crear(a^.hi,s);
            end
            else crear(a^.hd, num);
        end;
    end;
end; 

//punto I
function maximo(a:arbol; x:integer):arbol;
begin
    if (a = nil) then begin
        writeln('El maximo numero de socio es: ', x);
        maximo := nil;
    end
    else if (x < a^.dato.num) then begin
        maximo:=maximo(a^.hi,x);
    end
    else
        maximo:=maximo(a^.hd,x);
end;
//punto II
function minimo(a:arbol;x:integer):arbol;
begin
    if (a = nil) then begin
        writeln('el socio con numero mas bajo es: ');writeln(a^.dato.num);writeln(a^.dato.nombre);writeln(a^.dato.edad);
        minimo:= nil;
    end
    else if (x < a^.dato.num) then
        minimo := minimo(a^.hi,x);
end;

//punto III

function edad(a:arbol;mayor:integer):arbol;
begin
    if (a = nil) then begin
        mayor:= a^.dato.edad;
    end
    else if 
end;

    