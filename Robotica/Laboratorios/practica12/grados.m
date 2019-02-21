function grados()
close all; clc; clear;
fig_1=figure;
%Conection arduino
% doc fwritef
%borra datos previos
delete(instrfind({'Port'},{'COM4'}));
%Crear el objecto serie
s = serial('COM4','BaudRate',9600,'Terminator','CR/LF');
warning('off','MATLAB:serial:fscanf:unsuccessfulRead');
%Abrir puerto
% fopen(s);
%Cerrar puerto
%Send variables
%fwrite(s,'b');
%fwrite(s,'a');
%fclose(s)
%fscanf(s,'%d');
fopen(s);
function Send(mane, evento)
try

    ang_x =get(mane,'String')
    
    fwrite(s,ang_x);
%     pause(0.010);
    a = fscanf(s,'%s')
set(mane,'String','');
  catch 
   delete(instrfind({'Port'},{'COM4'}));
end
% delete(instrfind({'Port'},{'COM4'}));
end

xPan = 20;          yPan = 20;          ancPan = 200;       altPan = 120;
xIni = xPan + 20;                       yIni = yPan + 50;
ancSli = 120;                           altSli = 20;
AngAntZ=0;  AngAntX1=0;   AngAntX2=0;
panelEnt = uipanel(fig_1, 'units','pixels', 'Position',...
    [xPan yPan ancPan altPan], 'Title','Entrada de angulo','FontSize',9);% Construye un panel en la pare inferior

    t1_slider = uicontrol(panelEnt,'Style', 'edit',...    
    'callback',@Send, 'Position',[xIni yIni ancSli altSli],'String', 0);
end