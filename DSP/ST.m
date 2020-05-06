%Verification of Sampling theorem for different sampling rates
clc;
clear all;
close all;
%user input parameters
m=input('Choose CT signal type : sine or cosine ','s');%asking for the type of CT signal Sm
t=input('Enter the message signal length: '); %asking for message signal length
n=input('Enter the sampled signal length: '); %asking for sampled signal length
fm=input('Enter the message signal frequency: '); %asking for message signal frequency
fn=input('Enter the Niquist frequency for perfect sampling: '); %asking for Nquist sampling rate
fu=input('Enter the Under sampling frequency: '); %asking for sampling rate less than Nquist sampling rate
fo=input('Enter the Over sampling frequency: '); %asking for sampling rate greater than Nquist sampling rate
if strcmp('sine',m) %checks if the message signal is sine
    Sm=sin(2*pi*fm*t); %message signal
    Sn=sin(2*pi*fm/fn*n); %perfect sampled signal
    Su=sin(2*pi*fm/fu*n); %under sampled signal
    So=sin(2*pi*fm/fo*n); %over sampled signal
elseif strcmp('cosine',m) %checks if the message signal is cosine
    Sm=cos(2*pi*fm*t); %message signal
    Sn=cos(2*pi*fm/fn*n); %perfect sampled signal
    Su=cos(2*pi*fm/fu*n); %under sampled signal
    So=cos(2*pi*fm/fo*n); %over sampled signal
else
    %checks if the instruction is not followed and proceeds with below statements
    disp('Invalid Entry.')%conveys that the entry violates the given instruction and hence, is invalid
end %if ends here
%plotting 4 graphs as 2x2 matrix
subplot(2,2,1)%subplot 1
plot(t,Sm)% message signal
title('Message Signal')%title of subplot 1
xlabel('t (s)')%x axis variable & its unit
ylabel('Amplitude')%y axis variable
subplot(2,2,2)%subplot 2
stem(n,Sn)%perfect sampled signal
title('Perfect Sampled Signal')%title of subplot 2
xlabel('samples')%x axis variable
ylabel('Amplitude')%y axis variable
subplot(2,2,3)%subplot 3
stem(n,Su)%under sampled signal
title('Under sampled Signal')%title of subplot 3
xlabel('samples')%x axis variable
ylabel('Amplitude')%y axis variable
subplot(2,2,4)%subplot 4
stem(n,So)%over sampled signal
title('Over Sampled Signal')%title of subplot 4
xlabel('samples')%x axis variable
ylabel('Amplitude')%y axis variable
sgtitle('Sampling Theorem Verification')%general title for all subplots