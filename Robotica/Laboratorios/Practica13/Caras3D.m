%Generacion de caras en objetos de tres dimensiones
function caras = Caras3D(n)
for i = 1:n % construcion de caras laterales
    caras(i,:) = [i i+1 i+n+2];
    caras(n+i,:) = [i n+i+1 i+n+2];
end
for i = 1:n-2 % construcci?n de 
    caras(i+2*n,:) = [1 i+1 i+2];
    caras(i+3*n-2,:) = [n+2 n+i+2 n+i+3];
end
end