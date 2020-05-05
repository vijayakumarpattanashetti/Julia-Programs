clc; close all; clear all;
fm=input('Enter Frequency of the message signal: ');
fc=input('Enter Frequency of the carrier signal: ');
t=[0:0.01:1];
x=sin(2*pi*fm*t);
c=(1+square(2*pi*fc*t))/2;
pam=x.*c;
ppad=pam./c;
for i=1:1:101
    if pam(i)==0
        ppad(i)=sin(2*pi*fm*t(i));
    end
end
subplot(2,2,1)
plot(t,x)
xlabel('Time (s)')
ylabel('Amplitude')
title('Message Signal')
subplot(2,2,2)
plot(t,c)
xlabel('Time (s)')
ylabel('Amplitude')
title('Carrier Signal')
axis([0 1.2 -.5 1.5])
subplot(2,2,3)
plot(t,pam)
xlabel('Time (s)')
ylabel('Amplitude')
title('Modulated Signal')
subplot(2,2,4)
plot(t,ppad)
xlabel('Time (s)')
ylabel('Amplitude')
title('Demodulated Signal')
sgtitle('PAM');