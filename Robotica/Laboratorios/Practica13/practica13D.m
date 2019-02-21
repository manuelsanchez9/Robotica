function practica13D
clc ; close all; clear;
contador = 0;
%% grafica
am = 35;
amn = -5;

fig = figure();
xlabel('eje x'),ylabel('eje y'),zlabel('eje z');
view([135 20]); grid on;
axis([amn am amn am amn am])

%% Funciones
function [ x, y ,z, z2 ] = generarSolido( n, m)
theta=0:2*pi/n:2*pi;
x=cos(theta+pi/4);
y=sin(theta+pi/4);
z=ones(1,length(x))*m(1);
z2=ones(1,length(x))*m(2);
end

function caras = Caras3D(n)
for i = 1:n % construcion de caras laterales
    caras(i,:) = [i i+1 i+n+2];
    caras(n+i,:) = [i n+i+1 i+n+2];
end
for i = 1:n-2 % construcci?n de 
    caras(i+2*n,:) = [1 i+1 i+2];
    caras(i+3*n-2,:) = [n+2 n+i+2 n+i+3];
end
end

function [ v1 ] = traslacion(a,v )

tra = [ 1 0 0 a(1);
    0 1 0 a(2);
    0 0 1 a(3);
    0 0 0 1];

v1=tra*v;
end

%% valores iniciales
xi = -1;
cil = [0 32]; 
bar1 = [0 10];
bar2 = [0 1];

%% Construcion de Tornillo y Barilla Lisa
nC = 10; % numero de cilidro
[ z, y, x, x1 ] = generarSolido( nC, cil);
z = 0.3*z;
y = 0.3*y;
vc = [x x1; y y;z z; ones(1,length(z)) ones(1,length(z))];

carasC = Caras3D(nC);
vc1 = traslacion([xi 0 2],vc);
gc1=patch('Faces',carasC,'Vertices',vc1(1:3,:)','facecolor',[0 1 0.9], 'edgecolor',[0 1 0.9]);
vc1 = traslacion([xi 0 8],vc);
gc2=patch('Faces',carasC,'Vertices',vc1(1:3,:)','facecolor',[0 0.1 0],'edgecolor',[0 .2 0]);

%% geracion de barras estructura
nB = 4;
[ x, y, z, z1 ] = generarSolido( nB, bar1);
vb = [x x; y y;z z1; ones(1,length(z)) ones(1,length(z))];
vb = traslacion([-1 0 0],vb);
carasB = Caras3D(nB);
gb=patch('Faces',carasB, 'Vertices',vb(1:3,:)', 'facecolor',[0 0 1], 'edgecolor',[0 0 0.9]);
vb1 = traslacion([cil(2) 0 0],vb);
gb=patch('Faces',carasB, 'Vertices',vb1(1:3,:)', 'facecolor',[0 0 1], 'edgecolor',[0 0 0.9]);

%% geracion motor
[ y, z, x, x1 ] = generarSolido( nC, bar2);
vb2 = [x x1; y y;z z; ones(1,length(z)) ones(1,length(z))];
vb2 = traslacion([-2.4 0 8],vb2);
gb2=patch('Faces',carasC, 'Vertices',vb2(1:3,:)', 'facecolor',[1 0 0], 'edgecolor',[1 0 0]);


%% geracion de barra de movimiento
nB = 4;
[ x, y, z, z1 ] = generarSolido( nB, bar1);
x = 0.5*x;
y = 0.5*y;
vb = [x x; y y;z z1; ones(1,length(z)) ones(1,length(z))];
carasB = Caras3D(nB);
gbm=patch('Faces',carasB, 'Vertices',vb(1:3,:)', 'facecolor',[0.5 1 0.5], 'edgecolor',[0 1 0]);

%% Conexion
    %borrar previos
    delete(instrfind({'Port'},{'COM7'}));
    %crear objeto serie
    s = serial('COM7','BaudRate',9600,'Terminator','CR/LF');
    warning('off','MATLAB:serial:fscanf:unsuccessfulRead');
    %abrir puerto
    fopen(s);% par?metros de medidas
    tmax = 100; % tiempo de captura en s
    rate = 33; % resultado experimental (comprobar)


%% movimiento
     popup = uicontrol(fig,'Style', 'edit',...
               'Position', [20 340 100 50],...
               'callback',@txtAng1); 

    posicion=0;
    function txtAng1(mane, ~)
        posicion = get(mane,'String');  
        rotate();
    end
        
    function rotate()         

pos = str2double(posicion);
sw = 1;
if(pos<0)
  sw = -1;
  pos = pos*-1;
end
pasosMotor =96;
DespVuelta = 5;
paso = pasosMotor*pos/DespVuelta; 
cam = DespVuelta*1/pasosMotor;
paso = paso-contador;
contador = contador + paso;

%% movimiento
hold on
A=sprintf('%.f',paso*sw);
fwrite(s,A);
for i =0:paso-1
    vb = traslacion([cam*sw 0 0],vb);
    set(gbm,'Vertices',vb(1:3,:)');
    pause(10/1000)
end
end
end