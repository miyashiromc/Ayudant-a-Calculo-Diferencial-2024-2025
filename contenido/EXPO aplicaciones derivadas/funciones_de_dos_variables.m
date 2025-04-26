% Rango de valores para x y y
[x, y] = meshgrid(-10:0.5:10, -10:0.5:10);

% Calcular f(x, y) evitando la división por cero en y = 1
z = (2.*x.*y + 3.*x) ./ (y - 1);

% Para evitar mostrar valores indefinidos, asignamos NaN donde y = 1
z(y == 1) = NaN;

% Graficar
figure;
surf(x, y, z);
xlabel('x');
ylabel('y');
zlabel('f(x, y)');
title('Gráfica de f(x, y) = (2xy + 3x)/(y - 1)');
colorbar;
shading interp;
grid on;
