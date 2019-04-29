delete(instrfind({'Port'},{'COM3'}));
%crear objeto serie
s = serial('COM3','BaudRate',9600,'Terminator','CR/LF');
warning('off','MATLAB:serial:fscanf:unsuccessfulRead');
%abrir puerto
fopen(s);
b=input('INGRESE LA CLAVE: ','s')
%fwrite(s,b,'uint8');
fwrite(s,b,'char');
pause(1);
a = fscanf(s,'%d')';
cont = 0;

if (a ~= 1)
    disp('CLAVE INCORRECTA');
    cont = cont + 1;
else if (a == 1)
        disp('BIENVENIDO AL SISTEMA');
        cont = 0;
    end
end

while (cont < 3)
    b=input('INGRESE LA CLAVE: ','s')
    fwrite(s,b,'char');
    pause(1);
    a = fscanf(s,'%d')';
    
    if (a ~= 1)
        disp('CLAVE INCORRECTA');
        cont = cont + 1;
    else if (a == 1)
        disp('BIENVENIDO AL SISTEMA');
        cont = 0;
        end
    end
end

if (cont >= 3)
    disp('BLOQUEADO');
end

fclose(s);