clc; clear; close all;
n = 4; % Numero de puntos que se desea en la figura 
a = 3; % dimensiones del eje del sistema
t = 0:2*pi/n:2*pi; %parametro t que genera un n?mero de n+1 puntos
x = cos(t); %coordenas de x
y = sin(t); %coordenas de y
z = ones(1,length(t));
z1 = 0*ones(1,length(t));

v = [x x; y y;z z1];
% plot3(v(1,:),v(2,:),v(3,:))
grid on
axis([-a a -a a -a a]); % aqui se genera el dimensionamiento de los ejes del sistema
view([135, 25]); % angulo de la vista 

for i = 1:n % construcion de caras laterales
    caras(i,:) = [i i+1 i+n+2];
    caras(n+i,:) = [i n+i+1 i+n+2];
end
for i = 1:n-2 % construcci?n de 
    caras(i+2*n,:) = [1 i+1 i+2];
    caras(i+3*n-2,:) = [n+2 n+i+2 n+i+3];
end
g = patch('faces',caras,'vertices',v', 'facecolor',[0 1 0], 'edgecolor',[0 0.7 0]);
theta = pi*35/180;
pause(3);
rotz = [cos(theta) -sin(theta) 0;
    sin(theta) cos(theta) 0;
    0 0 1];
v1 = rotz*v;
drawnow
set(g,'vertices',v1')

