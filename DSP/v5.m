clc;
clear all;
close all;
a=input('Choose DT signal type : sine,unit step,ramp,exponential or random.','s');%asking for the type of DT signal 
if strcmp('sine',a)
    %checks if the entry is for sine signal, then proceeds with below statements
    n=input('Enter the length.');%asking for the values of DT signal
    m=input('Enter a value for time shift.');%asking for the value of time shift for the DT signal
    %to plot both curves in single column
    subplot(2,1,1)%subplot 1
    y=sin(n);%y as a sine function of n
    stem(n,y)%n vs. y, subplot 1
    subplot (2,1,2)%subplot 2
    n=n+m;%shifting samples along x axis
    stem(n,y)%shifted n vs. y, subplot 2
elseif strcmp('unit step',a)
    %checks if the entry is for unit step signal, then proceeds with below statements
    n=input('Enter the length.');%asking for the values of DT signal
    m=input('Enter a value for time shift.');%asking for the value of time shift for the DT signal
    %to plot both curves in single column
    subplot(2,1,1)%subplot 1
    y=n>=0;%y as a unit step function of n
    stem(n,y,'filled','diamond')%n vs. y, subplot 1
    subplot (2,1,2)%subplot 2
    n=n+m;%shifting samples along x axis
    stem(n,y,'filled','diamond')%shifted n vs. y, subplot 2
elseif strcmp('ramp',a)
    %checks if the entry is for ramp signals, then proceeds with below statements
    n=input('Enter the length.');%asking for the values of DT signal
    m=input('Enter a value for time shift.');%asking for the value of time shift for the DT signal
    %to plot both curves in single column
    subplot(2,1,1)%subplot 1
    y=n;%y as a ramp function of n
    stem(n,y,'filled','square')%n vs. y, subplot 1
    subplot (2,1,2)%subplot 2
    n=n+m;%shifting samples along x axis
    stem(n,y,'filled','square')%shifted n vs. y, subplot 2
elseif strcmp('exponential',a)
    %checks if the entry is for exponential signals, then proceeds with below statements
    n=input('Enter the length.');%asking for the values of DT signal
    m=input('Enter a value for time shift.');%asking for the value of time shift for the DT signal
    %to plot both curves in single column
    subplot(2,1,1)%subplot 1
    y=exp(n);%y as a exponential function of n
    stem(n,y,'filled')%n vs. y, subplot 1
    subplot (2,1,2)%subplot 2
    n=n+m;%shifting samples along x axis
    stem(n,y,'filled')%shifted n vs. y, subplot 2
elseif strcmp('random',a)
    %checks if the entry is for random signals, then proceeds with below statements
    n=input('Enter the values.');%asking for the values of DT signal
    k=input('Enter the base length.');%asking for the indices of DT signal values
    p=length(n);%asking indexing
    q=length(k);%getting column size of base length
    if p==q %checking for equal number of values and indices
        m=input('Enter a value for time shift.');%asking for the value of time shift for the DT signal
    %to plot both curves in single column
        subplot(2,1,1)%subplot 1
        y=n;%y as a random function of n
        stem(k,y,'filled','square')%n vs. y, subplot 1
        subplot (2,1,2)%subplot 2
        k=k+m;%shifting samples along x axis
        stem(k,y,'filled','square')%shifted n vs. y, subplot 2
    else
        disp('Non-matching length.')
    end
else
    %if the entry does not match any of the above, then executes the below statements
    disp('Invalid choice.')
end
b=' Signal';
c='shifted-';
subplot(2,1,1)%subplot 1
title (strcat(a,b))%title for the subplot 1
xlabel('n (as time samples)')%x axis variable name for subplot 1
ylabel('Amplitude')%y axis variable name for subplot 1
subplot(2,1,2)%subplot 2
title (strcat(c,a,b))%title for the subplot 2
xlabel('n (as time samples)')%x axis variable name for subplot 2
ylabel('Amplitude')%y axis variable name for subplot 2