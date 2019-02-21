% use el codigo anterior pero ingrese por consola 3 textos donde se desee
% girar un angulo alrededor del eje x, eje y, eje z
function practica2
clc; clear all; close all;
fig_1=figure;
xlabel('Eje x'); ylabel('Eje y'); zlabel('Eje z');
n=10;m=10;a=10;
theta=0:2*pi/n:2*pi;
x=cos(theta);
y=sin(theta);
z=ones(1,length(x))*10;
z2=ones(1,length(x))*0;
v=[x x;y y;z z2;ones(1,length(z)) ones(1,length(z))];
for j=1:n
    caras(j,:)=[j j+1 j+n+1];
    caras(j+n,:)=[n+1+j n+j+2 j+1];
end
g=patch('Faces',caras,'Vertices',v(1:3,:)');
axis([-a a -a a -a a]);
grid on;
xPan = 20;          yPan = 20;          ancPan = 200;       altPan = 120;
xIni = xPan + 20;                       yIni = yPan + 50;
ancSli = 120;                           altSli = 20;
AngAntZ=0;  AngAntX1=0;   AngAntX2=0;
panelEnt = uipanel(fig_1, 'units','pixels', 'Position',...
    [xPan yPan ancPan altPan], 'Title','Entrada de ?ngulos','FontSize',9);% Construye un panel en la pare inferior
t1_ = uicontrol(panelEnt,'style','edit','Position',[xIni yIni ancSli altSli],'callback',@sliderAng1);
t2_ = uicontrol(panelEnt,'style','edit','Position',[xIni yIni-30 ancSli altSli],'callback',@sliderAng1);
t3_ = uicontrol(panelEnt,'style','edit','Position',[xIni yIni-60 ancSli altSli],'callback',@sliderAng1);
end

function sliderAngX(mane, evento)
ang_z = round(get(mane,'Value'))*pi/180;
BandAng_1=1;
dinaDire(ang_z,BandAng_1)
end
function sliderAngY(mane, evento)
ang_z = round(get(mane,'Value'))*pi/180;
BandAng_1=2;
dinaDire(ang_z,BandAng_1)
end
function sliderAngZ(mane, evento)
ang_z = round(get(mane,'Value'))*pi/180;
BandAng_1=3;
dinaDire(ang_z,BandAng_1)
end
function dinaDire(valDesli,BandAng)
   BandAng 
ang_z=valDesli;
RZg=[cos(ang_z) 0 -sin(ang_z)  0;0 1 0  0;...
    sin(ang_z) 0 cos(ang_z) 0;0 0 0 1];
GTodoz=RZg*v;

set(g,'vertices',GTodoz(1:3,:)');

drawnow

end



