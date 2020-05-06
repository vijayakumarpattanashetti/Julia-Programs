clc;
clear all;
close all;
t=input ('Enter the length with step size between 0.0001 to 0.009 (for accurate plots).');%asks for the length entry strictly following the instruction
z=t(2)-t(1);%calculates the step size
if (z<0.01) && (z>0.00009)
    %checks if the instruction is followed and proceeds with below statements
    %plotting 3 graphs as a column/3x1 matrix
    subplot(3,1,1)%subplot 1
    u=t>=0;%unit step as a function of t
    plot(t,u)% t vs. u, unit step signal-subplot 1
    title('Unit-Step Signal')%title of subplot 1
    xlabel('t (s)')%x axis variable & its unit of subplot 1
    ylabel('Amplitude')%y axis variable of subplot 1
    subplot(3,1,2)%subplot 2
    r=t;%ramp as a function of t
    plot(t,r)%t vs. r, ramp signal-subplot 2
    title('Ramp Signal')%title of subplot 2
    xlabel('t (s)')%x axis variable & its unit of subplot 2
    ylabel('Amplitude')%y axis variable of subplot 2
    subplot(3,1,3)%subplot 3
    s=sin(t);%sine as a function of t
    plot(t,s)%t vs. r, ramp signal-subplot 3
    title('Sine Signal')%title of subplot 3
    xlabel('t (s)')%x axis variable & its unit of subplot 3
    ylabel('Amplitude')%y axis variable of subplot 3
else
    %checks if the instruction is not followed and proceeds with below statements
    disp('Invalid Entry.')%conveys that the entry violates the given instruction and hence, is invalid
end %if ends here