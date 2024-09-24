clear;  clc
syms x
% fx=x^3-x-1;  % establece la funcion 
fx = input('Ingrese la función deseada F(x) ');  
% solicita la funcion f(x)

fplot(fx,[-2,4],'LineWidth',2)   %imprime la grafica de la funcion fx desde -2 hasta 4
xlabel('x'); ylabel('y'); 
title('Metodo de Biseccion'); 
grid on  

% ingresa losmlimites del intervalo [a,b]
a=input('Intervalo inferior: ');  
b=input('Intervalo superior: ');

% calcula el valor de la funcion f(a), f(b)
fi=subs(fx,a); 
fs=subs(fx,b);  

if  sign(fi)~=sign(fs)   % verifica que el signo de f(a) ses diferente de f(b)
   
%inicializacion de variables auxiliares
E=1; e=0.00001;     % Error E inicial del 100%, margen de error e=1*10^-4
A=zeros(2,3);        % crea una matriz de ceros con dos  filas iniciales y tres columnas 
                     % para guardar los valores de x
i=1;      
xa=a;                 % Guarda el valor de a en xa, para calcular el Error absoluto mas adelante

%impresion de encabezados de listado
 fprintf('\n %2s %10s %10s %10s  %10s %10s %10s \n','i','a','f(a)','b','xm','f(xm)','ea');
% mientras el error inicial sea mayor que el margen de error aceptable
           % realice el calculo de la nueva raíz
  while E>e  
    A(i,1:2)=[a b];  % guarda los valores del intervalo en el cual se esta calculando 
                     %la nueva raiz, en la fila i, columnas desde la 1 hasta la  2
    xm=(a+b)/2;      % calcula valor medio xm
    fp=subs(fx,xm);  % evalua la funcion fx (xm)
    if fi*fp<0       % aplica el teorema de bolzano para saber cual extemo cambia (a ó b )
        b=xm; 
    else
        xa=xm; fi=fp;
    end
    E=abs((xm-xa)/xm);       % calcula el error absoluto
   fprintf('\n %2d %2.8f %2.8f %2.8f %2.8f %2.8f  %2.8f  ',i,a,fi,b,xm,fp,E);
    
    A(i,3)=0.5*(a+b);    % calcula y guarda Nuevo valor de xm en la celda i, columna 3
    i=i+1;
    xa=xm;       % guarda el valor de xm en xa , para la proxima iteracion
end

x=['La raiz es xm= ' num2str(A(end,3))]; % crea una variable matricial con una fila dos  columnas
fprintf('\n %25s \n',x)
%disp('\n', x)

T=array2table(A,'VariableNames',{'a','b','xm'});   % crea una nueva matriz con los titulos de 
                                                %columna y los datos de
                                                %a,b,xm calculados antes 
                                               
  %disp(T)           

else  % salida de error en la condicion inicial (if), no hay raiz en el intervalo a,b
mal=['No existe raiz en el intervalo: ' num2str(a,4) ',' num2str(b,4)  ];
   disp(mal)
end
