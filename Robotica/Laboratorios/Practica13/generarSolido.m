
function [ p1, p2 ,p3, p4 ] = generarSolido( n, m)
theta=0:2*pi/n:2*pi;
p1=cos(theta+pi/4);
p2=sin(theta+pi/4);
p3=ones(1,length(theta))*m(1);
p4=ones(1,length(theta))*m(2);
end
