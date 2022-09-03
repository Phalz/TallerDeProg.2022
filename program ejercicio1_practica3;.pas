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

procedure mayor(a:arbol;var mayor:integer);
begin
    If (a^.dato.edad > mayor) then begin
      mayor := a^.dato.edad;
    end;
    if (a <> nil) then begin
      mayor(a^.hi);
      mayor(a^.hd);
    end;
end;

//punto IV

procedure aumentaredad(a:arbol);
begin
    a^.dato.edad:= a^.dato.edad + 1;
    if (a <> nil) then begin
        aumentaredad(a^.hi);
        aumentaredad(a^.hd);
    end;
end;

//punto V 
function buscar(a: arbol;num:integer):boolean;
begin
    if (a^.dato.num = num) then begin buscar := true;
    end
    else buscar := false;
    if (buscar <> True) then begin
        buscar(a^.hi,num);
        buscar(a^.hd,num);
    end;
end;

//punto VI
function nombre(a: arbol;nom:String):boolean;
begin
    if (a^.dato.nombre = nom) then begin
        nombre:= true;     
    end
    else
        nombre:=false;
    if ( nombre <> True) then begin
        nombre(a^.hi,nom);
        nombre(a^.hd,nom);
    end;
end;

//punto VII