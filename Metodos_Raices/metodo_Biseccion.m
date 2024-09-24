clear;
clc;
syms x;

fx = input('Ingrese su funcion: ');
fplot(fx,[-2,4]); grid on;
a = input ('Ingrese valor inferior intervalo (a): '); % extremo inferior inicial
b = input ('Ingrese valor superior intervalo (b): '); % extremo superior inicial
fi = subs(fx,a);
fs = subs(fx,b);
if sign(fi)~=sign(fs) % esto hace una comprobación del Bolzano f(a)*f(b)<0 con los valores iniciales
    E = 1; % Error actual
    e = 0.0001; % Error aceptable
    i=1;
    xa=a;
    while E>e
        xm=(a+b)/2; % variable que guarda el punto medio en cada iteración
        fp=subs(fx,xm);
        if fi*fp<0
            b=xm;
        else
            a=xm;
        end
        E=abs((xm-xa)/xm);
        i=i+1;
        xa=xm;
    end
    x=['La raiz es xm=' num2str(xm)]; % imprime el mensaje
    disp(x)
else
    disp('Error, No hay raiz en el intervalo');
end
