%Computation of N-Point DFT using mathematical definition & comparing results with fft results
clc;
clear all;
close all;
x=input('Enter the signal(please input type of signal, if required. For e.g., sin(0:20), x(n): '); %asking for the signal x
N=input('Enter DFT samples required, should not be less than length of input signal: '); %asking DFT samples
l=length(x);%computes length of input signal x
if N<l %checks if DFT samples rquired is less than the length of input signal
    %if true
    disp('Invalid choice.') %displays invalid if DFT samples rquired is less than the length of input signal
    return%terminates the code
elseif N>l %checks if DFT samples rquired is greater than the length of input signal
    %if true
    x=[x,zeros(1,N-l)]; %appends input signal with leading zeros
    l=length(x);%computes length of updated input signal x
end
X=zeros(N,1); %initialises DFT matrix to zero matrix
%X(k)=nΣ(0→N-1)[x(n).exp(-2j*pi*k*n/N)]; k€[0,N-1]
for k=0:N-1 %possible k cases
    for n=0:N-1 %possible n values
        X(k+1)=X(k+1)+x(n+1)*exp(-j*2*pi*k*n/N); %computes summation for each case of k
    end
end
disp('DFT using definition(nested for loops), X(k): ')
X %resultant DFT using definition(nested for loops)
disp('DFT using fft(in built function), X(k): ')
X0=fft(x);
[X0] %resultant DFT using fft(in built function)
p=[0:1:l-1];
subplot(3,1,1)%subplot 1
stem(p,x)%input signal
title('Input Signal')%title of subplot 1
xlabel('samples')%x axis variable
ylabel('amplitude')%y axis variable
subplot(3,1,2)%subplot 2
stem(p,abs(X))%DFT absolute value, |X|, using definition
title('Magnitude Plot')%title of subplot 2
xlabel('samples')%x axis variable
ylabel('magnitude') %y axis variable
hold on
stem(p,abs(X0), '*') %DFT absolute value, |X0|, using fft function (*)
hold off
subplot(3,1,3) %subplot 3
stem(p,unwrap(angle(X))*180/pi) %DFT angle, /_X, using definition
title('Phase Plot') %title of subplot 3
xlabel('samples') %x axis variable
ylabel('phase') %y axis variable
hold on
stem (p,unwrap(angle(X0))*180/pi, '*') %DFT angle, /_X0, using fft function (*)
hold off
sgtitle('Computation of N-point DFT')%general title for all subplots