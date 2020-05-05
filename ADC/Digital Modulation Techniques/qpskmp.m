clc; close all; clear all;
dm=input('Enter digital message sequence: ');
%M=input('Enter modulation order: ');
m=[];
for i=1:1:length(dm) 
    if dm(i)==1;
       apd=ones(1,100);
    else dm(i)==0;
        apd=zeros(1,100);
    end
     m=[m apd];
end
m=m';
t=[0.01:0.01:length(dm)];
H1=comm.QPSKModulator;
qpskm=step(H1,m);
H2=comm.QPSKDemodulator;
qpskdm=step(H2,qpskm);
subplot(3,2,1)
plot(t,m)
axis([0 length(dm)+1 -.5 1.5])
subplot(3,2,2)
plot(t,qpskm)
subplot(3,2,3)
plot(t,qpskdm)
axis([0 length(dm)+1 -.5 1.5])
conste=awgn(qpskm,20);
scatterplot(conste)