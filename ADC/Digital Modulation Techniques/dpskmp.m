clc; close all; clear all;
dm=input('Enter digital message sequence: ');
M=input('Enter modulation order: ');
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
dpskm=dpskmod(m,M,pi/8);
dpskdm=dpskdemod(dpskm,M,pi/8);
subplot(3,2,1)
plot(t,m)
axis([0 length(dm)+1 -.5 1.5])
subplot(3,2,2)
plot(t,dpskm)
subplot(3,2,3)
plot(t,dpskdm)
axis([0 length(dm)+1 -.5 1.5])
conste=awgn(dpskm,20);
scatterplot(conste)
%alterantively using communications toolbox:
%comm.DPSKModulator, comm.DPSKDemodulator
%cd=comm.ConstellationDiagram('ShowTrajectory',true,'ShowReferenceConstellation',True);
%cd(y)