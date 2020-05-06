clc; clear all; close all;
fm=input('Enter original signal frequency, fm: ');
fs=input('Enter sampling frequency, fs: ');
t=0:1/fs:0.5;
x=sin(2*pi*fm*t);
IF=input('Enter interpolation factor, IF: ');
DF=input('Enter decimation factor, DF: ');
xi=interp(x,IF);
xd=decimate(x,DF);
subplot(3,1,1)
stem(x)
xlabel('samples')
ylabel('amplitude')
title('Original Signal')
subplot(3,1,2)
stem(xi)
xlabel('samples')
ylabel('amplitude')
title('Interpolated Signal')
subplot(3,1,3)
stem(xd)
xlabel('samples')
ylabel('amplitude')
title('Decimated Signal')