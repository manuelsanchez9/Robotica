function practica6
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
cil = [0 5]; 


%% Construcion de cilindros
nC = 10; % numero de cilidro
[ x, y, z z1  ] = generarSolido( nC, cil);
v = [x x; y y;z z1; ones(1,length(z)) ones(1,length(z))];
v1 = [x x; y y;z z1; ones(1,length(z)) ones(1,length(z))];
v1 = traslacion([0 2 cil(2)],v1);
v2 = [x x; y y;z z1; ones(1,length(z)) ones(1,length(z))];
v2 = traslacion([0 0 cil(2)*2],v2);
carasC = Caras3D(nC);
g=patch('Faces',carasC,'Vertices',v(1:3,:)','facecolor',[0 1 0]);
g1=patch('Faces',carasC,'Vertices',v1(1:3,:)','facecolor',[0 1 0]);
g2=patch('Faces',carasC,'Vertices',v2(1:3,:)','facecolor',[0 1 0]);
%% pro


% xPan = 20;          yPan = 20;          ancPan = 200;       altPan = 120;
% xIni = xPan + 20;                       yIni = yPan + 50;
% ancSli = 120;                           altSli = 20;
% AngAntZ=0;  AngAntX1=0;   AngAntX2=0;
% panelEnt = uipanel(fig_1, 'units','pixels', 'Position',...
%     [xPan yPan ancPan altPan], 'Title','Entrada de angulos','FontSize',9);% Construye un panel en la pare inferior
% t1_slider = uicontrol(panelEnt,'style','slider',...
%     'Max',90,'Min',-90,'Value',0, 'SliderStep',[0.05 0.2],...
%     'callback',@sliderAng1, 'Position',[xIni yIni ancSli altSli]);
% t2_slider = uicontrol(panelEnt,'style','slider',...
%     'Max',90,'Min',-90,'Value',0, 'SliderStep',[0.05 0.2],...
%      'callback',@sliderAng2, 'Position',[xIni yIni-25 ancSli altSli]);
% t3_slider = uicontrol(panelEnt,'style','slider',...
%     'Max',90,'Min',-90,'Value',0, 'SliderStep',[0.05 0.2],...
%      'callback',@sliderAng3, 'Position',[xIni yIni-50 ancSli altSli]);


pause(1)


ang_z = 0;
ang_y1 = 0;
ang_y2 = 0;
function sliderAng1(value,value2, value3)
    if(value2 <= 138)
        value2 = 138;
    end
    
    if(value2 >= 900)
        value2 = 900;
    end
    
    if(value3 <= 138)
        value3 = 138;
    end
    
    if(value3 >= 900)
        value3 = 900;
    end
    ang_z=(2/1023*value-1)*pi;
     ang_y1=(2/1023*value2-1)*pi;
     ang_y2=(2/1023*value3-1)*pi;
% ang_z = ang_z+ round(value)*pi/180;
dinaDire()
end
function sliderAng2(value)
    ang_y1=(2/1023*value-1)*pi;
% ang_y1 =  round(value)*pi/180;
dinaDire()
end
function sliderAng3(value)
    ang_y2=(2/1023*value-1)*pi;
% ang_y2 = round(value)*pi/180;
dinaDire()
end
function dinaDire()
    %% movimiento pieza 3
    
    tras=[1 0 0  0;
    0 1 0  0;
    0 0 1 -cil(2)*2;
    0 0 0 1];
RZg=[cos(ang_y2) 0 -sin(ang_y2)  0;
    0 1 0  0;
    sin(ang_y2) 0 cos(ang_y2) cil(2)*2;
    0 0 0 1];

GT3=RZg*tras*v2;
set(g2,'vertices',GT3(1:3,:)');
%% movimiento pieza 2 y 3
tras=[1 0 0  0;
    0 1 0  0;
    0 0 1 -cil(2);
    0 0 0 1];
RZg=[cos(ang_y1) 0 -sin(ang_y1)  0;
    0 1 0  0;
    sin(ang_y1) 0 cos(ang_y1) cil(2);
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

%Conection arduino
% doc fwritef
%borra datos previos
delete(instrfind({'Port'},{'COM4'}));
%Crear el objecto serie
s = serial('COM4','BaudRate',9600,'Terminator','CR/LF');
warning('off','MATLAB:serial:fscanf:unsuccessfulRead');
%Abrir puerto
fopen(s);
%Cerrar puerto
%Send variables
%fwrite(s,'b');
%fwrite(s,'a');
%fclose(s)
%fscanf(s,'%d');
try
while(1)
    paramater = fscanf(s,'%d,%d,%d')
   
    if(length(paramater) == 3)
        
        sliderAng1(paramater(1),paramater(2),paramater(3));
%       sliderAng2(paramater(2));
%         sliderAng3(paramater(3));
%         switch paramater
%             case 1
%                 sliderAng2(-1);
%             case 2
%                 sliderAng2(1);
%             otherwise
%                 sliderAng3(10);
%         end
end
end
   catch 
   delete(instrfind({'Port'},{'COM4'}));
end
end