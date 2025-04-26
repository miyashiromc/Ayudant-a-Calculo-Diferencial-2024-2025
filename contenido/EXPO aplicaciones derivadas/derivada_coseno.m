%% Simulación de un sistema 5G con Beamforming en MATLAB

% Parámetros del sistema
numAntennasBS = 64;          % Número de antenas en la estación base (BS)
numAntennasUE = 64;          % Número de antenas en el usuario (UE) (debe ser igual a numAntennasBS)
fc = 28e9;                  % Frecuencia portadora en Hz (28 GHz)
bandwidth = 100e6;          % Ancho de banda en Hz
numSymbols = 1000;          % Número de símbolos a transmitir
snr = 20;                   % Relación señal-ruido (SNR) en dB
theta = 30;                 % Ángulo de llegada (DoA) en grados

% Generar una señal aleatoria (datos binarios)
data = randi([0 1], numSymbols, 1);         % Datos binarios
modulatedData = pskmod(data, 4);            % Modulación QPSK (4-PSK)

% Configurar el canal MIMO
channel = comm.MIMOChannel(...
    'SampleRate', bandwidth, ...
    'PathDelays', [0 1e-9 2e-9], ...       % Retrasos de los caminos
    'AveragePathGains', [0 -3 -6], ...     % Ganancia promedio de los caminos
    'MaximumDopplerShift', 30, ...         % Desplazamiento Doppler máximo
    'TransmitCorrelationMatrix', eye(numAntennasBS), ... % Matriz de correlación de transmisión
    'ReceiveCorrelationMatrix', eye(numAntennasUE), ...  % Matriz de correlación de recepción
    'NumTransmitAntennas', numAntennasBS, ...
    'NumReceiveAntennas', numAntennasUE);

% Beamforming en la estación base (BS)
steeringVector = exp(-1j*2*pi*(0:numAntennasBS-1)'*sind(theta)/2); % Vector de dirección
weights = steeringVector / norm(steeringVector);                   % Pesos de beamforming
transmittedSignal = weights * modulatedData.';                     % Señal transmitida con beamforming

% Transmitir la señal a través del canal MIMO
receivedSignal = channel(transmittedSignal.');                     % Señal recibida en el UE

% Añadir ruido a la señal recibida
noisySignal = awgn(receivedSignal, snr, 'measured');               % Añadir ruido AWGN

% Beamforming en el usuario (UE)
receiveWeights = conj(steeringVector) / norm(steeringVector);      % Pesos de recepción

% Combinar señales recibidas
combinedSignal = receiveWeights.' * noisySignal;                   % Multiplicación de matrices

% Decodificación de la señal
demodulatedData = pskdemod(combinedSignal, 4);                    % Demodulación QPSK

% Calcular la tasa de error de bits (BER)
[numErrors, ber] = biterr(data, demodulatedData);                  % Calcular BER
fprintf('Tasa de error de bits (BER): %f\n', ber);

% Visualización del patrón de haz
figure;
pattern(weights, fc, -90:90, 0, 'CoordinateSystem', 'rectangular');
title('Patrón de haz de Beamforming');
xlabel('Ángulo (grados)');
ylabel('Ganancia (dB)');

% Visualización de la constelación de la señal recibida
figure;
scatterplot(combinedSignal);
title('Constelación de la señal recibida');
grid on;