a=inputdlg('ingrese el vector 1');
a=str2num(a{1});
plot3(a(1,:), a(2,:), a(3,:)) 
axis([-10 10 -10 10])
view([120 25]);
grid on
xlabel('eje x')
ylabel('eje y')
zlabel('eje z')