% Load the noisy speech signal
[inputSignal, fs] = audioread('input.wav');

inputSignal = inputSignal(:, 1);

% Display the original signal and its spectrogram
figure;
subplot(2, 1, 1);
plot((1:length(inputSignal))/fs, inputSignal);
title('Original Noisy Speech Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(2, 1, 2);
spectrogram(inputSignal, 256, 250, 256, fs, 'yaxis');
title('Spectrogram of Original Noisy Speech Signal');

sound(inputSignal,fs);

pause(5);

% Apply Wiener filter to the spectrogram
outputSpectrogram = wiener2(abs(spectrogram(inputSignal, 256, 250, 256, fs)));

% Wiener filter for noise reduction of signal
outputSignal = wiener2(inputSignal, fs);

% Display the enhanced signal and its spectrogram
figure;
subplot(2, 1, 1);
plot(real(outputSignal));
title('Enhanced Speech Signal using Wiener Filter');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(2, 1, 2);
spectrogram(outputSignal, 256, 250, 256, fs, 'yaxis');
title('Spectrogram of Enhanced Speech Signal');

sound(outputSignal,fs);

% Save the enhanced signal as a new .wav file
audiowrite('enhanced_speech.wav', real(outputSignal), fs);
