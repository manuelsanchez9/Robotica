a=inputdlg('ingrese el vector 1');
a=str2num(a{1});
b=inputdlg('ingrese el vector 2');
b=str2num(b{1});
a1=[b(1,2) b(1,2)+a(1,2);b(2,2) b(2,2)+a(2,2)];
b1=[a(1,2) a(1,2)+b(1,2);a(2,2) a(2,2)+b(2,2)];
plot(a(1,:),a(2,:)) 
hold on
axis([-5 5 -5 5])
plot(b(1,:),b(2,:)) 
plot(a1(1,:),a1(2,:))
plot(b1(1,:),b1(2,:))
s=a+b;
plot(s(1,:),s(2,:))%



