clc; close all; clear all;
dm=input('Enter digital message sequence: ');
fc=input('Enter carrier frequency: ');
n=length(dm);
m=[];
for i=1:1:length(dm) 
    if dm(i)==1;
       apd=ones(1,100);
    else dm(i)==0;
        apd=zeros(1,100);
    end
     m=[m apd];
end
t=[0.01:0.01:length(dm)];
c=sin(2*pi*fc*t);
askm=m.*c;
askdm=askm./c;
subplot(3,3,1)
plot(t,m)
axis([0 length(dm)+1 -.5 1.5])
subplot(3,3,2)
plot(t,c)
subplot(3,3,3)
plot(t,askm)
subplot(3,3,4)
plot(t,askdm)
axis([0 length(dm)+1 -.5 1.5])
conste=awgn(askm,20);
scatterplot(conste)