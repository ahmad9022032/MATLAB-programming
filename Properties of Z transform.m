n = 0:10;
x = sin(0.1*pi*n);
% signal shifting > n-2 = 0
shift = -2;
y = [zeros(1, abs(shift)), x(1:end-abs(shift))];

% Z_transform and X is the original signal and Y is the shifted signal
syms z; 
X = sum(x .* z.^(-n)); 
Y = sum(y .* z.^(-n)); 

% Verify the time shifting property of the Z-transform
if simplify(X * z^shift) == Y
    disp('The time shifting property of the Z-transform is verified.');
else
    disp('The time shifting property of the Z-transform is not verified.');
end

% Display the original and shifted signals
disp('Original Signal:');
disp(x);
disp('Shifted Signal:');
disp(y);

% Plot the original and shifted signals
figure;
subplot(2, 1, 1);
stem(n, x);
title('Original Signal');
subplot(2, 1, 2);
stem(n, y);
title('Shifted Signal');

% Due to sin signal the time shifted property is not satisfied because it
% gives diffrent results when signal start from 0 and start from 2.
