clear;clc;

syms x; % carga x como una variable analitica.
fx = input('Ingrese su funcion en terminos de x: '); % se recibe la función del usuario.

%Creación de grafica para buscar un intervalo con raiz:
x1 = input ('Ingrese valor inferior intervalo a graficar: '); % extremo inferior de la grafica.
x2 = input ('Ingrese valor superior intervalo a graficar: '); % extremo superior de la grafica.
fplot(fx,[x1,x2]); grid on; %imprime la grafica.
xi = input ('Ingrese valor inferior intervalo (a): '); % se inicializa la variable de extremo inferior con valor inicial pasado por el usuario.
xs = input ('Ingrese valor superior intervalo (b): '); % se inicializa la variable de extremo superior con valor inicial pasado por el usuario.

% Se evalua el algoritmo con los extremos iniciales:
fxn = inline(fx);
fi = fxn(xi); % se inicializa la variable que guarda el valor de la función en el extremo inferior del intervalo.
fs = fxn(xs); % se inicializa la variable que guarda el valor de la función en el extremo superior del intervalo.
if sign(fi)~=sign(fs) % esto hace una comprobación del teo. de Bolzano (f(a)*f(b)<0) con los valores iniciales.
    Ea = 1; % Se inicializa el Error relativo aproximado actual como 100%.
    ea = input('Ingrese el valor de error aceptable: '); % se recibe un Error aceptable por el usuario.
    %ea = 0.0001; % Error aceptable predefinido.
    i=1; % contador de pasos que empieza en 1 por que esos son los valores iniciales dados por el usuario.
    while Ea>ea
        xm = xs-((fs*(xi-xs))/(fi-fs)); % variable que guarda el punto medio actual.
        fm = fxn(xm); % variable que guarda el valor de la función en el punto.
        if fi*fm<0 
            Ea=abs((xm-xs)/xm);
            xs=xm;
            fs=fm;
        else
            Ea=abs((xm-xi)/xm);
            xi=xm;
            fi=fm;
        end
        i=i+1;
    end
    resp=['La raiz es xm = ' num2str(xm)]; % imprime el mensaje
    disp(resp);
    ite=['El numero de iteraciones fueron: ' num2str(i)]; % imprime el mensaje
    disp(ite);
else
    disp('Error, No hay raiz en el intervalo');
end
