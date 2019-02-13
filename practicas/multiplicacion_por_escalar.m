a=inputdlg('ingrese el vector 1');
a=str2num(a{1});
l=inputdlg('ingrese un escalar');
l=str2num(l{1});
l1=a*l;
plot(a(1,:),a(2,:)) 
hold on
axis([-5 5 -5 5])
pause(2)
plot(l1(1,:),l1(2,:)) 

