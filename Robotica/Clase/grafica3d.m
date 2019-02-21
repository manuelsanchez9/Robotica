clear; close all; clc;
a = 6;
r = 2;
n = 4; %numero de puntos
theta = 0:2*pi / n:2*pi;
x = r*cos(theta);
y = r*sin(theta);
z = 1*ones(1,n+1);

vert = [x;y;z];
vert1 = [x;y;1/2*z];
for j = 1:n-2
    caras(j,:) = [1 1+j 2+j];
end
patch('faces',caras,'vertices',vert');
patch('faces',caras,'vertices',vert1');
axis([-a a -a a])
view([135 ,25])
a