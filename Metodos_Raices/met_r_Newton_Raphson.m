clear;clc;

syms x; % carga x como una variable analitica.
fx = input('Ingrese su funcion en terminos de x: '); % se recibe la función del usuario.

%Creación de grafica para buscar un valor x cercano a la raiz:
x1 = input ('Ingrese valor inferior intervalo a graficar: '); % extremo inferior de la grafica.
x2 = input ('Ingrese valor superior intervalo a graficar: '); % extremo superior de la grafica.
fplot(fx,[x1,x2]); grid on; %imprime la grafica.
xi = input ('Ingrese el valor inicial (de preferencia uno cercano a una raiz): '); % se inicializa la variable de valor inferior con valor inicial pasado por el usuario.

% Se evalua el algoritmo con los extremos iniciales:
Df = diff(fx); % se calcula la derivada simbolica o analitica de fx.
fxn = inline(fx);
Dfn = inline(Df);
fi = fxn(xi); % se inicializa la variable que guarda el valor de la función en cada punto.
Dfi = Dfn(xi); % se inicializa la variable que guarda el valor de la derivada de la función en cada punto.
Ea = 1; % Se inicializa el Error relativo aproximado actual como 100%.
ea = input('Ingrese el valor de error aceptable: '); % se recibe un Error aceptable por el usuario.
%ea = 0.0001; % Error aceptable predefinido.
li = input('Ingrese el numero de iteraciones maximas aceptable: ');
i=1; % contador de pasos que empieza en 1 por que esos son los valores iniciales dados por el usuario.
cent = 0; % centinela o flag que sirve para terminar el ciclo, 0 (seguir ejecutantdo) y 1 (terminar ciclo).
while cent==0
    xsig = xi-(fi/Dfi); % variable que guarda el punto siguiente o Xi+1.
    Ea = abs((xsig-xi)/xsig);
    i=i+1;
    if Ea<ea
        cent=1;
        resp1=['La raiz es x = ' num2str(xm)];
        disp(resp1); % imprime el mensaje
        resp2=['El numero de iteraciones fueron: ' num2str(i)]; % imprime el mensaje
        disp(resp2); % imprime el mensaje
        resp3=['El Error final fue: ' num2str(Ea)]; % imprime el mensaje
        disp(resp3); % imprime el mensaje
    elseif i>li
        cent=1;
        disp('no se encontro la raíz.'); % imprime el mensaje
    else
        xi = xsig; % se define la siguiente Xi como la actual Xi+1.
        fi = fxn(xsig); % se define la siguiente f(Xi) como la actual f(Xi+1).
        Dfi = Dfn(xsig); % se define la siguiente f'(Xi) como la actual f'(Xi+1).
    end
end