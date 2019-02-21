A = [0 2; 0 3];
B = [0 -1; 0 2];
a = plot(A(1,:),A(2,:));
grid on % pone la grilla
axis([-4 4 -4 4]);
hold on
plot(B(1,:),B(2,:));

x = inputdlg({'Vector 1','Vector 2'},'Vectores', [1 50; 1 12]); 

data = str2double(x{1,:}); 

