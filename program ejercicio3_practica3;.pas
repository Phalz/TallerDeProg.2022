program ejercicio3_practica3;
type
    alumnos = record
        legajo:integer;
        dni:integer;
        ano:integer;
    end;

    arbol = ^nodo;

    nodo = record
        dato: alumnos;
        hi:arbol;
        hd:arbol;
    end;

procedure arbolovsky(var a:arbol);
    procedure leeralumno(var l:alumnos);
    begin
        writeln('--Legajo-->');readln(l.legajo);
        writeln('--dni-->');readln(l.dni);
        writeln('--ano-->');readln(l.ano);
    end;

    procedure armararbol(var a:arbol;l:alumnos);
    begin
        if (a = nil) then begin
            new(a);
            a^.dato:= l; a^.hi:=nil; a^.hd:=nil;
        end
        else
            if (p.legajo > a^.dato.legajo) then begin
                armararbol(a^.hd,l);
            end
            else armararbol(a^.hi,l);
    end;
var
    l:alumno;
begin
    leeralumno(l);
    if (ano > 2010) then begin
        armararbol(a,l);
        arbolovsky(a);
    end;
end;

procedure imprimir(a:arbol;valorinf: integer);
begin
  if (a <> nil) then begin
    if (a^.dato.legajo < valorinf) then begin
        writeln(a^.dato.dni);
        writeln(a^.dato.ano);
    end;
    imprimir(a^.hi,valorinf);
    imprimir(a^.hd,valorinf);
  end;
end;

procedure entredos(a:arbol;max:integer;min:Integer);
begin
    if(a^.dato.legajo >= min) and (a^.dato.legajo <= min) then begin
        writeln(a^.dato.dni);
        writeln(a^.dato.ano);
    end;
    if (a <> nil) then begin
        entredos(a^.hi,max,min);
        entredos(a^.hd,max,min);
    end;
end;

procedure dnigrande(a:arbol;var d:integer);
begin
  if (a^.dni > d) then d:=a^.dato.dni;
  if (a <> nil) then begin
    dnigrande(a^.hd,d);
    dnigrande(a^.hi,d);
  end;
end;

procedure impar(a:arbol;var total:integer);
    function sacarimp(var l:integer):boolean;
    begin
        if (l mod 2 <> 0) then begin 
            sacarimp:=True;
        end
        else sacarimp:=false;
    end;
begin
    if (sacarimp(a^.dato.legajo)) then total := total+1;
    if (a <> nil) then begin
        impar(a^.hd,total);
        impar(a^.hi,total);
  end;
end;

var
    a:arbol;
    max,min,valorinf,total,maxdni:integer;
begin
    maxdni:=-1;
    total:=0;
    a:=nil;
    arbolovsky(a);
    writeln('Ingrese un valor base: ');readln(valorinf);
    imprimir(a,valorinf);
    writeln('--Ingrese un valor maximo y un valor minimo--');readln(max);readln(min);
    entredos(a,max,min);
    dnigrande(a,maxdni);
    writeln('El mayor dni registrado es --> ',maxdni);
    impar(a,total);
    writeln('Total de legajos impares: ',total);
end.