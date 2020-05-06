%Computation of Linear Convolution using DFT & IDFT
clc;
clear all;
close all;
a=input('Enter a DT signal (please input type of signal, if required. For e.g., sin(0:20), x(n): '); %to ask for the DT signal a
b=input('Enter another DT signal (please input type of signal, if required. For e.g., cos(0:20), y(n): '); %to ask for the DT signal b
z=conv(a,b);%computes convolution using built-in conv function
i=size(a,2);%determines column-size of matrix a 
j=size(b,2);%determines column-size of matrix b 
o=i+j-1;
%computation of convolution using DFT & IDFT
l=fft(a,o);%computes DFT of the signal a
m=fft(b,o);%computes DFT of the signal b 
v=ifft(l.*m);%computes IDFT of the signal A(w) x B(w)
%setting base lengths
G=[0:1:length(z)-1];
E=[0:1:length(v)-1];
subplot(2,1,1)
stem(G,z,'-')
title({'Using conv function'});
ylabel('a(n)*b(n)');
xlabel('n as time samples');
subplot(2,1,2)
stem(E,v,'-.','*')
title({'Using DFT & IDFT'});
ylabel('a(n)*b(n)');
xlabel('n as time samples');
sgtitle(' Linear Convolution')%general title for all subplots