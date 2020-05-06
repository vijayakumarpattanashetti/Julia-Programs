%Plotting impulse response of the DT system given by the difference equation: y(n)+0.7y(n-1)-0.45y(n-2)-0.6y(n-3)=0.8x(n)-0.44x(n-1)+0.36x(n-2)+0.2x(n-3)
clc;
clear all;
close all;
N=input('Enter N Value for number of samples required: ') %no. of samples
b=[0.8 -0.44 0.36 0.2]; %coefficints of x(n)
a=[1 0.7 -0.45 -0.6]; %coefficints of y(n)
x=[1,zeros(1,N-1)]; %impulse train
y=filter(b,a,x); %impulse response use filter function
n=0:N-1; %length of response
stem(n,y) %plotting impulse response
title('Impulse Response of the given system')
xlabel('samples')
ylabel('amplitude')