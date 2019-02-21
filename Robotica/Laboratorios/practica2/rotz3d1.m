clc;clear all;
n=50;%n es el numero de puntos que se desea en la figura
a=3;%dimensiona lo ejes del sistema
t=0:2*pi/n:2*pi; % parámetro t que genera un número de n+1 puntos
x=cos(t);%coordenadas x de los vectores para la figura
z=sin(t);%coordenadas y de los vectores para la figura
y=3*ones(1,length(t));%coordenadas z de los vectores para la figura
% length(t) mide el tamaño de t ones genera una matriz de unos
%de tamaño 1xlongitud de t
y1=0*ones(1,length(t));% las coordenadas z de la segunda figura
v=[x x;y y1;z z];% La matriz de puntos de las dos figuras
%plot3(v(1,:),v(2,:),v(3,:))% grafica las figuras
for i=1:n % cosntruimos la matriz de caras laterales
    caras(i,:)=[i i+1 i+n+2];
    caras(n+i,:)=[i n+i+1 n+i+2];
end
for i=1:n-2 % cosntruimos de la matriz de caras, las caras superiores e inferiores
    caras(i+2*n,:)=[1 i+1 i+2];
    caras(i+3*n-2,:)=[n+2 n+i+2 n+i+3];
end
g=patch('Faces',caras,'Vertices',v','facecolor',[0 1 0],'edgecolor',[0 1 0]);%pinta todo
grid on%pone las grillas
axis([-a a -a a -a a])%aquí se hace eldimensionamiento de los ejes del sistema
view([135,25])%Angulo de observación externo del sistema
pause(3)
theta=2*pi;
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
