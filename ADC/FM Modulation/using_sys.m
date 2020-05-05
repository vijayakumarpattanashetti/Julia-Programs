clc; close all; clear all;
fm=input('Enter Frequency of the message signal: ');
fs=input('Enter Sampling Frequency: ');
delf=input('Enter Frequency Deviation: ');
t=[0:1/fs:0.5-1/fs]';
x=sin(2*pi*fm*t);
modulation=comm.FMModulator('SampleRate',fs,'FrequencyDeviation',delf);
demodulation=comm.FMDemodulator(modulation);
y=step(modulation,x);
m=step(demodulation,y);
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