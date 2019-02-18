a=inputdlg('ingrese un caso de suma: 1 dos vectores en R2;2 dos vectores en R3, 3 tres vectores en R3: ')
a=str2num(a{1,1});
switch a
    case 1
        v1=inputdlg('ingrese vecor 1')
        v1=str2num(v1{1,1});
        v2=inputdlg('ingrese vecor 2')
        v2=str2num(v2{1,1});
        sumav=v1+v2
    case 2
        v1=inputdlg('ingrese vecor 1')
        v1=str2num(v1{1,1});
        v2=inputdlg('ingrese vecor 2')
        v2=str2num(v2{1,1});
        sumav=v1+v2
    case 3
        v1=inputdlg('ingrese vecor 1')
        v1=str2num(v1{1,1});
        v2=inputdlg('ingrese vecor 2')
        v2=str2num(v2{1,1});
        v3=inputdlg('ingrese vecor 2')
        v3=str2num(v3{1,1});
        sumav=v1+v2+v3
        v11=[v2(1,2) v1(1,2)+v2(1,2);...
            v2(2,2) v1(2,2)+v2(2,2);...
            v2(3,2) v1(3,2)+v2(3,2)];
        v21=[v1(1,2) v1(1,2)+v2(1,2);...
            v1(2,2) v1(2,2)+v2(2,2);...
            v1(3,2) v1(3,2)+v2(3,2)];
        v31=[v1(1,2)+v2(1,2) v1(1,2)+v2(1,2)+v3(1,2);...
            v1(2,2)+v2(2,2) v1(2,2)+v2(2,2)+v3(2,2);...
            v1(3,2)+v2(3,2) v1(3,2)+v2(3,2)+v3(3,2)];
        plot3(v1(1,:),v1(2,:),v1(3,:),'b')
        hold on
        plot3(v2(1,:),v2(2,:),v2(3,:),'b')
        plot3(v3(1,:),v3(2,:),v3(3,:),'b')
        plot3(sumav(1,:),sumav(2,:),sumav(3,:),'m')
        plot3(v11(1,:),v11(2,:),v11(3,:),'r')
        plot3(v21(1,:),v21(2,:),v21(3,:),'r')
        plot3(v31(1,:),v31(2,:),v31(3,:),'r')
end