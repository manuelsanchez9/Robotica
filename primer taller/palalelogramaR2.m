a=inputdlg('Ingrese los valores para el VECTOR 1, en R a la 2');
a=str2num(a{1});
b=inputdlg('Ingrese los valores para el VECTOR 2, en R a la 2');
b=str2num(b{1});
% a=[0 1; 0 3];
% b=[0 -3; 0 -4];
a1=[b(1,2) b(1,2)+a(1,2);b(2,2) b(2,2)+a(2,2)];
b1=[a(1,2) a(1,2)+b(1,2);a(2,2) a(2,2)+b(2,2)];
plot(a(1,:),a(2,:)) 
hold on
axis([-7 7 -7 7])
plot(b(1,:),b(2,:)) 
plot(a1(1,:),a1(2,:))
plot(b1(1,:),b1(2,:))
s=a+b;
plot(s(1,:),s(2,:))
grid on
xlabel('Eje X')
ylabel('Eje Y')