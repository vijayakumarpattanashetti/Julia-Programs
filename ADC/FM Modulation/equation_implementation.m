clc; close all; clear all;
t=[0:0.001:1];
Am=input('Enter Amplitude of the message signal: ');
Ac=input('Enter Amplitude of the carrier signal: ');
fm=input('Enter Frequency of the message signal: ');
fc=input('Enter Frequency of the carrier signal: ');
beta=input('Enter Modulation Index, beta: ');
m=Am*cos(2*pi*fm*t);
c=Ac*cos(2*pi*fc*t);
y=Ac*cos(2*pi*fc*t+m.*cos(2*pi*fm*t));
subplot(3,1,1)
plot(t,m)
xlabel('Time (s)')
ylabel('Amplitude')
title('Message Signal')
subplot(3,1,2)
plot(t,c)
xlabel('Time (s)')
ylabel('Amplitude')
title('Modulated Signal')
subplot(3,1,3)
plot(t,y)
xlabel('Time (s)')
ylabel('Amplitude')
title('Demodulated Signal')
sgtitle('FM Modulation and Demodulation');