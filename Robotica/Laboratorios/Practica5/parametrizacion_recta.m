t=0:0.01:5;
A=[3;0;2];
B=[-5;4;-3];
v=B-A;
tiempo=max(t)/(length(t));
figure();
axis([-5 5 -5 5 -5 5]);
view([135 25]);
grid on;
hold on
tic

for i=1:length(t)
    x=t(1,i)/5*v(1,1)+A(1,1);
    y=t(1,i)/5*v(2,1)+A(2,1);
    z=t(1,i)/5*v(3,1)+A(3,1);
    plot3(x,y,z,'-.')
    
    pause(tiempo)

end
toc