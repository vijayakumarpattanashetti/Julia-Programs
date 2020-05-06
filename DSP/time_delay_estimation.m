clc; clear all; close all;
to=input('Enter samples required, N: ');
ac=input('Enter attenuation constant, ac: ');
dt=input('Enter delay, dt: ');
t=[0:to-1];
l=length(t); xt=zeros(1,l); y1t=zeros(1,l);
wgn=randn(1,l);
for i=0:3
    xt(i+1)=3;
    y1t(i+1+dt)=ac*xt(i+1);
end
yt=y1t+wgn;
Rxy=xcorr(xt,yt);
Rxy=Rxy(1:l);
Rxy=flip(Rxy);
edt=find(Rxy==max(Rxy))-1
subplot(3,2,1)
plot(t,xt)
title('Signal, x(t)')
xlabel('time(s)')
ylabel('amplitude')
subplot(3,2,2)
plot(t,y1t)
title('Delayed Signal, ac.x(t-dt)')
xlabel('time(s)')
ylabel('amplitude')
subplot(3,2,3)
plot(t,yt)
grid on
grid minor
title('Recieved Signal, y(t)')
xlabel('time(s)')
ylabel('amplitude')
subplot(3,2,4)
plot(t,wgn)
grid on
grid minor
title('White Gaussian Noise')
xlabel('time(s)')
ylabel('amplitude')
subplot(3,2,5)
plot(t,Rxy)
hold on
plot(t(edt+1),Rxy(edt+1), '*')
plot(t(edt+1),Rxy(1), '*')
grid on
grid minor
title('Cross-correlated Signal')
xlabel('time(s)')
ylabel('amplitude')
sgtitle('N=128; ac=0.8; dt=39')
