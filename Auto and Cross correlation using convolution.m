n = 0:9;
ph1 = 0; % set the phase angles for the two sinusoidal signals to 0.
ph2 = pi; 
x = sin(2*pi*0.1*n + ph1); % generates the first sinusoidal signal x with a frequency of 0.1 Hz and phase ph1.
org_x = 1; 
nx = (0:length(x)-1) - org_x + 1; 
y = sin(2*pi*0.1*n + ph2); 
org_y = 1; 
ny = (0:length(y)-1) - org_y + 1; 

% Compute cross-correlation using convolution
rxy_conv = conv(x, flip(y));

% Define the lag indices
nr_conv = (nx(1) + ny(1)) : (nx(end) + ny(end));

% Find the maximum correlation
[maxR_conv, indR_conv] = max(rxy_conv);

% Check for autocorrelation (ph1 = ph2)
if ph1 == ph2
    energy_x = sum(x.^2); % Calculate energy of x
    disp(['The energy of the signal x is: ' num2str(energy_x) '.']);
    disp(['The correlation at lag zero for conv(x,flip(y)) is: ' num2str(rxy_conv(find(nr_conv==0))) '.']);
    disp('Since ph1 = ph2, the energy of the signal should match the correlation at lag zero.');
else
    disp('The phase angles are not equal. Cannot check for energy equivalence.');
end

disp(['The maximum correlation for conv(x,flip(y)) is at lag ' num2str(nr_conv(indR_conv)) '.']); 

subplot(6,1,1); 
stem(nx, x); 
xlabel('Time index n'); 
ylabel('Amplitude'); 
xlim([nx(1)-1 nx(end)+1]); 
title('Signal x(n)'); 
grid; 

subplot(6,1,2); 
stem(ny, y); 
xlabel('Time index n'); 
ylabel('Amplitude'); 
xlim([ny(1)-1 ny(end)+1]); 
title('Signal y(n)'); 
grid; 

subplot(6,1,3); 
stem(nr_conv, rxy_conv); 
xlabel('Time index n'); 
ylabel('Amplitude'); 
xlim([nr_conv(1)-1 nr_conv(end)+1]); 
title('Cross Correlation conv(x,flip(y))'); 
grid;

subplot(6,1,4); 
stem(nx, x); 
xlabel('Time index n'); 
ylabel('Amplitude'); 
xlim([nx(1)-1 nx(end)+1]); 
title('Signal x(n)'); 
grid; 

subplot(6,1,5); 
stem(ny, y); 
xlabel('Time index n'); 
ylabel('Amplitude'); 
xlim([ny(1)-1 ny(end)+1]); 
title('Signal y(n)'); 
grid; 

subplot(6,1,6); 
stem(nr_conv, rxy_conv); 
xlabel('Time index n'); 
ylabel('Amplitude'); 
xlim([nr_conv(1)-1 nr_conv(end)+1]); 
title('Cross Correlation conv(x,flip(y))'); 
grid;
