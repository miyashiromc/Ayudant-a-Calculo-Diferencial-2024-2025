% Código en MATLAB para visualizar seno y coseno en columna vertical

% Limpiar la pantalla y las variables
clc;
clear;

% Crear una figura con 2 subplots en columna vertical
figure;

% ==================================================
% Gráfica 1: Función seno y = sin(x)
% ==================================================
subplot(2, 1, 1); % Primer subplot (arriba)

% Definir el rango de x para la función seno
x1 = -2*pi:0.1:2*pi;

% Definir la función seno y = sin(x)
y1 = sin(x1);

% Graficar la función seno
plot(x1, y1, 'b', 'LineWidth', 3); % Función seno en azul grueso
hold on;
grid on;
axis([-2*pi 2*pi -1.5 1.5]); % Ajustar los ejes para mejor visualización
xlabel('x');
ylabel('y');
title('Recta tangente a la función seno y = sin(x)', 'FontSize', 12);

% Dibujar el eje x (y = 0)
plot([-2*pi, 2*pi], [0, 0], 'k', 'LineWidth', 1.5); % Eje x en negro

% Dibujar el eje y (x = 0)
plot([0, 0], [-1.5, 1.5], 'k', 'LineWidth', 1.5); % Eje y en negro

% Pausa inicial de 2 segundos
pause(2);

% Bucle para mover la recta tangente a lo largo de la curva
for i = 1:length(x1)
    % Punto actual en la curva
    x0 = x1(i);
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
    if i < length(x1)
        cla; % Limpiar solo el subplot actual
        plot(x1, y1, 'b', 'LineWidth', 3); % Volver a graficar la función seno
        hold on;
        grid on;
        axis([-2*pi 2*pi -1.5 1.5]); % Mantener los ejes ajustados
        xlabel('x');
        ylabel('y');
        title('Recta tangente a la función seno y = sin(x)', 'FontSize', 12);
        
        % Volver a dibujar los ejes x e y
        plot([-2*pi, 2*pi], [0, 0], 'k', 'LineWidth', 1.5); % Eje x en negro
        plot([0, 0], [-1.5, 1.5], 'k', 'LineWidth', 1.5); % Eje y en negro
    end
end

% ==================================================
% Gráfica 2: Función coseno y = cos(x)
% ==================================================
subplot(2, 1, 2); % Segundo subplot (abajo)

% Definir el rango de x para la función coseno
x2 = -2*pi:0.1:2*pi;

% Definir la función coseno y = cos(x)
y2 = cos(x2);

% Graficar la función coseno
plot(x2, y2, 'b', 'LineWidth', 3); % Función coseno en azul grueso
hold on;
grid on;
axis([-2*pi 2*pi -1.5 1.5]); % Ajustar los ejes para mejor visualización
xlabel('x');
ylabel('y');
title('Recta tangente a la función coseno y = cos(x)', 'FontSize', 12);

% Dibujar el eje x (y = 0)
plot([-2*pi, 2*pi], [0, 0], 'k', 'LineWidth', 1.5); % Eje x en negro

% Dibujar el eje y (x = 0)
plot([0, 0], [-1.5, 1.5], 'k', 'LineWidth', 1.5); % Eje y en negro

% Pausa inicial de 2 segundos
pause(2);

% Bucle para mover la recta tangente a lo largo de la curva
for i = 1:length(x2)
    % Punto actual en la curva
    x0 = x2(i);
    y0 = cos(x0);
    
    % Derivada de y = cos(x) (pendiente de la recta tangente)
    m = -sin(x0); % dy/dx = -sin(x)
    
    % Definir la recta tangente y = m(x - x0) + y0
    x_tangent = x0 - 1:0.1:x0 + 1; % Rango de x para la recta tangente
    y_tangent = m*(x_tangent - x0) + y0;
    
    % Graficar la recta tangente
    plot(x_tangent, y_tangent, 'r', 'LineWidth', 2); % Recta tangente en rojo
    plot(x0, y0, 'ko', 'MarkerFaceColor', 'k', 'MarkerSize', 10); % Punto de tangencia en negro
    
    % Pausa para visualizar el movimiento
    pause(0.05);
    
    % Borrar la recta tangente anterior (excepto en la última iteración)
    if i < length(x2)
        cla; % Limpiar solo el subplot actual
        plot(x2, y2, 'b', 'LineWidth', 3); % Volver a graficar la función coseno
        hold on;
        grid on;
        axis([-2*pi 2*pi -1.5 1.5]); % Mantener los ejes ajustados
        xlabel('x');
        ylabel('y');
        title('Recta tangente a la función coseno y = cos(x)', 'FontSize', 12);
        
        % Volver a dibujar los ejes x e y
        plot([-2*pi, 2*pi], [0, 0], 'k', 'LineWidth', 1.5); % Eje x en negro
        plot([0, 0], [-1.5, 1.5], 'k', 'LineWidth', 1.5); % Eje y en negro
    end
end