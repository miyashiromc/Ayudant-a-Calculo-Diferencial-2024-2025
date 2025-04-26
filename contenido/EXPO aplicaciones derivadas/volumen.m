% Definir el rango de x e y
[x, y] = meshgrid(-10:0.5:10, -10:0.5:10);

% Calcular la función v(x, y)
v = pi * x.^2 .* y;

% Crear el gráfico de superficie
figure;
surf(x, y, v);

% Etiquetas de los ejes
xlabel('x');
ylabel('y');
zlabel('v(x, y)');
title('Gráfico de la función v(x, y) = \pi * x^2 * y');

% Mejorar la visualización
colorbar;
shading interp;
