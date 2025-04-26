% Código en MATLAB para visualizar las 3 gráficas en columna vertical

% Limpiar la pantalla y las variables
clc;
clear;

% Crear una figura con 3 subplots en columna vertical
figure;

% ==================================================
% Gráfica 1: Parábola y = x^2
% ==================================================
subplot(3, 1, 1); % Primer subplot

% Definir el rango de x para la parábola
x1 = -5:0.1:5;

% Definir la función de la parábola y = x^2
y1 = x1.^2;

% Graficar la parábola
plot(x1, y1, 'b', 'LineWidth', 3); % Parábola en azul grueso
hold on;
grid on;
axis([-5 5 -5 25]); % Ajustar los ejes para mejor visualización
xlabel('x');
ylabel('y');
title('Recta tangente a la parábola y = x^2', 'FontSize', 12);

% Dibujar el eje x (y = 0)
plot([-5, 5], [0, 0], 'k', 'LineWidth', 1.5); % Eje x en negro

% Dibujar el eje y (x = 0)
plot([0, 0], [-5, 25], 'k', 'LineWidth', 1.5); % Eje y en negro

% Pausa inicial de 2 segundos
pause(2);

% Bucle para mover la recta tangente a lo largo de la parábola
for i = 1:length(x1)
    % Punto actual en la parábola
    x0 = x1(i);
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
    if i < length(x1)
        cla; % Limpiar solo el subplot actual
        plot(x1, y1, 'b', 'LineWidth', 3); % Volver a graficar la parábola
        hold on;
        grid on;
        axis([-5 5 -5 25]); % Mantener los ejes ajustados
        xlabel('x');
        ylabel('y');
        title('Recta tangente a la parábola y = x^2', 'FontSize', 12);
        
        % Volver a dibujar los ejes x e y
        plot([-5, 5], [0, 0], 'k', 'LineWidth', 1.5); % Eje x en negro
        plot([0, 0], [-5, 25], 'k', 'LineWidth', 1.5); % Eje y en negro
    end
end

% ==================================================
% Gráfica 2: Función cúbica y = x^3
% ==================================================
subplot(3, 1, 2); % Segundo subplot

% Definir el rango de x para la función cúbica
x2 = -2:0.1:2;

% Definir la función cúbica y = x^3
y2 = x2.^3;

% Graficar la función cúbica
plot(x2, y2, 'b', 'LineWidth', 3); % Función cúbica en azul grueso
hold on;
grid on;
axis([-2 2 -8 8]); % Ajustar los ejes para mejor visualización
xlabel('x');
ylabel('y');
title('Recta tangente a la función cúbica y = x^3', 'FontSize', 12);

% Dibujar el eje x (y = 0)
plot([-2, 2], [0, 0], 'k', 'LineWidth', 1.5); % Eje x en negro

% Dibujar el eje y (x = 0)
plot([0, 0], [-8, 8], 'k', 'LineWidth', 1.5); % Eje y en negro

% Pausa inicial de 2 segundos
pause(2);

% Bucle para mover la recta tangente a lo largo de la curva
for i = 1:length(x2)
    % Punto actual en la curva
    x0 = x2(i);
    y0 = x0^3;
    
    % Derivada de y = x^3 (pendiente de la recta tangente)
    m = 3*x0^2; % dy/dx = 3x^2
    
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
        plot(x2, y2, 'b', 'LineWidth', 3); % Volver a graficar la función cúbica
        hold on;
        grid on;
        axis([-2 2 -8 8]); % Mantener los ejes ajustados
        xlabel('x');
        ylabel('y');
        title('Recta tangente a la función cúbica y = x^3', 'FontSize', 12);
        
        % Volver a dibujar los ejes x e y
        plot([-2, 2], [0, 0], 'k', 'LineWidth', 1.5); % Eje x en negro
        plot([0, 0], [-8, 8], 'k', 'LineWidth', 1.5); % Eje y en negro
    end
end

% ==================================================
% Gráfica 3: Función seno y = sin(x)
% ==================================================
subplot(3, 1, 3); % Tercer subplot

% Definir el rango de x para la función seno
x3 = -2*pi:0.1:2*pi;

% Definir la función seno y = sin(x)
y3 = sin(x3);

% Graficar la función seno
plot(x3, y3, 'b', 'LineWidth', 3); % Función seno en azul grueso
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
for i = 1:length(x3)
    % Punto actual en la curva
    x0 = x3(i);
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
    if i < length(x3)
        cla; % Limpiar solo el subplot actual
        plot(x3, y3, 'b', 'LineWidth', 3); % Volver a graficar la función seno
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