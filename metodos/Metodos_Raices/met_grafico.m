%%%La verdad es que esto no es más que un graficador de funciones%%%
function [] = met_grafico(func, x1, x2)
disp("Metodo Grafico:");
syms x; % carga x como una variable analitica.
fx = func;
fplot(fx,[x1,x2]); grid on; %imprime la grafica.
end
