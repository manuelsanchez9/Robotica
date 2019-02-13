a=[1 1; 1 2; 1 1];
b=[1 -1; 1 1; 1 3];
c=[1 2; 1 3; 1 1];
plot3(a(1,:), a(2,:), a(3,:))
view([125, 25])
grid on
hold on
plot3(b(1,:), b(2,:), b(3,:))
plot3(c(1,:), c(2,:), c(3,:))
xlabel('Eje X')
ylabel('Eje Y')
zlabel('Eje Z')