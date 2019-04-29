a=inputdlg(sprintf('Ingrese un caso de suma:\n 1) Dos vectores en R2\n 2) Dos vectores en R3\n 3) Tres vectores en R3'))
a=str2num(a{1,1});
switch a
    case 1
        v1=inputdlg('Ingrese vector 1 (para suma en R2)')
        v1=str2num(v1{1,1});
        v2=inputdlg('Ingrese vector 2 (para suma en R2)')
        v2=str2num(v2{1,1});
        sumav=v1+v2
        v11=[v2(1,2) v2(1,2)+v1(1,2);v2(2,2) v2(2,2)+v1(2,2)];
        v21=[v1(1,2) v1(1,2)+v2(1,2);v1(2,2) v1(2,2)+v2(2,2)];
        plot(v1(1,:),v1(2,:))
        grid on
        hold on
        axis([-6 6 -6 6])
        plot(v2(1,:),v2(2,:)) 
        plot(v11(1,:),v11(2,:))
        plot(v21(1,:),v21(2,:))
        plot(sumav(1,:),sumav(2,:))
        xlabel('Eje X')
        ylabel('Eje Y')
    case 2
        v1=inputdlg('Ingrese vector 1 (para suma en R3)')
        v1=str2num(v1{1,1});
        v2=inputdlg('Ingrese vector 2 (para suma en R3)')
        v2=str2num(v2{1,1});
        plot3(v1(1,:), v1(2,:), v1(3,:))
        view([125, 25])
        grid on
        hold on
        plot3(v2(1,:), v2(2,:), v2(3,:))
        sumav=v1+v2;
        plot3(sumav(1,:), sumav(2,:), sumav(3,:))
        v11=[-1 0; 1 3; 3 4]
        plot3(v11(1,:), v11(2,:), v11(3,:))
        v21=[1 0; 2 3; 1 4]
        plot3(v21(1,:), v21(2,:), v21(3,:))
        xlabel('Eje X')
        ylabel('Eje Y')
        zlabel('Eje Z')
    case 3
        v1=inputdlg('Ingrese vector 1 (para suma en R3)')
        v1=str2num(v1{1,1});
        v2=inputdlg('Ingrese vector 2 (para suma en R3)')
        v2=str2num(v2{1,1});
        v3=inputdlg('Ingrese vector 3 (para suma en R3)')
        v3=str2num(v3{1,1});
        sumav=v1+v2+v3
        
        v11 = [ v1(:,2)-v1(:,1) v1(:,2)+v2(:,2) ];
        v12 = [ v1(:,2)-v1(:,1) v1(:,2)+v3(:,2) ];
        
        v21 = [ v2(:,2)-v2(:,1) v2(:,2)+v1(:,2) ];
        v22 = [ v2(:,2)-v2(:,1) v2(:,2)+v3(:,2) ];
        
        v31 = [ v3(:,2)-v3(:,1) v3(:,2)+v1(:,2) ];
        v32 = [ v3(:,2)-v3(:,1) v3(:,2)+v2(:,2) ];
        
        v13 = [ v11(:,2) v11(:,2)+v3(:,2) ];
        v23 = [ v12(:,2) v12(:,2)+v2(:,2) ];
        v33 = [ v32(:,2) v32(:,2)+v1(:,2) ];
        
        plot3(v1(1,:),v1(2,:),v1(3,:));
        view([125, 25])
        hold on
        plot3(v2(1,:),v2(2,:),v2(3,:));
        plot3(v3(1,:),v3(2,:),v3(3,:));
        plot3(sumav(1,:),sumav(2,:),sumav(3,:));
        
        plot3(v11(1,:),v11(2,:),v11(3,:));
        plot3(v12(1,:),v12(2,:),v12(3,:));
        plot3(v13(1,:),v13(2,:),v13(3,:));
        plot3(v21(1,:),v21(2,:),v21(3,:));
        plot3(v22(1,:),v22(2,:),v22(3,:));
        plot3(v23(1,:),v23(2,:),v23(3,:));
        plot3(v31(1,:),v31(2,:),v31(3,:));
        plot3(v32(1,:),v32(2,:),v32(3,:));
        plot3(v33(1,:),v33(2,:),v33(3,:));
        grid on
        xlabel('Eje X')
        ylabel('Eje Y')
        zlabel('Eje Z')
end