clc; clear all; close all; 
f=2500;%Carrier frequency 
fs=200000;%Sample frequency
N=8000;%Number of samples
Ts=1/fs;
t=(0:Ts:(N*Ts)- Ts);
f1=150;%Modulating frequency
msg=sin(2*pi*f1*t);
kf=.07;%Modulation index
%modulated carrier to be tracked
Signal=exp(j*(2*pi*f*t+2*pi*kf*cumsum(msg)));%Modulated carrier
Signal1=exp(j*(2*pi*f*t));%Unmodulated carrier
%Initilize PLL Loop 
phi(1)=30; 
e(1)=0; 
output(1)=0; 
vco(1)=0; 
%Define Loop Filter parameters(Sets damping)
kp=0.12; %Proportional constant 
ki=0.09; %Integrator constant 
%PLL implementation 
for n=2:length(Signal) 
vco(n)=conj(exp(j*(2*pi*n*f/fs+phi(n-1))));%VCO O/P 
output(n)=imag(Signal(n)*vco(n));%VCO x Signal input 
e(n)=e(n-1)+(kp+ki)*output(n)-ki*output(n-1);%Filter integrator 
phi(n)=phi(n-1)+e(n);%Update VCO 
end; 
startplot = 1;
endplot = 2500;
subplot(3,2,1);
plot(t(startplot:endplot), msg(startplot:endplot));
title('Signal');
xlabel('Time(s)');
ylabel('Amplitude');
grid;
subplot(3,2,2);
plot(t(startplot:endplot), real(Signal(startplot:endplot)));
title('FM Signal)');
xlabel('Time(s)');
ylabel('Amplitude');
grid;
subplot(3,2,3);
plot(t(startplot:endplot), e(startplot:endplot));
title('PLL Loop Filter/Integrator Output');
xlabel('Time(s)');
ylabel('Amplitude');
grid;
subplot(3,2,4);
plot(t(startplot:endplot), real(vco(startplot:endplot)));
title('VCO Output - tracking the input signal)');
xlabel('Time(s)');
ylabel('Amplitude');
grid;
subplot(3,2,5);
plot(t(startplot:endplot), phd_output(startplot:endplot));
title('Phase Detecter Output');
xlabel('Time(s)');
ylabel('Amplitude');
grid;
subplot(3,2,6);
plot(t(startplot:endplot), real(Signal1(startplot:endplot)));
title('Unmodulated Carrier');
xlabel('Time(s)');
ylabel('Amplitude');
grid;
