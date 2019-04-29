val=inputdlg(sprintf('Ingrese un ángulo diferente de cero(0) para observar la rotación: \nDigite cero(0) para finalizar ejecución'))
val=str2num(val{1,1});

if (val == 0)
    msg = msgbox('Fin de la ejecución.')
else
    n=5;
    t = 0:2*pi/5:2*pi;
    x = cos(t-pi/10);
    y = sin(t-pi/10);
    x1 = 2*cos(t+pi/10);
    y1 = 2*sin(t+pi/10);
    a = [x x1;y y1];

    %plot(x,y)
    hold on
    %plot(x1,y1)
    axis([-3 3 -3 3])

    for i=1:n
        caras(i,:) = [i i+1 i+n+1];
    end
    g = patch('faces', caras, 'vertices',a')
    w = a;
end

while(val ~= 0)
    angle=(val*pi)/180;
    tt=angle/val;
    w = w;
    i = 0;

    if (val > 0)
        while (i < val)
            rot=[cos(tt) -sin(tt);...
                 sin(tt) cos(tt)];
            w=rot*w;    
            pause(0.1)
            set(g,'vertices',w')
            drawnow

            i = i + 1;
        end
    else
        while (i > val)
            rot=[cos(tt) sin(tt);...
                 -sin(tt) cos(tt)];
            w=rot*w;    
            pause(0.1)
            set(g,'vertices',w')
            drawnow

            i = i - 1;
        end
    end
    
    val=inputdlg(sprintf('Ingrese un ángulo diferente de cero(0) para observar la rotación: \nDigite cero(0) para finalizar ejecución'))
    val=str2num(val{1,1});
    
    if (val == 0)
        msg = msgbox('Fin de la ejecución.')
    end
end