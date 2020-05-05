clc; close all; clear all;
fm=input('Enter Frequency of the message signal: ');
fs=input('Enter Sampling Frequency: ');
fc=input('Enter Frequency of the carrier signal: ');
delf=input('Enter Frequency Deviation, delf: ');
t=[0:1/fs:0.5-1/fs]';
x=sin(2*pi*fm*t);
%y=modulate(x,fc,fs,'fm');
%m=demod(y,fc,fs,'fm');
y=fmmod(x,fc,fs,delf);
m=fmdemod(y,fc,fs,delf);
subplot(3,1,1)
plot(t,x)
xlabel('Time (s)')
ylabel('Amplitude')
title('Message Signal')
subplot(3,1,2)
plot(t,y)
xlabel('Time (s)')
ylabel('Amplitude')
title('Modulated Signal')
subplot(3,1,3)
plot(t,m)
xlabel('Time (s)')
ylabel('Amplitude')
title('Demodulated Signal')
sgtitle('FM Modulation and Demodulation');