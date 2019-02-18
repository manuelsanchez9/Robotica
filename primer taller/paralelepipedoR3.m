a=[0 1; 0 2; 0 3];
b=[0 -1; 0 2; 0 3];
c=[0 2; 0 4; 0 1];
plot3(a(1,:), a(2,:), a(3,:))
view([125, 25])
grid on
hold on
plot3(b(1,:), b(2,:), b(3,:))
plot3(c(1,:), c(2,:), c(3,:))
sumav=a+b+c
a1=[b(1,2) a(1,2)+b(1,2);...
    b(2,2) a(2,2)+b(2,2);...
    b(3,2) a(3,2)+b(3,2)];
plot3(sumav(1,:),sumav(2,:),sumav(3,:),'m')
plot3(a1(1,:),a1(2,:),a1(3,:),'r')
xlabel('Eje X')
ylabel('Eje Y')
zlabel('Eje Z')