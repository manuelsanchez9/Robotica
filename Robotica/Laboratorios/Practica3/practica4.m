function practica4
clc ; close all; clear;
%% grafica
am = 15;
amn = -15;
fig_1 = figure();
xlabel('eje x'),ylabel('eje y'),zlabel('eje z');
view([135 20]); grid on;
axis([amn am amn am amn am])
%% valores iniciales
xi = 0;
cil = [0 3]; 


%% Construcion de cilindros
nC = 10; % numero de cilidro
[ x, y, z z1  ] = generarSolido( nC, cil);
v = [x x; y y;z z1; ones(1,length(z)) ones(1,length(z))];
v1 = [x x; y y;z z1; ones(1,length(z)) ones(1,length(z))];
v1 = traslacion([0 2 3],v1);
v2 = [x x; y y;z z1; ones(1,length(z)) ones(1,length(z))];
v2 = traslacion([0 0 6],v2);
carasC = Caras3D(nC);
g=patch('Faces',carasC,'Vertices',v(1:3,:)','facecolor',[0 1 0]);
g1=patch('Faces',carasC,'Vertices',v1(1:3,:)','facecolor',[0 1 0]);
g2=patch('Faces',carasC,'Vertices',v2(1:3,:)','facecolor',[0 1 0]);
%% pro


xPan = 20;          yPan = 20;          ancPan = 200;       altPan = 120;
xIni = xPan + 20;                       yIni = yPan + 50;
ancSli = 120;                           altSli = 20;
AngAntZ=0;  AngAntX1=0;   AngAntX2=0;
panelEnt = uipanel(fig_1, 'units','pixels', 'Position',...
    [xPan yPan ancPan altPan], 'Title','Entrada de angulos','FontSize',9);% Construye un panel en la pare inferior
t1_slider = uicontrol(panelEnt,'style','slider',...
    'Max',90,'Min',-90,'Value',0, 'SliderStep',[0.05 0.2],...
    'callback',@sliderAng1, 'Position',[xIni yIni ancSli altSli]);
t2_slider = uicontrol(panelEnt,'style','slider',...
    'Max',90,'Min',-90,'Value',0, 'SliderStep',[0.05 0.2],...
     'callback',@sliderAng2, 'Position',[xIni yIni-25 ancSli altSli]);
t3_slider = uicontrol(panelEnt,'style','slider',...
    'Max',90,'Min',-90,'Value',0, 'SliderStep',[0.05 0.2],...
     'callback',@sliderAng3, 'Position',[xIni yIni-50 ancSli altSli]);
ang_z = 0;
ang_y1 = 0;
ang_y2 = 0;
function sliderAng1(mane, evento)
ang_z = round(get(mane,'Value'))*pi/180;
dinaDire()
end
function sliderAng2(mane, evento)
ang_y1 = round(get(mane,'Value'))*pi/180;
dinaDire()
end
function sliderAng3(mane, evento)
ang_y2 = round(get(mane,'Value'))*pi/180;
dinaDire()
end
function dinaDire()
    %% movimiento pieza 3
    
    tras=[1 0 0  0;
    0 1 0  0;
    0 0 1 -6;
    0 0 0 1];
RZg=[cos(ang_y2) 0 -sin(ang_y2)  0;
    0 1 0  0;
    sin(ang_y2) 0 cos(ang_y2) 6;
    0 0 0 1];

GT3=RZg*tras*v2;
set(g2,'vertices',GT3(1:3,:)');
%% movimiento pieza 2 y 3
tras=[1 0 0  0;
    0 1 0  0;
    0 0 1 -3;
    0 0 0 1];
RZg=[cos(ang_y1) 0 -sin(ang_y1)  0;
    0 1 0  0;
    sin(ang_y1) 0 cos(ang_y1) 3;
    0 0 0 1];
GT2=RZg*tras*v1;
GT23=RZg*tras*GT3;
set(g1,'vertices',GT2(1:3,:)');
set(g2,'vertices',GT23(1:3,:)');

%% movimiento pieza 1, 2 y 3
tras=[1 0 0  0;
    0 1 0  0;
    0 0 1 0;
    0 0 0 1];
RZg=[cos(ang_z) -sin(ang_z) 0  0;
    sin(ang_z) cos(ang_z) 0  0;
    0 0 1 0;
    0 0 0 1];
GT1=RZg*tras*v;
GT12=RZg*tras*GT2;
GT123=RZg*tras*GT23;
set(g,'vertices',GT1(1:3,:)');
set(g1,'vertices',GT12(1:3,:)');
set(g2,'vertices',GT123(1:3,:)');
drawnow

end
end