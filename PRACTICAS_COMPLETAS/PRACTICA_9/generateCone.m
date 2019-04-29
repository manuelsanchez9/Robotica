function [x, y, z, z1] = generateCone(n)
    t = 0:2*pi/n:2*pi;
    x = cos(t);
    y = sin(t);
    z = zeros(1,length(t));
    z1 = ones(1,length(t));
end