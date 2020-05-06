clc;
clear all;
close all;
a=input('Choose DT signal type : sine,unit step,ramp,exponential or random.','s');%asking for the type of DT signal a
u='Enter a DT signal length or values.';%to ask for the values of DT signal a
%checking for the type of DT signal a
if strcmp('sine',a)
    %if found sine
    x=input(u);
    a=sin(x);%converts to sine signal
    q='sin(x)*';
elseif strcmp('unit step',a)
    %if found unit step
    x=input(u);
    a = x>=0;%converts to unit step signal
    q='u(x)*';
elseif strcmp('ramp',a)
    %if found ramp
    x=input(u);
    a=x;%converts to ramp signal
    q='r(x)*';
elseif strcmp('exponential',a)
    %if found exponential
    x=input(u);
    a=exp(x);%converts to exponential signal
    q='exp(x)*';
elseif strcmp('random',a)
    %if found random
    x=input(u);
    a=x;%converts to random signal
    q='x(n)*';
else
    %if found none, displays
    disp('Invalid choice.')
    return%terminates the code
end
b=input('Choose DT signal type : sine,unit step,ramp,exponential or random.','s');%asking for the type of DT signal b 
v='Enter another DT signal length or values.';%to ask for the values of DT signal b
%checking for the type of DT signal b
if strcmp('sine',b)
    %if found sine
    y=input(v);
    b=sin(y);%converts to sine signal
    w='sin(y)';
elseif strcmp('unit step',b)
    %if found unit step
    y=input(v);
    b = y>=0;%converts to unit step signal
    w='u(y)';
elseif strcmp('ramp',b)
    %if found ramp
    y=input(v);
    b=y;%converts to ramp signal
    w='r(y)';
elseif strcmp('exponential',a)
    %if found exponential
    y=input(v);
    b=exp(y);%converts to exponential signal
    q='exp(x)';
elseif strcmp('random',b)
    %if found random
    y=input(v);
    b=y;%converts to random signal
    w='y(n)';
else
    %if found none, displays
    disp('Invalid choice.')
    return%terminates the code
end
z=conv(a,b);%computes convolution using built-in "conv" function
i=size(a,2);%determines column-size of matrix a 
j=size(b,2);%determines column-size of matrix b 
o=i+j-1;
%computation of convolution using DTFT's convolution property
l=fft(a,o);%computes discrete time fourier transform of the signal a
m=fft(b,o);%computes discrete time fourier transform of the signal b 
v=ifft(l.*m);%computes inverse discrete time fourier transform of the signal A(s) x B(s)
%computation of convolution using mathematical definition of convolution
%equalising matrices w.r.t. size to suit matrix operations on them
e=[a,zeros(1,j)];
f=[b,zeros(1,i)];
%dual-for loop
%a(n)*b(n)=ₖΣ(-∞→∞)[a(k).b(n-k)]
for n=1:o %possible n values
    c(n)=0;%initially begins with '0'
    for k=1:i %possible cases of k
        if(n-k+1>0) %for all values +ve indices beginning with 1
            c(n)=c(n)+e(k)*f(n-k+1);%computes summation for each case of k
        else
        end
    end
end
c;%result
%computation of convolution using matrix method 1
%builds matrix using operated elements of matrices a & b
for M=[1:j]%elements of matrix a along columns
    for N=[1:i]%elements of matrix b along rows
        C(M,N)=a(N).*b(M);%multiplies 'i'th element of "b" with 'j'th element of "a" to compute 'i,j'th element of resultant matrix
    end
end
C=flip(C,2);%rotates matrix around columns
%calculates the sum of all the elements in each of its diagonal
for t=[1:o]
    d(t)=sum(diag(C,t-j));
end
d=flip(d);%rotates matrix around columns to get back corresponding to the initial one
%calculating lengths of convolution results computed using-
K=length(z)-1;%conv function
Q=length(v)-1;%DTFT's convolution property
R=length(c)-1;%mathematical definition of convolution
I=length(d)-1;%Matrix method 1
%setting base lengths
G=[0:1:K];
E=[0:1:Q];
T=[0:1:R];
J=[0:1:I];
%setting label for y-axis
W=strcat(q,w);
%plotting graphs with suitable title and axes' labels
subplot(2,2,1)
stem(G,z,'-.','*')
title({'Convolution of two DT Signals','using conv function'});
ylabel(W);
xlabel('n as time samples');
subplot(2,2,2)
stem(E,v,'-.','*')
title({'Convolution of two DT Signals','using DT Fourier & Inverse Fourier transforms'});
ylabel(W);
xlabel('n as time samples');
subplot(2,2,3)
stem(T,c,'-.','*')
title({'Convolution of two DT Signals','using DT Convolution definition'});
ylabel(W);
xlabel('n as time samples');
subplot(2,2,4)
stem(J,d,'-.','*')
title({'Convolution of two DT Signals','using matrix method 1'});
ylabel(W);
xlabel('n as time samples');