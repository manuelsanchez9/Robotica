% a=inputdlg('Ingrese los valores para el VECTOR 1, en R a la 3');
% a=str2num(a{1});
% b=inputdlg('Ingrese los valores para el VECTOR 2, en R a la 3');
% b=str2num(b{1});
a=[0 1; 0 2; 0 1];
b=[0 -1; 0 1; 0 3];
plot3(a(1,:), a(2,:), a(3,:))
view([125, 25])
grid on
hold on
plot3(b(1,:), b(2,:), b(3,:))
c=a+b;
plot3(c(1,:), c(2,:), c(3,:))
a1=[-1 0; 1 3; 3 4]
plot3(a1(1,:), a1(2,:), a1(3,:))
b1=[1 0; 2 3; 1 4]
plot3(b1(1,:), b1(2,:), b1(3,:))
xlabel('Eje X')
ylabel('Eje Y')
zlabel('Eje Z')