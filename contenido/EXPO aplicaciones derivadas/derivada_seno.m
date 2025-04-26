% Código en MATLAB para visualizar la función seno y su recta tangente en cada punto

% Limpiar la pantalla y las variables
clc;
clear;

% Definir el rango de x para la función seno
x = -2*pi:0.1:2*pi;

% Definir la función seno y = sin(x)
y = sin(x);

% Graficar la función seno
figure;
plot(x, y, 'b', 'LineWidth', 3); % Función seno en azul grueso
hold on;
grid on;
axis([-2*pi 2*pi -1.5 1.5]); % Ajustar los ejes para mejor visualización
xlabel('x');
ylabel('y');
title('Recta tangente a la función seno y = sin(x)', 'FontSize', 14);

% Dibujar el eje x (y = 0)
plot([-2*pi, 2*pi], [0, 0], 'k', 'LineWidth', 1.5); % Eje x en negro

% Dibujar el eje y (x = 0)
plot([0, 0], [-1.5, 1.5], 'k', 'LineWidth', 1.5); % Eje y en negro

% Pausa inicial de 2 segundos
pause(2);

% Bucle para mover la recta tangente a lo largo de la curva
for i = 1:length(x)
    % Punto actual en la curva
    x0 = x(i);
    y0 = sin(x0);
    
    % Derivada de y = sin(x) (pendiente de la recta tangente)
    m = cos(x0); % dy/dx = cos(x)
    
    % Definir la recta tangente y = m(x - x0) + y0
    x_tangent = x0 - 1:0.1:x0 + 1; % Rango de x para la recta tangente
    y_tangent = m*(x_tangent - x0) + y0;
    
    % Graficar la recta tangente
    plot(x_tangent, y_tangent, 'r', 'LineWidth', 2); % Recta tangente en rojo
    plot(x0, y0, 'ko', 'MarkerFaceColor', 'k', 'MarkerSize', 10); % Punto de tangencia en negro
    
    % Pausa para visualizar el movimiento
    pause(0.05);
    
    % Borrar la recta tangente anterior (excepto en la última iteración)
    if i < length(x)
        clf;
        plot(x, y, 'b', 'LineWidth', 3); % Volver a graficar la función seno
        hold on;
        grid on;
        axis([-2*pi 2*pi -1.5 1.5]); % Mantener los ejes ajustados
        xlabel('x');
        ylabel('y');
        title('Recta tangente a la función seno y = sin(x)', 'FontSize', 14);
        
        % Volver a dibujar los ejes x e y
        plot([-2*pi, 2*pi], [0, 0], 'k', 'LineWidth', 1.5); % Eje x en negro
        plot([0, 0], [-1.5, 1.5], 'k', 'LineWidth', 1.5); % Eje y en negro
    end
end