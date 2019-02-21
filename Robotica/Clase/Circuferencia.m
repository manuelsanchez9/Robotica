clear; close all; clc;
r = 2;
n = 7; %numero de puntos
theta = 0:2*pi / n:2*pi;
x = r*cos(theta);
y = r*sin(theta);
vert = [x;y];
for j = 1:n-2
    caras(j,:) = [1 1+j 2+j];
end
patch('faces',caras,'vertices',vert');
