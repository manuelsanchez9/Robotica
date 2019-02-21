function practica13
clc ; close all; clear;
contador =0;
limiteS = 40
%% grafica
am = limiteS+5;
amn = -5;
fig = figure();
xlabel('eje x'),ylabel('eje y'),zlabel('eje z');
view([135 20]); grid on;
axis([amn am amn am amn am])
%% valores iniciales
xi = -0.5;
cil = [0 limiteS+2]; 
bar1 = [0 10];
bar2 = [0 2];

%% Construcion de tornillo y varilla lisa
nC = 10; % numero caras
[ z, y, x, x1 ] = generarSolido( nC, cil);
z = 0.3*z;
y = 0.3*y;
vc = [x x1; y y;z z; ones(1,length(z)) ones(1,length(z))];

carasC = Caras3D(nC);
vc1 = traslacion([xi 0 2],vc);
gc1=patch('Faces',carasC,'Vertices',vc1(1:3,:)','facecolor',[0 1 0], 'edgecolor',[0 1 0]);
vc1 = traslacion([xi 0 8],vc);
gc2=patch('Faces',carasC,'Vertices',vc1(1:3,:)','facecolor',[0 1 0],'edgecolor',[0 0.5 0]);

%% geracion de barra 1
nB = 4;
[ x, y, z, z1 ] = generarSolido( nB, bar1);
vb = [x x; y y;z z1; ones(1,length(z)) ones(1,length(z))];
% vb = traslacion([xi 0 2],vb);
carasB = Caras3D(nB);
vb1 = traslacion([-1 0 0],vb);
gb=patch('Faces',carasB, 'Vertices',vb1(1:3,:)', 'facecolor',[0 0 0], 'edgecolor',[0 0 0]);
vb1 = traslacion([cil(2) 0 0],vb);
gb=patch('Faces',carasB, 'Vertices',vb1(1:3,:)', 'facecolor',[0 0 0], 'edgecolor',[0 0 0]);

%% geracion motor
[ y, z, x, x1 ] = generarSolido( nC, bar2);
vb2 = [x x1; y y;z z; ones(1,length(z)) ones(1,length(z))];
vb2 = traslacion([-3 0 8],vb2);
gb2=patch('Faces',carasC, 'Vertices',vb2(1:3,:)', 'facecolor',[0 1 0.8], 'edgecolor',[0 0 0.9]);

%% geracion de barra de movimiento
nB = 4;
[ x, y, z, z1 ] = generarSolido( nB, bar1);
x = 0.5*x;
y = 0.5*y;
vb = [x x; y y;z z1; ones(1,length(z)) ones(1,length(z))];
carasB = Caras3D(nB);
gbm=patch('Faces',carasB, 'Vertices',vb(1:3,:)', 'facecolor',[0 0 1], 'edgecolor',[0 1 0]);
%% conexcion
% 
% %borra datos previos
% delete(instrfind({'Port'},{'COM4'}));
% %Crear el objecto serie
% s = serial('COM4','BaudRate',9600,'Terminator','CR/LF');
% warning('off','MATLAB:serial:fscanf:unsuccessfulRead');
% %Abrir puerto
% fopen(s);
% 
% 
% %% ventana
% xPan = 20;          yPan = 20;          ancPan = 200;       altPan = 120;
% xIni = xPan + 20;                       yIni = yPan + 50;
% ancSli = 120;                           altSli = 20;
% AngAntZ=0;  AngAntX1=0;   AngAntX2=0;
% panelEnt = uipanel(fig, 'units','pixels', 'Position',...
%     [xPan yPan ancPan altPan], 'Title','Entrada de angulo','FontSize',9);% Construye un panel en la pare inferior
% 
%     t1_slider = uicontrol(panelEnt,'Style', 'edit',...    
%     'callback',@Send, 'Position',[xIni yIni ancSli altSli],'String', 0);
% 
% function Send(mane, evento)
%     posicion = str2double(get(mane,'String'));  
%     
%     if(posicion>limiteS)
%        posicion =  limiteS;
%     end
%     if(posicion < 0)
%        posicion =  0;
%     end
%     movi = posicion  -contador;
%     
%     contador = posicion
%     mover(movi)
%     set(mane,'String','');
% end
% %% movimiento
% function mover(pos)
%     sw = 1;
%     if(pos<0)
%       sw = -1;
%       pos = pos*-1;
%     end        
%     pasosMotor =98;
%     DespVuelta = 5;
%     paso = pasosMotor*pos/DespVuelta
%     cam = DespVuelta*1/pasosMotor;
% 
% 
%     %% movimiento
%     hold on
%     A=sprintf('%.f',paso*sw);
%     fwrite(s,A);
%     for i =0:paso-1    
%         vb = traslacion([cam*sw 0 0],vb);
%         set(gbm,'Vertices',vb(1:3,:)');
%         pause(10/1000)
%     end
%     end
end