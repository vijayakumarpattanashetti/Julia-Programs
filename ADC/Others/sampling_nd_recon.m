clc; clear all; close all;
t=[0:0.1:20];
fm=input('Enter Frequency of the message signal: ');
x=sin(2*pi*fm*t);
sr=input('Enter samples required: ');
rs=(sr-1)*10;
xs=x(1:10:rs+1);
xre=0;
for k=0:length (xs)-1
stem(0:length(xs)-1,xs,'filled')
l=[k:-.1:-20+k];
xre=xre+xs(k+1)*sinc(l);
subplot(3,1,1)
plot(t,x)
title('original signal')
xlabel('t')
ylabel('x(t)')
subplot(3,1,2)
stem(xs,'filled')
title('Sampled signal')
xlabel('n')
ylabel('xs(n)')
axis([0 20 -2 2])
subplot(3,1,3)
plot(t,xre)
axis([0 20 -2 2])
end