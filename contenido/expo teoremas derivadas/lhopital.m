% Aplicación de la Regla de L'Hôpital con un ejercicio sencillo
syms x;

% Definir una función más simple para aplicar L'Hôpital
num = x^2 - 4;
den = x - 2;

% Calcular el límite directamente
limite_directo = limit(num/den, x, 2);

% Aplicar la Regla de L'Hôpital (derivar numerador y denominador)
num_deriv = diff(num);
den_deriv = diff(den);
limite_lhopital = limit(num_deriv / den_deriv, x, 2);

% Mostrar resultados
disp('Límite directo:');
disp(limite_directo);
disp('Límite aplicando L''Hôpital:');
disp(limite_lhopital);

% Graficar la función y la aproximación del límite
x_vals = linspace(1, 3, 500);
y_vals = (x_vals.^2 - 4) ./ (x_vals - 2);

figure;
hold on;
grid on;
plot(x_vals, y_vals, 'b', 'LineWidth', 2);
plot(2, limite_lhopital, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
title('Límite usando L''Hôpital para (x^2 - 4) / (x - 2) en x → 2');
xlabel('x'); ylabel('f(x)');
legend({'f(x) = (x^2 - 4) / (x - 2)', 'Límite en x = 2'}, 'Location', 'NorthWest');
hold off;