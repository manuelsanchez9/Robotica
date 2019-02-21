clc; clear all;

movx=0;
movy=0;
posAct_X=0;
pasos_X=0;
posAct_Y=0;
pasos_Y=0;

puerto = 'COM4';
    delete(instrfind({'Port'},{puerto}));
    %crear objeto serie
    s = serial(puerto,'BaudRate',9600,'Terminator','CR/LF');
    warning('off','MATLAB:serial:fscanf:unsuccessfulRead');
    %abrir puerto
    fopen(s);% par?metros de medidas

r = 4; %radio
n = 10; %es el n?mero de puntos que se quieren ver
theta = 0:2*pi/n:2*pi;
x=r*cos(theta);
y=r*sin(theta);
hold on
pause on


% vert = [x;y];
% for j=1:n-2
%     caras(j,:) = [j j+1 j+2];    
% end
plot(x,y);
pasosMotor =98;
    DespVuelta =3.8;
    
    cam = DespVuelta*1/pasosMotor;
paso=length(x);
   array_pasos_xy = zeros(2,n);
   for i=1:paso-1
       
       xval = x(i+1)-x(i);
       yval = y(i+1)-y(i);
       array_pasos_xy(1,i) = pasosMotor*xval/DespVuelta;
       array_pasos_xy(2,i) = pasosMotor*yval/DespVuelta;
   end
   sprintf('%.f,',array_pasos_xy(1,:))
   sprintf('%.f,',array_pasos_xy(2,:))
% %  X
% fwrite(s,'X');
%  b = 'X'
%    for i=1:paso-1
%         X = sprintf('%.f',array_pasos_xy(1,i))
%         fwrite(s,num2str(X));
%         pause(0.1)
%         
%    end
% 
%    b = 'Y'
%    fwrite(s,'Y');
%    for i=1:paso-1
%         Y = sprintf('%.f',array_pasos_xy(2,i))
%         fwrite(s,num2str(Y));
%         pause(0.1)
%    end
%       fscanf(s,'%f')
% %    sefl = 'S'
%    fwrite(s,sefl);
   
% for i=1:paso-1
%     valorx=x(i);
%     valory=y(i);
%     
%     posAct_X = valorx-posAct_X;
%     pasos_X=posAct_X;
%     movx = posAct_X;
%     array_pasos_x(i)=pasos_X;
%          
% % %          fwrite(s,pasos_X);
%     
%     
%     
%      posAct_Y = valory-posAct_Y;
%     pasos_Y=posAct_Y;
%     movy = posAct_Y;
%     array_pasos_y(i)=pasos_Y;
%          
% %          fwrite(s,pasos_Y);
%     
%    datos = [fix(posAct_X*1)/1, fix(posAct_Y*1)/1]
%     
%     pasos_X=num2str(fix(valorx*1)/1);
%     pasos_Y=num2str(fix(valory*1)/1);
%     
%     posAct_X = valorx;
%     posAct_Y = valory;
%     
% %     valorx=num2str(valorx);
% %     valory=num2str(valory);
% 
% % fprintf(s, '%d', datos);
% % fprintf(s, '\n');
% 
%     dato=strcat(pasos_X,'_',pasos_Y)
%       fwrite(s,dato);
%       pause(1);
% end