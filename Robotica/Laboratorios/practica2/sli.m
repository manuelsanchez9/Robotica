function sliderAng1(handled,evento)
valor = round(get(handled,'value'));
% dinamica(valor);
end
function dinamica(val)
theta=val;
k=100;
for i=1:k
    rotz=[cos(theta*i/k) -sin(theta*i/k) 0;...
        sin(theta*i/k) cos(theta*i/k) 0;...
        0 0 1];
    v1=rotz*v;
    pause(0.1)
    set(g,'Vertices',v1')
    drawnow
end
end
clear; clc; close all;
xPan = 20;          yPan = 20;          ancPan = 200;       altPan = 120;
xIni = xPan + 20;                       yIni = yPan + 50;
ancSli = 120;                           altSli = 20;
fig_1=figure;
panelEnt = uipanel(fig_1, 'units','pixels', 'Position',...
    [xPan yPan ancPan altPan], 'Title','Entrada de ?ngulos','FontSize',9);% Construye un panel en la pare inferior
t1_slider = uicontrol(panelEnt,'style','slider',...
    'Max',90,'Min',-90,'Value',0, 'SliderStep',[0.05 0.2],...
    'callback',@sliderAng1, 'Position',[xIni yIni ancSli altSli]);
xlabel('Eje x');
ylabel('Eje y');
zlabel('Eje z');

