t= [0:1/fs:1-1/fs]
fs = 8;  %sampling rates
f= 2;  %frequesncy
y = sin(2*pi*f*t)  %function
subplot(2,1,1)
plot(t,y)
title('sampling frequency matched')
%sampling frequency match with the original signal frequrncy and thats the
%double of original