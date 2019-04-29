%PRACTICA 4
%CON LA FIGURA REALIZADA A CONTINUACION GENERAR UN MOVIMIENTO CON EL
%SLIDER, TAL QUE LA BARRA TRANSVERSAL SE MUEVA EN LOS 2 SENTIDOS INDICADOS.
function practice_4
    f = figure;

    pnl = uipanel(f, 'position', [0.01 0.01 0.25 0.1])
    slider_element = uicontrol(pnl, 'style','slider',...
                               'Max', 10, 'Min', -10,'Value',0,...
                               'SliderStep', [0.05 0.1],...
                               'callback', @sli,...
                               'Position',[10 10 120 20]);
    n = 4;
    t = 0:2*pi/n:2*pi;
    z = cos(t+pi/4);
    y = sin(t+pi/4);
    x = 10*ones(1,length(t))
    x1 = -10*ones(1,length(t))
    view([135 25])
    hold on 
    m = [x x1; y+10-sqrt(2)/2 y+10-sqrt(2)/2; z z];
    m1 = [x x1; y-10+sqrt(2)/2 y-10+sqrt(2)/2; z z];
    m2 = [y y; x x1; z+sqrt(2) z+sqrt(2)];
    mm = [y y; x x1; z+sqrt(2) z+sqrt(2); ones(1,length(t)) ones(1,length(t))];

    for i=1:n
        caras(i,:) = [i i+n+1 i+n+2];
        caras(i+n,:) = [i i+1 i+n+2];
    end

    patch('faces', caras, 'vertices', m')
    patch('faces', caras, 'vertices', m1')
    g = patch('faces', caras, 'vertices', m2')
    axis([-11 11 -11 11 -11 11])
    xlabel('Eje X')
    ylabel('Eje Y')
    zlabel('Eje Z')
    
    function sli(fuente,evento)
        a=get(fuente,'Value')
        tras = [1 0 0 a; 0 1 0 0; 0 0 1 0; 0 0 0 1]
        v = tras * mm;
        pause(0.1)
        set(g, 'vertices', v(1:3,:)')
        drawnow
    end
end