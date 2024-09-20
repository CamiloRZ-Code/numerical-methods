d_dia_Paco = 1000000; % variable del dinero que recibe Paco cada día.
d_Paco = [d_dia_Paco]; % inicialización del vector capital de Paco.
d_dia_Hugo = 1; % variable del dinero que recibe Hugo cada día.
d_Hugo = [d_dia_Hugo]; % inicialización del vector capital de Hugo.
t = [1]; % inicialización del vector tiempo o días.

dia_Eval = 60; % variable del día a evaluar

for i = 2:dia_Eval % se inicializa el ciclo el segundo día.
    t = [t,i];
    d_dia_Paco = d_dia_Paco/2;
    d_Paco = [d_Paco,d_Paco(i-1)+d_dia_Paco];
    d_dia_Hugo = d_dia_Hugo*2;
    d_Hugo = [d_Hugo,d_Hugo(i-1)+d_dia_Hugo];
end

fprintf('Capital final de Paco: %d\n', d_Paco(dia_Eval));

fprintf('Capital final de Hugo: %d\n', d_Hugo(dia_Eval));


% Crear la gráfica
figure; % Abre una nueva ventana de figura
plot(t, d_Paco, 'b-', 'DisplayName', 'Capital de Paco'); % Graficar la primera curva en color azul
hold on; % Mantiene la gráfica actual para añadir más curvas
plot(t, d_Hugo, 'r--', 'DisplayName', 'Capital de Hugo'); % Graficar la segunda curva en color rojo con línea discontinua

% Añadir título, nombres de ejes y leyenda
title('Gráfica del capital de los hermanos en el tiempo'); % Título de la gráfica
xlabel('Tiempo (días)'); % Nombre del eje X
ylabel('Capital (Dolares)'); % Nombre del eje Y
legend('show'); % Mostrar leyenda con los nombres especificados en 'DisplayName'
grid on; % Añade la cuadrícula