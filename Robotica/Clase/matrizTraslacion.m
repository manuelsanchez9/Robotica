%% limpiar
close all; clc; clear;
%% Codigo

v = [0 1; 0 1;0 1;1 1];
plot3(v(1,:),v(2,:),v(3,:))
view([135 25])
grid on
xlabel('Eje x'); ylabel('Eje y'); zlabel('Eje z');
%% translacion

a = 3;b = -2; c= 1;
% v1= v+[a a; b b; c c];
tra = [1 0 0 a; 
    0 1 0 b; 
    0 0 1 c]
v1 =tra*v;
hold on 
plot3(v1(1,:),v1(2,:),v1(3,:))
theta = pi/2;
% X
tra_rotX = [1 0 0 a; 
    0 cos(theta) -sin(theta) b; 
    0 sin(theta) cos(theta) c]
v2 =tra_rotX*v;
plot3(v2(1,:),v2(2,:),v2(3,:))
% Y
tra_rotY = [cos(theta) 0 -sin(theta) a; 
    0 1 0 b; 
    sin(theta) 0 cos(theta) c]
v3 =tra_rotY*v;
plot3(v3(1,:),v3(2,:),v3(3,:))
% Z
tra_rotZ = [ cos(theta) -sin(theta) 0 a;
    sin(theta) cos(theta) 0 b;
    0 0 1 c]
v4 =tra_rotZ*v;
plot3(v4(1,:),v4(2,:),v4(3,:));

