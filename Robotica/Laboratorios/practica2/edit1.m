
function slider1
clc; clear all; close all;
fig_1=figure;
n=10;m=10;a=10;
theta=0:2*pi/n:2*pi;
x=cos(theta);
y=sin(theta);
z=ones(1,length(x))*10;
z2=ones(1,length(x))*0;
v=[x x;z z2; y y];
for j=1:n
    caras(j,:)=[j j+1 j+n+1];
    caras(j+n,:)=[n+1+j n+j+2 j+1];
end
g=patch('Faces',caras,'Vertices',v(1:3,:)', 'FaceColor',[0 1 0]);
axis([-a a -a a -a a]);
grid on;
xlabel('ejec x');ylabel('eje y');zlabel('eje z');
xPan = 20;          yPan = 20;          ancPan = 200;       altPan = 120;
xIni = xPan + 20;                       yIni = yPan + 50;
ancSli = 120;                           altSli = 20;
AngAntZ=0;  AngAntX1=0;   AngAntX2=0;
panelEnt = uipanel(fig_1, 'units','pixels', 'Position',...
    [xPan yPan ancPan altPan], 'Title','Entrada de ?ngulos','FontSize',9);% Construye un panel en la pare inferior

    t1_slider = uicontrol(panelEnt,'Style', 'edit',...    
    'callback',@sliderAng1, 'Position',[xIni yIni ancSli altSli],'String', 0);

 t2_slider = uicontrol(panelEnt,'Style', 'edit',...   
     'callback',@sliderAng2, 'Position',[xIni yIni-25 ancSli altSli],'String', 0);
 
  t3_slider = uicontrol(panelEnt,'Style', 'edit',...    
     'callback',@sliderAng3, 'Position',[xIni yIni-50 ancSli altSli],'String', 0);

ang_z=0;
ang_x = 0;
ang_y = 0;
% GTodo=pi/2;
function sliderAng1(mane, evento)
ang_x = round(str2num(get(mane,'String')))*pi/180;
BandAng_1=1;
dinaDire(BandAng_1)
end

function sliderAng2(mane, evento)
ang_y = round(str2num(get(mane,'String')))*pi/180;
BandAng_1=2;
dinaDire(BandAng_1)
end

function sliderAng3(mane, evento)
ang_z = round(str2num(get(mane,'String')))*pi/180;
BandAng_1=2;
dinaDire(BandAng_1)
end

function dinaDire(BandAng)
Todo=v;

RXg=[1 0 0;...
    0 cos(ang_x) -sin(ang_x);...
    0 sin(ang_x) cos(ang_x)];
GTodox=RXg*Todo;
Todo=GTodox;

RYg=[cos(ang_y) 0 -sin(ang_y);...
    0 1 0;...
    sin(ang_y) 0 cos(ang_y)];
GTodoy=RYg*Todo;
Todo=GTodoy;

RZg=[cos(ang_z) -sin(ang_z) 0;...
    sin(ang_z) cos(ang_z) 0;...
    0 0 1 ];
GTodoz=RZg*Todo;
Todo=GTodoz;


set(g,'vertices',Todo(1:3,:)');
drawnow


end
dinaDire(1)
end



