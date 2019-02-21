clear; clc ; close all;

a = [3 0 0];
b = [0 2 0];
c = [0 0 1];
z = a+b;
w= b+c;

% plot3(a);
% hold on
% grid on
% axis([-2 2 -2 2])
q = [ones(1,3)*a(1,1);ones(1,3)*a(1,2);ones(1,3)*a(1,3)];
w = [ones(1,3)*b(1,1);ones(1,3)*b(1,2);ones(1,3)*b(1,3)];
e = [ones(1,3)*c(1,1);ones(1,3)*c(1,2);ones(1,3)*c(1,3)];

plot3(e(:,1),e(:,2),e(:,3))
hold on
grid on
plot3(w(1,:),w(2,:),w(3,:))
plot3(q(:,1),q(:,2),q(:,3))
