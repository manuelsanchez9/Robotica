function [ caras ] = getCaras( n )
for j = 1:n-2
    caras(j,:) = [1 1+j 2+j];
end
end

