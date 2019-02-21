clear; close all; clc;
a = 6;
% A = [0 3 2;0 2 5];
% g = patch('faces',[1 2 3],'vertices',A')

A = [1 -1 -1 1;1 1 -1 -1];
g=patch('faces',[1 2 3;1 3 4],'vertices',A');

hold on
axis([-a a -a a])
grid on
phi = pi;

for i = 1:360
    rot =[cos(phi*i/360) -sin(phi*i/360);
        sin(phi*i/360) cos(phi*i/360)];
    A1 = rot*A;
    pause(0.001);
    set(g,'Xdata',A1(1,:), 'YData',A1(2,:));
    set(g,'facecolor',[0 i/360 1]);
    drawnow
end
