[y, Fs] = audioread('myAudio.wav');
t = (0:length(y)-1)/Fs;

% Calculate the Discrete Fourier Transform (DFT)
N = length(y); 
Y = fft(y);
f = (0:N-1)*(Fs/N); % Frequency vector

% Plot the signal in the time domain
figure;
subplot(2,1,1);
plot(t, y);
xlabel('Time (s)');
ylabel('Amplitude');
title('Sound Signal in Time Domain');
% Plot the magnitude spectrum in the frequency domain
subplot(2,1,2);
stem(f, abs(Y)/N);
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Magnitude Spectrum');

% Identify the fundamental frequency
[max_mag, index] = max(abs(Y(1:N/2))); %peak magnitude and index
fundamental_freq = f(index); % Fundamental frequency

% Calculate energy in the fundamental frequency and harmonics
fundamental_energy = abs(Y(index))^2/N; % Energy in the fundamental frequency
harmonics_energy = sum(abs(Y(2*index:index:end)).^2)/N; % Energy in harmonics

fprintf('Fundamental Frequency: %.2f Hz\n', fundamental_freq);
fprintf('Energy in Fundamental Frequency: %.2f\n', fundamental_energy);
fprintf('Energy in Harmonics: %.2f\n', harmonics_energy);