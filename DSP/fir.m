%FIR Filter design using window functions viz., rectangular and Hamming
clc; clear all; close all;
rp=input('Enter passband ripple value: ');
rs=input('Enter stopband ripple value: ');
wp=input('Enter passband frequency: ');
ws=input('Enter stopband frequency: ');
fs=input('Enter sampling frequency: ');
w1=2*wp/fs;w2=2*ws/fs;
num=-20*log10(sqrt(rp*rs))-13;
den=14.6*(ws-wp)/fs;
n=ceil(num/den);
n1=n+1;
if(rem(n,2)~=0)
    n1=n; n=n-1;
end
c=input('Enter 1 for rectangular, or 2 for hamming: ');
if c==1
    y=rectwin(n1);
end
if c==2
    y=hamming(n1);
end
t=input('Enter 1 for LPF, or 2 for HPF: ');
switch t
    case 1
        b=fir1(n,w1,y);
        [h,o]=freqz(b,1,256);
        m=20*log10(abs(h));
        plot(o,m)
        if c==1
            title('FIR LPF using Rectangular Window');
        end
        if c==2
            title('FIR LPF using Hamming Window');
        end
        ylabel('gain (db)');
        xlabel('frequency (Hz)');
    case 2
        b=fir1(n,w1,'high',y);
        [h,o]=freqz(b,1,256);
        m=20*log10(abs(h));
        plot(o,m)
        if c==1
            title('FIR HPF using Rectangular Window');
        end
        if c==2
            title('FIR HPF using Hamming Window');
        end
        ylabel('gain (db)');
        xlabel('frequency (Hz)');
end