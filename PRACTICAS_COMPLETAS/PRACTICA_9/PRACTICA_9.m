function practiceNine
clc;clear all;close all;
ai = -7;
as = 7;
fig_1 = figure();

n=30;
%OBTENEMOS LOS ARREGLOS PARA ARMAR EL CONO
[x, y, z, z1] = generateCone(n);
view([135 20]); grid on;
axis([ai as ai as ai as])
xlabel('Eje X')
ylabel('Eje Y')
zlabel('Eje Z')
hold on

%%PINTAMOS LOS CONOS
a=[x 1/2*x;y 1/2*y;z z1; ones(1,length(z)) ones(1,length(z))];
b = [x 1/2*x;y 1/2*y;z z1; ones(1,length(z)) ones(1,length(z))];
c = [x 1/2*x;y 1/2*y;z z1; ones(1,length(z)) ones(1,length(z))];
b = traslacion([0 0 2], b);
c = traslacion([0 0 4], c);
caras = carasCone(n);
cone_1 = patch('faces',caras,'vertices',a(1:3,:)','facecolor',[46/255 46/255 65/255],'edgecolor',[1 1 1])
cone_2 = patch('faces',caras,'vertices',b(1:3,:)','facecolor',[4/255 150/255 89/255],'edgecolor',[1 1 1])
cone_3 = patch('faces',caras,'vertices',c(1:3,:)','facecolor',[150/255 10/255 198/255],'edgecolor',[1 1 1])
set(cone_1,'vertices')
set(cone_2,'vertices')
set(cone_3,'vertices')

%%PINTAMOS ESFERAS
[x1, y1, z11] = generateSphere(n);
E1 = [1/2*x1;1/2*y1;1/2*z11; ones(1,length(z11))];
E2 = [1/2*x1;1/2*y1;1/2*z11; ones(1,length(z11))];
E1 = traslacion([0 0 3/2], E1);
E2 = traslacion([0 0 7/2], E2);
carasS = carasSphere(n)
Sphere_1 = patch('faces',carasS,'vertices',E1(1:3,:)','facecolor','r')
Sphere_2 = patch('faces',carasS,'vertices',E2(1:3,:)','facecolor','r')
set(Sphere_1,'vertices')
set(Sphere_2,'vertices')

%%GENERAMOS SLIDERS
panelX = 20;          
panelY = 20;          
panelWidth = 200;       
panelHeight = 130;
xIni = panelX + 5;                       
yIni = panelY + 60;
ancSli = 145;                   
altSli = 20;
sliderStep = 0.00277;

panelEnt = uipanel(fig_1, 'units', 'pixels', 'Position',...
    [panelX panelY panelWidth panelHeight], 'Title', 'Entrada de ángulos',...
    'FontSize', 10, 'BackgroundColor', [0.7 0.3 0.2]);
slider_1 = uicontrol(panelEnt, 'style', 'slider',...
    'Max', 90, 'Min', -90, 'Value', 0, 'SliderStep', [sliderStep sliderStep],...
    'callback', @sliderAng1, 'Position', [xIni yIni ancSli altSli]);
slider_2 = uicontrol(panelEnt, 'style', 'slider',...
    'Max', 90, 'Min', -90, 'Value', 0, 'SliderStep', [sliderStep sliderStep],...
    'callback', @sliderAng2, 'Position', [xIni yIni-30 ancSli altSli]);
slider_3 = uicontrol(panelEnt, 'style', 'slider',...
    'Max', 180, 'Min', -180, 'Value', 0, 'SliderStep', [sliderStep sliderStep],...
    'callback', @sliderAng3, 'Position', [xIni yIni-60 ancSli altSli]);

angleX1 = 0;
angleX2 = 0;
angleZ = 0;

function sliderAng1(fuente, evento)
    angleX1 = round(get(fuente, 'Value')) * pi/180;
    movement()
end

function sliderAng2(fuente, evento)
    angleX2 = round(get(fuente, 'Value')) * pi/180;
    movement()
end

function sliderAng3(fuente, evento)
    angleZ = round(get(fuente, 'Value')) * pi/180;
    movement()
end

function movement()
    %%MOVIMIENTO PIEZA SUPERIOR
    tras=[1 0 0  0;
          0 1 0  0;
          0 0 1 -7/2;
          0 0 0 1];
    rot = [cos(angleX1) 0 sin(angleX1) 0; 0 1 0 0;...
        -sin(angleX1) 0 cos(angleX1) 7/2; 0 0 0 1];
    aux2 = rot * tras * E2;
    cone23 = rot * tras * c;
    set(cone_3, 'vertices', cone23(1:3, :)');
    set(Sphere_2, 'vertices', aux2(1:3, :)');
    
    %%MOVIMIENTO PIEZA MEDIA
    tras=[1 0 0  0;
          0 1 0  0;
          0 0 1 -3/2;
          0 0 0 1];
    rot = [cos(angleX2) 0 sin(angleX2) 0; 0 1 0 0;...
        -sin(angleX2) 0 cos(angleX2) 3/2; 0 0 0 1];
    aux1 = rot * tras * E1;
    Sphera2 = rot * tras * aux2;
    cone12 = rot * tras * b;
    cone13 = rot * tras * cone23;
    set(cone_2, 'vertices', cone12(1:3, :)');
    set(cone_3, 'vertices', cone13(1:3, :)');
    set(Sphere_1, 'vertices', aux1(1:3, :)');
    set(Sphere_2, 'vertices', Sphera2(1:3, :)');   
    
    %%ROTACIÓN SOBRE EL MISMO EJE (Z)
    tras=[1 0 0  0;
          0 1 0  0;
          0 0 1 0;
          0 0 0 1];
    rot = [cos(angleZ) sin(angleZ) 0  0;...
           -sin(angleZ) cos(angleZ) 0  0; 0 0 1 0;...
           0 0 0 1];
       
    cone233 = rot * tras * cone13;
    set(cone_3, 'vertices', cone233(1:3, :)');
    aux22 = rot * tras * Sphera2;
    set(Sphere_2, 'vertices', aux22(1:3, :)');
    cone122 = rot * tras * cone12;
    set(cone_2, 'vertices', cone122(1:3, :)');
    aux11 = rot * tras * aux1;
    set(Sphere_1, 'vertices', aux11(1:3, :)');
    cone11 = rot * tras * a;
    set(cone_1, 'vertices', cone11(1:3, :)');
    drawnow
end
end