function [ caras ] = getCarasL( n )
for i = 1:n
    caras(i,:) = [i i+1 i+n+2];
    caras(n+i,:) = [i n+i+1 i+n+2];
end  
end

