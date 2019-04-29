function caras = carasSphere(n)
    for i=1:n
        for j=1:n
            caras(i+n*(j-1),:)=[i+(n+1)*(j-1) i+1+(n+1)*(j-1)...
                i+n+2+(n+1)*(j-1) i+n+1+(n+1)*(j-1)];
        end
    end
end