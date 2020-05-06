%Computation of Circular Convolution using DFT & IDFT
clc;
clear all;
close all;
a=input('Enter a DT signal(please specify type of signal, if required. For e.g., sin(0:20), x(n): '); %to ask for the DT signal a
o=a;
b=input('Enter another DT signal(please specify type of signal, if required. For e.g., cos(0:20), y(n): '); %to ask for the DT signal b
p=b;
l=length(a);%computes length of input signal a
m=length(b);%computes length of input signal b
l1=l;
m1=m;
if l<m %if length of a is less than that of b
    a=[a,zeros(1,m-l)]; %appends input signal with leading zeros
    l=length(a);%computes length of updated input signal a
elseif l>m %if length of b is less than that of a
    b=[b,zeros(1,l-m)]; %appends input signal with leading zeros
    m=length(b);%computes length of updated input signal b
end
n=input('Enter modulo value i.e., output length required: '); %asking for modulo value i.e., output length required
if l<n %if length of a is less than n
    a=[a,zeros(1,n-l)]; %appends input signal with leading zeros
    l=length(a);%computes length of updated input signal a
end
if n>m %if length of b is less than n
    b=[b,zeros(1,n-m)]; %appends input signal with leading zeros
    m=length(b);%computes length of updated input signal b
end
for q=1:n
    z(q)=0;
    for i=1:n
        j=q-i+1;
        if(j<=0)
            j=n+j;
        end
        z(q)=[z(q)+a(i)*b(j)];
    end
end
%z=cconv(a,b,n);%computes convolution using built-in cconv function; cconv function was not available for mobile version
%computation of convolution using DFT & IDFT
s=fft(a,n);%computes DFT of the signal a
t=fft(b,n);%computes DFT of the signal b 
v=ifft(s.*t);%computes IDFT of the signal A(w) x B(w)
%for modulo(length(a)+length(b)-1), circular convolution of a(n) and b(n) is equal to linear convolution of a(n) and b(n)
lico=conv(o,p);
%setting base lengths
E=[0:1:n-1];
subplot(3,1,1)
stem(E,z)
title('Using cconv definition');
ylabel('a(n)⊗b(n)');
xlabel('n as time samples');
subplot(3,1,2)
stem(E,v,'-.','*')
title('Using DFT & IDFT');
ylabel('a(n)⊗b(n)');
xlabel('n as time samples');
subplot(3,1,3)
stem(E,lico,'-.','^')
title('Linear Convolution');
ylabel('a(n)*b(n)');
xlabel('n as time samples');
sgtitle('   Circular Convolution')%general title for all subplots
