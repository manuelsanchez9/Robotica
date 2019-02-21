clc ; close all; clear;
%% grafica
am = 15;
amn = -3;
fig = figure();
xlabel('eje x'),ylabel('eje y'),zlabel('eje z');
view([135 20]); grid on;
axis([amn am amn am amn am])
%% valores iniciales
xi = 0;
cil = [0 10]; 
bar1 = [0 10];
bar2 = [0 2];

%% Construcion de cilindros
nC = 10; % numero de cilidro
[ z, y, x, x1 ] = generarSolido( nC, cil);
vc = [x x1; y y;z z; ones(1,length(z)) ones(1,length(z))];

carasC = Caras3D(nC);
gc1=patch('Faces',carasC,'Vertices',vc(1:3,:)','facecolor',[0 1 0]);
vc1 = traslacion([0 10 0],vc);
gc2=patch('Faces',carasC,'Vertices',vc1(1:3,:)','facecolor',[0 1 0]);

%% geracion de barra 1
nB = 4;
[ x, z, y, y1 ] = generarSolido( nB, bar1);
vb = [x x; y y1;z z; ones(1,length(z)) ones(1,length(z))];
vb = traslacion([xi 0 2],vb);
carasB = Caras3D(nB);
gb=patch('Faces',carasB, 'Vertices',vb(1:3,:)', 'facecolor',[0 0 1], 'edgecolor',[0 0 0.9]);

%% geracion barra2
[ z, y, x, x1 ] = generarSolido( nB, bar2);
vb2 = [x x1; y y;z z; ones(1,length(z)) ones(1,length(z))];
vb2 = traslacion([xi 2 4],vb2);
gb2=patch('Faces',carasB, 'Vertices',vb2(1:3,:)', 'facecolor',[0 1 0.8], 'edgecolor',[0 0 0.9]);

%% geracion lapiz
nl = 8;
[ x, y, z, z1 ] = generarSolido( nl, [0 4]);
x = 0.1*x;
y = 0.1*y;
vl = [x x; y y;z z1; ones(1,length(z)) ones(1,length(z))];

vl = traslacion([xi+2 2 1],vl);
carasL  =Caras3D(nl);
gl=patch('Faces',carasL, 'Vertices',vl(1:3,:)');

%% movimiento
paso = 20; 
cam = 10/paso;
lx = [0 0];
ly = [0 0];
lz = [0 0];
hold on
glin = plot3(lx,ly,lz);
set(glin,'LineWidth',2);
cam2 = cam;
paso2 = 2*paso;
for i =0:paso2-1
    if(mod(i,2)== 0)
        cam2 = cam2*-1;
    end
    if(paso == i)
        cam = cam*-1;
        cam2 = cam2 + 2;
    end
    
    vb = traslacion([cam 0 0],vb);
    set(gb,'Vertices',vb(1:3,:)');
    vb2 = traslacion([cam cam2 0],vb2);
    set(gb2,'Vertices',vb2(1:3,:)');
    vl = traslacion([cam cam2 0],vl); %traslacion de puntero o lapiz
    set(gl,'Vertices',vl(1:3,:)');
    
    %generacion de linea
    lx = [lx vl(1,1)];
    ly = [ly vl(2,1)];
    lz = [lz vl(3,1)];
    
    set(glin,'XData',lx,'YData',ly,'ZData',lz);
    pause(0.1)
end