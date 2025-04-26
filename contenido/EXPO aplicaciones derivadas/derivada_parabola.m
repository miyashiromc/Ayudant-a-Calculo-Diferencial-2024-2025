% Código en MATLAB para graficar una parábola, su derivada y la recta tangente

% Limpiar la pantalla y las variables
clc;
clear;

% Definir el rango de x para la parábola
x = -5:0.1:5;

% Definir la función de la parábola y = x^2
y = x.^2;

% Graficar la parábola
figure;
plot(x, y, 'b', 'LineWidth', 3); % Parábola en azul grueso
hold on;
grid on;
axis([-5 5 -5 25]); % Ajustar los ejes para mejor visualización
xlabel('x');
ylabel('y');
title('Recta tangente a la parábola y = x^2', 'FontSize', 14);

% Dibujar el eje x (y = 0)
plot([-5, 5], [0, 0], 'k', 'LineWidth', 1.5); % Eje x en negro

% Dibujar el eje y (x = 0)
plot([0, 0], [-5, 25], 'k', 'LineWidth', 1.5); % Eje y en negro

% Pausa inicial de 2 segundos
pause(2);

% Bucle para mover la recta tangente a lo largo de la parábola
for i = 1:length(x)
    % Punto actual en la parábola
    x0 = x(i);
    y0 = x0^2;
    
    % Derivada de y = x^2 (pendiente de la recta tangente)
    m = 2*x0; % dy/dx = 2x
    
    % Definir la recta tangente y = m(x - x0) + y0
    x_tangent = x0 - 2:0.1:x0 + 2; % Rango de x para la recta tangente
    y_tangent = m*(x_tangent - x0) + y0;
    
    % Graficar la recta tangente
    plot(x_tangent, y_tangent, 'r', 'LineWidth', 2); % Recta tangente en rojo
    plot(x0, y0, 'ko', 'MarkerFaceColor', 'k', 'MarkerSize', 10); % Punto de tangencia en negro
    
    % Pausa para visualizar el movimiento
    pause(0.05);
    
    % Borrar la recta tangente anterior (excepto en la última iteración)
    if i < length(x)
        clf;
        plot(x, y, 'b', 'LineWidth', 3); % Volver a graficar la parábola
        hold on;
        grid on;
        axis([-5 5 -5 25]); % Mantener los ejes ajustados
        xlabel('x');
        ylabel('y');
        title('Recta tangente a la parábola y = x^2', 'FontSize', 14);
        
        % Volver a dibujar los ejes x e y
        plot([-5, 5], [0, 0], 'k', 'LineWidth', 1.5); % Eje x en negro
        plot([0, 0], [-5, 25], 'k', 'LineWidth', 1.5); % Eje y en negro
    end
end