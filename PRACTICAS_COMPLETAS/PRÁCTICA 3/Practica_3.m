clc;clear all;close all;

angle=inputdlg(sprintf('Ingrese un ángulo diferente de cero(0) para observar la rotación de la figura: '))
angle=str2num(angle{1,1});

if (angle == 0)
    msg = msgbox('Fin de la ejecución.')
else
    ax=inputdlg(sprintf('Ingrese x, y o z para determinar el eje de rotación de la figura: '))
    ax=char(ax);
    
    n=20;
    t=0:2*pi/n:2*pi;
    x=cos(t);
    y=sin(t);
    z=zeros(1,length(t));
    z1=ones(1,length(t));
    figure
    view([135 25])
    axis([-1.2 1.2 -1.2 1.2 -1.2 1.2])
    a=[x 1/2*x;y 1/2*y;z z1];
    for i=1:n
        caras(i,:)=[i i+1 i+n+1];
        caras(i+n,:)=[i+1 i+n+1 i+n+2];
    end
    for i=1:n-2
        caras(2*n+i,:)=[1 i+1 i+2];
        caras(3*n+i-2,:)=[n+2 i+n+2 i+n+3];
    end
    %g=patch('faces',caras,'vertices',a','facecolor',[109/255 146/255 1],'edgecolor',[109/255 146/255 1])
    g=patch('faces',caras,'vertices',a','facecolor',[46/255 46/255 65/255],'edgecolor',[1 1 1])
    w = a;
end

while (angle ~= 0)
    convertedAngle = (angle*pi)/180;
    tt=convertedAngle/angle;
    w = w;
    i = 0;
    
    if (angle > 0)
        while (i < angle)
            if (ax == 'x')
                rot = [1 0 0
                       0 cos(tt) -sin(tt);...
                       0 sin(tt) cos(tt)];
            else if (ax == 'y')
                    rot = [cos(tt) 0 -sin(tt);...
                           0 1 0
                           sin(tt) 0 cos(tt)];
                else if (ax == 'z')
                        rot = [cos(tt) -sin(tt) 0;...
                               sin(tt) cos(tt) 0;...
                               0 0 1];
                    end
                end
            end
            
            w=rot*w;    
            pause(0.1)
            set(g,'vertices',w')
            drawnow
            i = i + 1;
        end
    else                
        while (i > angle)
            if (ax == 'x')
                rot = [1 0 0
                       0 cos(tt) sin(tt);...
                       0 -sin(tt) cos(tt)];
            else if (ax == 'y')
                    rot = [cos(tt) 0 sin(tt);...
                           0 1 0
                           -sin(tt) 0 cos(tt)];
                else if (ax == 'z')
                        rot = [cos(tt) sin(tt) 0;...
                               -sin(tt) cos(tt) 0;...
                               0 0 1];
                    end
                end
            end
            
            w=rot*w;    
            pause(0.1)
            set(g,'vertices',w')
            drawnow
            i = i - 1;
        end
    end
    
    angle=inputdlg(sprintf('Ingrese un ángulo diferente de cero(0) para observar la rotación de la figura: '))
    angle=str2num(angle{1,1});
        
    if (angle == 0)
        msg = msgbox('Fin de la ejecución.')
    else
        ax=inputdlg(sprintf('Ingrese x, y o z para determinar el eje de rotación de la figura: '))
        ax=char(ax);
    end
end