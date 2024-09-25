clear;clc;

syms x; % carga x como una variable analitica.
fx = input('Ingrese su funcion en terminos de x: '); % se recibe la función del usuario.

%Creación de grafica para buscar un intervalo con raiz:
x1 = input ('Ingrese valor inferior intervalo a graficar: '); % extremo inferior de la grafica.
x2 = input ('Ingrese valor superior intervalo a graficar: '); % extremo superior de la grafica.
fplot(fx,[x1,x2]); grid on; %imprime la grafica.
xi = input ('Ingrese valor inferior intervalo: '); % se inicializa la variable de valor inferior (Xi-1) con valor inicial pasado por el usuario.
xs = input ('Ingrese valor superior intervalo: '); % se inicializa la variable de valor superior (Xi) con valor inicial pasado por el usuario.

% Se evalua el algoritmo con los extremos iniciales:
fxn = inline(fx);
fi = fxn(xi); % se inicializa la variable que guarda el valor de la función en el extremo inferior del intervalo.
fs = fxn(xs); % se inicializa la variable que guarda el valor de la función en el extremo superior del intervalo.
Ea = 1; % Se inicializa el Error relativo aproximado actual como 100%.
ea = input('Ingrese el valor de error aceptable: '); % se recibe un Error aceptable por el usuario.
%ea = 0.0001; % Error aceptable predefinido.
li = input('Ingrese el numero de iteraciones maximas aceptable: ');
i=1; % contador de pasos que empieza en 1 por que esos son los valores iniciales dados por el usuario.
cent = 0; %centinela o flag que sirve para terminar el ciclo.
while cent==0
    xsig = xs-((fs*(xi-xs))/(fi-fs)); % variable que guarda el punto siguiente o Xi+1.
    Ea = abs((xsig-xs)/xsig);
    i=i+1;
    if Ea<ea
        cent=1;
        resp=['La raiz es xm = ' num2str(xsig)]; % imprime el mensaje
        disp(resp);
        ite=['El numero de iteraciones fueron: ' num2str(i)]; % imprime el mensaje
        disp(ite);
    elseif i>li
        cent=1;
        disp('no se encontro la raíz.');
    else
        xi = xs; % se define la siguiente Xi-1 como la actual Xi.
        xs = xsig; % se define la siguiente Xi como la actual Xi+1.
        fi = fs; % se define la siguiente f(Xi-1) como la actual f(Xi).
        fs = fxn(xsig); % se define la siguiente f(Xi) como la actual f(Xi+1).
    end
end
