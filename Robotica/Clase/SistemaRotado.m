clear; close all; clc;
a = 2;
A = [0 1;0 1];
g=plot(A(1,:),A(2,:));
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
    drawnow
end
