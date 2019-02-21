%borrar previos
delete(instrfind({'Port'},{'COM4'}));
%crear objeto serie
s = serial('COM4','BaudRate',9600,'Terminator','CR/LF');
warning('off','MATLAB:serial:fscanf:unsuccessfulRead');
%abrir puerto
fopen(s);% parámetros de medidas
tmax = 100; % tiempo de captura en s
rate = 33; % resultado experimental (comprobar)
% preparar la figura
f = figure('Name','Captura');
a = axes('XLim',[0 tmax],'YLim',[0 5.1]);
xlabel('Tiempo (s)')
ylabel('Voltaje (V)')
title('Captura de voltaje en tiempo real con Arduino')
A=[0 0 0 0;0 0 0 0;-5 0 5 10]
seg1=[A(:,1) A(:,2)]
seg2=[A(:,2) A(:,3)]
seg3=[A(:,3) A(:,4)]
daspect([1 1 1])
s1=plot3(seg1(1,:),seg1(2,:),seg1(3,:),'r')
hold on
s2=plot3(seg2(1,:),seg2(2,:),seg2(3,:),'g')
s3=plot3(seg3(1,:),seg3(2,:),seg3(3,:),'b')
axis([-10 10 -10 10 -5 10]);
view([125,35])
grid on

% inicializar
v1 = zeros(1,tmax*rate);
v2 = zeros(1,tmax*rate);
i = 1;
t = 0;

% ejecutar bucle cronometrado
tic
while t<tmax
    t = toc;
    % leer del puerto serie
    a = fscanf(s,'%d')';%%para recibir dos datos  a = fscanf(s,'%d,%d')';
    q=(2/1023*a-1)*pi;
    % dibujar en la figura
    M=[cos(q) 0 -sin(q);0 1 0;sin(q) 0 cos(q)];
        v=M*[seg2 seg3];
        set(s2,'XData',v(1,1:2),'YData',v(2,1:2),'ZData',v(3,1:2))
        set(s3,'XData',v(1,3:4),'YData',v(2,3:4),'ZData',v(3,3:4))
        drawnow
    % seguir
    i = i+1;
end
% resultado del cronometro
clc;
fprintf('%g s de captura a %g cap/s \n',t,i/t);
	
savefigure('captura_multi','s',[4.5 3],'po','-dpdf')
% Limpiar la escena del crimen
fclose(s);
delete(s);
clear s;