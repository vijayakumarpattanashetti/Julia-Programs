clc;
clear all;
t=[0:0.001:1];
fc=input('Enter the Frequency of Carrier Signal: ');
fm=input('Enter the Frequency of Message Signal: ');
c=sawtooth(2*pi*fc*t);
m=sin(2*pi*fm*t);
n=length(c);
for i=1:n
    if (m(i)>=c(i))
        pwms(i)=1;
    else
        pwms(i)=0;
    end
end
for j=1:n
    if pwms(j)==1;
        pwds(j)=sin(2*pi*fm*j/1000);
        
    else
        pwds(j)=sin(2*pi*fm*j/1000);
    end
end
subplot(2,2,1);
plot(t,m);
xlabel('Time');
ylabel('Amplitude');
title('Message Signal');
subplot(2,2,2);
plot(t,c);
xlabel('Time');
ylabel('Amplitude');
title('Carrier Signal');
subplot(2,2,3);
plot(t,pwms);
xlabel('Time');
ylabel('Amplitude');
title('PWM Signal');
axis([0 1 0 2]);
subplot(2,2,4);
plot(pwds);
xlabel('Time');
ylabel('Amplitude');
title('PWD Signal');
