n = 0:10;
x = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
h = [1, 2, 3, 4, 5];

% convolution in time domain to get y signal
y = conv(x, h);

% Z_transform of 𝑥[𝑛], ℎ[𝑛], and 𝑦[𝑛].
syms z;
X = sum(x .* z.^(-n));
H = sum(h .* z.^(-0:length(h)-1));
Y = sum(y .* z.^(-0:length(y)-1));

% Verify the convolution property of the Z-transform
if simplify(X * H) == Y
    disp('The convolution property of the Z-transform is verified.');
else
    disp('The convolution property of the Z-transform is not verified.');
end

% original signals an output signal
disp('Signal x[n]:');
disp(x);
disp('Signal h[n]:');
disp(h);
disp('Output signal y[n]:');
disp(y);

% Z_transform of x[n], h[n], and y[n]
disp('Z-transform of x[n]:');
disp(X);
disp('Z-transform of h[n]:');
disp(H);
disp('Z-transform of y[n]:');
disp(Y);

figure;
subplot(3, 1, 1);
stem(n, x);
title('Signal x[n]');
subplot(3, 1, 2);
stem(0:length(h)-1, h);
title('Signal h[n]');
subplot(3, 1, 3);
stem(0:length(y)-1, y);
title('Output signal y[n]');
