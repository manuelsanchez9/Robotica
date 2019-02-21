clear; clc; close all

A = [0 1; 0 2];
plot(A(1,:),A(2,:));
axis([ -5 5 -5 5])
grid on
xlabel('Eje x');
ylabel('Eje y');

v = inputdlg('Vector 1:  '); 
w = inputdlg('Vector 2:  '); 

v = str2num(v{1,1});
w = str2num(w{1,1});
z = v+w;
figure
plot(v(1,:),v(2,:));
hold on
plot(w(1,:),w(2,:));
plot(z(1,:),z(2,:));
grid on

% v1 = [0+w(1,2) 1+w(1,2); 0+w(2,2) 2+w(2,2)];
% w1 = [0+v(1,2) -3+v(1,2); 0+v(2,2) 4+v(2,2)];
[v2, w2] = Paralelogramo(v,w);

plot(v2(1,:),v2(2,:));
plot(w2(1,:),w2(2,:));

s = [v v2 w  w2];
a = max(max(abs(s)));
a= a +1; 
axis([-a a -a a])




