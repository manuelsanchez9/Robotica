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
x1=r*cos(t)+C(1,1);
y1=r*sin(t)+C(2,1);
z1=zeros(length(x1),1);
for i=1:length(x1)
    a=x1(1,i);
    b=y1(1,i);
    z1(i,1)=eval(subs(z,[x,y],[a,b]));
end
plot3(x1,y1,z1)