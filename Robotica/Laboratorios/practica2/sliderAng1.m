function sliderAng1(handled,evento)
valor = round(get(handled,'value'));
% dinamica(valor);
end
function dinamica(val)
theta=val;
k=100;
for i=1:k
    rotz=[cos(theta*i/k) -sin(theta*i/k) 0;...
        sin(theta*i/k) cos(theta*i/k) 0;...
        0 0 1];
    v1=rotz*v;
    pause(0.1)
    set(g,'Vertices',v1')
    drawnow
end
end