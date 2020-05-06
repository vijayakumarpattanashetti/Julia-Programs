%Computation of Autocorrelation using xcorr fuction & verifying its any three properties
clc;
clear all;
close all;
a=input('Enter a DT signal(please input type of signal, if required. For e.g., sin(0:20) ), x(n): ');%to ask for the DT signal a
t1=[0:length(a)-1];
[ac,t]=xcorr(a); %computes autocorrelation of the signal a(n) with its time shifted version
subplot (2,1,1)
stem(t1,a) %plotting input signal
title('Input Signal')
ylabel('a(n)');
xlabel('n as time samples');
subplot (2,1,2)
stem(t,ac) %plotting autocorrelated signal
title('Autocorrelated Signal')
ylabel('Raa');
xlabel('n as time samples');
sgtitle(' Autocorrelation')%general title for all subplots
%Verification of Autocorrelation properties
if (max(ac)==ac(t==0)) %Maximum Value Property verification
    disp('Maximum Value Property: Raa is maximum at t=0 is verified.')
end
if round(ac,1)==round(flip(ac),1) %Symmetry Property verification
    disp('Symmetry Property: Raa(n)=Raa(-n) is verified.')
end
if round(sum(a.^2),1)==round(ac(t==0),1) %Energy Property verification
    disp('Energy Property: Ea(n)=Raa(0) is verified.')
end
if round(ac,1)==round(conv(a,flip(a)),1) %Convolution Property verification
    disp('Convolution Property: Raa(n)=a(n)*a(-n) is verified.')
end
