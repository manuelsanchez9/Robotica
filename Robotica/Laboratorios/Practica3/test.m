close all; clc; clear;
lx = [0 0];
ly = [0 0];
lz = [0 0];
figure
g = plot3(lx,ly,lz);
sw = 1;
for i = 0:6;
    if(mod(i,2)== 0)
        if(sw == 0)
            sw=1;
        else
            sw=0;
        end
    end
    for j=0:2
        if sw == 1 
            s = strcat(num2str(i),num2str(j))
        else
            s = strcat(num2str(i),'-',num2str(j))
        end
    end
end
    