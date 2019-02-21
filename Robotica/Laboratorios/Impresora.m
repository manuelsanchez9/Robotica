function Impresora
clc ; close all; clear;
%% grafica
am = 15;
amn = -3;
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


%% Construcion de cilindros
nC = 4; 
[ z, y, x, x1 ] = generarSolido( nC, [0 10]);
vc = [x x1; y y;z z; ones(1,length(z)) ones(1,length(z))];

carasC = Caras3D(nC);
gc1=patch('Faces',carasC,'Vertices',vc(1:3,:)','facecolor',[0 0 0]);
vc1 = traslacion([0 10 0],vc);
gc2=patch('Faces',carasC,'Vertices',vc1(1:3,:)','facecolor',[0 0 0]);

%% geracion de barra 1
nB = 4;
[ x, z, y, y1 ] = generarSolido( nB, [0 10]);
vb = [x x; y y1;z z; ones(1,length(z)) ones(1,length(z))];
vb = traslacion([5 0 1.5],vb);
carasB = Caras3D(nB);
gb=patch('Faces',carasB, 'Vertices',vb(1:3,:)', 'facecolor',[0 0 1], 'edgecolor',[0 0 0.9]);

%% geracion barra2
[ z, y, x, x1 ] = generarSolido( nB, [0 2]);
vb2 = [x x1; y y;z z; ones(1,length(z)) ones(1,length(z))];
vb2 = traslacion([4.3 1.5 3],vb2);
gb2=patch('Faces',carasB, 'Vertices',vb2(1:3,:)', 'facecolor',[0 1 0.8], 'edgecolor',[0 1 0.8]);

%% geracion lapiz
nl = 10;
[ x, y, z, z1 ] = generarSolido( nl, [0 4.7]);
x = 0.3*x;
y = 0.3*y;
vl = [x x; y y;z z1; ones(1,length(z)) ones(1,length(z))];

vl = traslacion([6.3 1.4 -1],vl);
carasL  =Caras3D(nl);
gl=patch('Faces',carasL, 'Vertices',vl(1:3,:)', 'facecolor','g', 'edgecolor','g');

%% movimiento

 %punto inicial
 Lx = [ vl(1,1)];
 Ly = [ vl(2,1)];
 Lz = [ vl(3,1)];
 hold on
 lin = plot3(Lx,Ly,Lz);
 plot3(Lx,Ly,Lz,'Color','w');
 
 otra=[0:pi/10:4*pi]
 camotra=cos(otra)
camcotra=sin(otra)
 for t=0:pi/10:4*pi;
     cam=cos(t);
     camc=sin(t);
     vb = traslacion([cam 0 0],vb);
     set(gb,'Vertices',vb(1:3,:)');
     vb2 = traslacion([cam camc 0],vb2);
     set(gb2,'Vertices',vb2(1:3,:)');
     vl = traslacion([cam camc 0],vl);
     set(gl,'Vertices',vl(1:3,:)');
     
 %generar linea
    Lx = [Lx vl(1,1)];
    Ly = [Ly vl(2,1)];
    Lz = [Lz vl(3,1)];
    pause(0.1)
    set(lin,'XData',Lx,'YData',Ly,'ZData',Lz);
 end


end