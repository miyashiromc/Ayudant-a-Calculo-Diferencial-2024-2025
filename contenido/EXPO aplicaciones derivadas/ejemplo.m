% Limpiar la pantalla y las variables
clc;
clear;

% Definir el rango de x para la función cúbica
x = -2:0.1:5; % Rango ajustado para mejor visualización
y = x.^3 - 6*x.^2 + 9*x + 1; % Definir la función cúbica

% Graficar la función cúbica
figure;
plot(x, y, 'b', 'LineWidth', 3); % Función cúbica en azul grueso
hold on;
grid on;
axis([-2 5 -10 10]); % Ajustar los ejes para mejor visualización
xlabel('x');
ylabel('f(x)');
title('Recta tangente a la función cúbica f(x) = x^3 - 6x^2 + 9x + 1', 'FontSize', 14);

% Dibujar el eje x (y = 0)
plot([-2, 5], [0, 0], 'k', 'LineWidth', 1.5); % Eje x en negro

% Dibujar el eje y (x = 0)
plot([0, 0], [-10, 10], 'k', 'LineWidth', 1.5); % Eje y en negro

% Pausa inicial de 2 segundos
pause(2);

% Derivada de la función f(x) = x^3 - 6x^2 + 9x + 1
% f'(x) = 3x^2 - 12x + 9
df = @(x) 3*x.^2 - 12*x + 9;

% Bucle para mover la recta tangente a lo largo de la función
for i = 1:length(x)
    % Punto actual en la función cúbica
    x0 = x(i);
    y0 = x0^3 - 6*x0^2 + 9*x0 + 1;
    
    % Calcular la pendiente de la recta tangente
    m = df(x0); % f'(x) = 3x^2 - 12x + 9
    
    % Definir la recta tangente usando la ecuación y = m(x - x0) + y0
    x_tangent = x0 - 2:0.1:x0 + 2; % Rango de x para la recta tangente
    y_tangent = m * (x_tangent - x0) + y0;
    
    % Graficar la recta tangente
    plot(x_tangent, y_tangent, 'r', 'LineWidth', 2); % Recta tangente en rojo
    plot(x0, y0, 'ko', 'MarkerFaceColor', 'k', 'MarkerSize', 10); % Punto de tangencia en negro
    
    % Pausa para visualizar el movimiento
    pause(0.05);
    
    % Borrar la recta tangente anterior (excepto en la última iteración)
    if i < length(x)
        clf;
        plot(x, y, 'b', 'LineWidth', 3); % Volver a graficar la función cúbica
        hold on;
        grid on;
        axis([-2 5 -10 10]); % Mantener los ejes ajustados
        xlabel('x');
        ylabel('f(x)');
        title('Recta tangente a la función cúbica f(x) = x^3 - 6x^2 + 9x + 1', 'FontSize', 14);
        
        % Volver a dibujar los ejes x e y
        plot([-2, 5], [0, 0], 'k', 'LineWidth', 1.5); % Eje x en negro
        plot([0, 0], [-10, 10], 'k', 'LineWidth', 1.5); % Eje y en negro
    end
end
