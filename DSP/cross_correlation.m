%Computation of Cross-correlation using xcorr fuction & verifying its any three properties
clc;
clear all;
close all;
a=input('Enter a DT signal(please specify type of signal, if required. For e.g., sin(0:20), x(n): '); %to ask for the DT signal a
b=input('Enter a DT signal(please specify type of signal, if required. For e.g., cos(0:20), y(n): '); %to ask for the DT signal b
if length(a)<length(b)
   i=[a,zeros(1,length(b)-length(a))];
   j=b;
elseif length(b)<length(a)
   j=[b,zeros(1,length(a)-length(b))];
   i=a;
else
    i=a;
    j=b;
end
tt1=[0:length(a)-1];
tt2=[0:length(b)-1];
[cc,t]=xcorr(a,b); %computes cross-correlation of the signal a(n) with its time shifted version 
[cc1,t2]=xcorr(b,a);
subplot (2,1,1)
hold on %plotting input signals
stem(tt1,a,'-*','*');
stem(tt2,b);
title('Input Signals')
ylabel('amplitude');
xlabel('n as time samples');
legend('a(n)','b(n)')
subplot (2,1,2)
hold on %plotting cross-correlated signals
stem(t,cc,'-*','*');
stem(t2,cc1);
title('Cross-correlated Signal')
ylabel('amplitude');
xlabel('n as time samples');
legend('Rab','Rba')
sgtitle(' Cross-correlation')%general title for all subplots
%Verification of Cross-correlation properties
[aca,t1]=xcorr(a);
[acb,t2]=xcorr(b);
p=aca(t1==0).*acb(t2==0);
q=0.5.*(aca(t1==0)+acb(t2==0));
if max(abs(cc).^2)<=p %Property 1 verification
    disp('Property 1: |Rab(n)|²<=Raa(0).Rbb(0) is verified.')
end
if max(abs(cc))<=q %Property 2 verification
    disp('Property 2: |Rab(n)|<=0.5{Raa(0)+Rbb(0)} is verified.')
end
if round(flip(cc),1)==round(xcorr(b,a),1) %Pair-Symmetry Property verification
    disp('Pair-Symmetry Property: Rab(-n)=Rba(n) is verified.')
end
Ea=sqrt(sum(a.^2)+sum(b.^2));
if round(Ea,1)<=round(cc(t==0).^2,1) %Energy Property verification
    disp('Energy Property: Ea(n)<=Rab(0).Rba(0) i.e., Ea(n)<=|Rab(0)|² is verified.')
end
co=conv(flip(conj(i)),j); %computing a'(-n)*b(n)
if round(flip(cc),1)==round(co,1) %Convolution Property verification
    disp('Convolution Property: Rab(-n)=a~(-n)*b(n) is verified.')
end
