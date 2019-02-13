a=inputdlg('ingrese el vector 1');
a=str2num(a{1});
b=inputdlg('ingrese el vector 2');
b=str2num(b{1});
plot(a(1,:),a(2,:)) 
axis([-5 5 -5 5])
