function [ v1 ] = traslacion(a,v )

tra = [ 1 0 0 a(1);
    0 1 0 a(2);
    0 0 1 a(3);
    0 0 0 1];

v1=tra*v;
end

