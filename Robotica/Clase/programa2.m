x = input('Ingrese el vector 1: ');
y = input('Ingrese el vector 2:');

plot(x(1,:),x(2,:));
hold on
plot(y(1,:),y(2,:));

suma = x+y;
plot(suma(1,:),suma(2,:));