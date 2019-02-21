clear all,clc; close all;
grid on
hold on
C=[0;0;0];
A=[1;1;1];
B=[-1;1;-1];
CA=A-C;
CB=B-C;
n=cross(CA,CB);
syms x y z
X=[x;y;z];
CX=X-C;
u=dot(n,CX);
z=solve(u,z);
CA1=[CA(1:2,:);0];
r=CA1'*CA/norm(CA1);
t=0:2*pi/100:2*pi;

axis([-3 3 -3 3 -3 3])
view([235 25])
tiempo=max(t)/(length(t));
hold on;
for i=1:length(t)
    x1=r*cos(t(1,i))+C(1,1)
    y1=r*sin(t(1,i))+C(2,1)
    z1=zeros(length(x1),1);
    for j=1:length(x1)
        a=x1(1,j);
        b=y1(1,j);
%         z1(j,1)=eval(subs(z,[x,y],[a,b]));
    end
    pause(tiempo);
    plot(x1,y1,'*');
end





