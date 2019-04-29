function [x1, y1, z1] = generateSphere(n)
    t=0:2*pi/n:2*pi;
    x=cos(t);
    y=sin(t);
    z=ones(1,length(t));
    th=0:pi/n:pi;
    nivel=cos(th);
    %nivel=-1:2/n:1;
    if(mod(length(t),2)==1)
        %
        for j=1:(length(t)+1)/2
            %     r(1,j)=2/n*(j-1)
            r(1,j)=sin(th(1,j));
        end
        for j=j+1:length(t)
            %     r(1,j)=2/n*(length(t)-j)
            r(1,j)=sin(th(1,j));
        end
    end
    if(mod(length(t),2)==0)
        for j=1:(length(t)+1)/2
            r(1,j)=2/n*(j-1)
        end
        for j=j+1:length(t)
            r(1,j)=2/n*(length(t)-j);
        end
    end
    for j=1:length(r)
        for i=1:length(t)
            x1(1,i+(j-1)*length(t))=r(1,j)*x(1,i);
            y1(1,i+(j-1)*length(t))=r(1,j)*y(1,i);
            z1(1,i+(j-1)*length(t))=nivel(1,j)*z(1,i);
        end
    end
end