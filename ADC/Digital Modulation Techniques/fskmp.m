clc; close all; clear all;
dm=input('Enter digital message sequence: ');
fc=input('Enter carrier frequency: ');
fH=input('Enter higher frequency: ');
fL=input('Enter lower frequency: ');
u=abs(fH-fc);
v=abs(fc-fL);
n=length(dm);
m=[];
if fH<fL || fH==fL
    return;
end
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
for j=0.01*100:0.01*100:length(m)
    if m(j)==1;
       fskm(j)=sin(0.02*pi*fH*j);
    else m(j)==0;
       fskm(j)=sin(0.02*pi*fL*j);
    end
end
for k=0.01*100:0.01*100:length(m)
    if fskm(k)==sin(0.02*pi*fH*k);
       fskdm(k)=1;
    else fskm(k)==sin(0.02*pi*fL*k);
       fskdm(k)=0;
    end
end
subplot(3,2,1)
plot(t,m)
axis([0 length(dm)+1 -.5 1.5])
subplot(3,2,2)
plot(t,c)
subplot(3,2,3)
plot(t,fskm)
subplot(3,2,4)
plot(t,fskdm)
axis([0 length(dm)+1 -.5 1.5])
conste=awgn(fskm,20);
scatterplot(conste)