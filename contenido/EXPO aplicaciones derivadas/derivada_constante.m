% Código en MATLAB para graficar una función constante, su derivada y la recta tangente

% Limpiar la pantalla y las variables
clc;
clear;

% Definir el rango de x
x = -5:0.1:5;

% Definir la función constante y = 5
y = 5 * ones(size(x));

% Graficar la función constante
figure;
plot(x, y, 'b', 'LineWidth', 3); % Función en azul grueso
hold on;
grid on;
axis([-5 5 -1 10]); % Ajustar ejes
xlabel('x');
ylabel('y');
title('Función constante y = 5 con su derivada y recta tangente', 'FontSize', 12);

% Graficar la derivada (que es cero)
plot(x, zeros(size(x)), 'g--', 'LineWidth', 2); % Derivada en verde discontinuo

% Dibujar el eje x (y = 0)
plot([-5, 5], [0, 0], 'k', 'LineWidth', 1.5); % Eje x en negro

% Bucle para mostrar la recta tangente en diferentes posiciones
for i = 1:length(x)
    % Punto actual
    x0 = x(i);
    y0 = 5; % Valor constante
    
    % La recta tangente es la misma función (pendiente cero)
    x_tangent = x0 - 2:0.1:x0 + 2; % Segmento de recta
    y_tangent = 5 * ones(size(x_tangent)); % y = 5
    
    % Graficar elementos móviles
    plot(x_tangent, y_tangent, 'r', 'LineWidth', 2); % Recta tangente
    plot(x0, y0, 'ko', 'MarkerFaceColor', 'k', 'MarkerSize', 8); % Punto
    
    % Pausa para animación
    pause(0.05);
    
    % Borrar elementos móviles (excepto en la última iteración)
    if i < length(x)
        clf;
        % Volver a dibujar elementos fijos
        plot(x, y, 'b', 'LineWidth', 3);
        hold on;
        grid on;
        axis([-5 5 -1 10]);
        xlabel('x');
        ylabel('y');
        title('Función constante y = 5 con su derivada y recta tangente', 'FontSize', 12);
        plot(x, zeros(size(x)), 'g--', 'LineWidth', 2);
        plot([-5, 5], [0, 0], 'k', 'LineWidth', 1.5);
    end
end

% Leyenda final
legend('Función constante', 'Derivada (y''=0)', 'Location', 'northwest');