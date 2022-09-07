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
            if (l.legajo > a^.dato.legajo) then begin
                armararbol(a^.hd,l);
            end
            else armararbol(a^.hi,l);
    end;
var 
	l:alumnos;
begin
    leeralumno(l);
    if (l.ano > 2010) then begin
        armararbol(a,l);
        arbolovsky(a);
    end;
end;

procedure imprimir(a:arbol;valorinf: integer);
begin
	if (a <> nil) then begin
		imprimir(a^.hi,valorinf);
		if (a^.dato.legajo < valorinf) then begin
			writeln(a^.dato.dni);
			writeln(a^.dato.ano);
		end;
		imprimir(a^.hd,valorinf);
	end;
end;

procedure entredos(a:arbol;max:integer;min:Integer);
begin
    if (a <> nil) then begin
        entredos(a^.hi,max,min);
        if(a^.dato.legajo >= min) and (a^.dato.legajo <= min) then begin
            writeln(a^.dato.dni);
            writeln(a^.dato.ano);
        end;
        entredos(a^.hd,max,min);
    end;
end;

procedure dnigrande(a:arbol;var d:integer);
begin
  if (a <> nil) then begin
    dnigrande(a^.hd,d);
    if (a^.dato.dni > d) then d:=a^.dato.dni;
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
    if (a <> nil) then begin
        impar(a^.hd,total);
        if (sacarimp(a^.dato.legajo)) then total := total+1;
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

