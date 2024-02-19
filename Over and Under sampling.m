fs = 100; %original sampling rate
t = 0:1/fs:5; 
f = 1; % Frequency 

y = sin(2*pi*f*t);

subplot(3,1,1);
stem(t, y);
title('Original Signal');


% over-sampling rate
fs_oversample = 10000; 
t1 = 0:1/fs_oversample:1; 
y_oversample = sin(2*pi*f*t1);

subplot(3,1,2);
stem(t1, y_oversample);%over sampling becuase we increase the samples
title('Over-sampling');


%  under-sampling rate
fs_undersample = 1; 
t2 = 0:1/fs_undersample:5; 
y_undersample = sin(2*pi*f*t2);

subplot(3,1,3);
stem(t2, y_undersample);%under sampling becuase of the less sampling
title('Under-sampling');
