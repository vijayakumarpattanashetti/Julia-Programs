clc; close all; clear all;
x=0:.5:8*pi;                            
sig1=4*sin(x);                          
l=length(sig1);
sig2=4*triang(l);                    
subplot(2,2,1);                          
plot(sig1);
title('Sinusoidal Signal');
ylabel('Amplitude');
xlabel('Time');
subplot(2,2,2);
plot(sig2);
title('Triangular Signal');
ylabel('Amplitude');
xlabel('Time');
subplot(2,2,3);
stem(sig1);
title('Sampled Sinusoidal Signal');
ylabel('Amplitude');
xlabel('Time');
subplot(2,2,4);
stem(sig2);
title('Sampled Triangular Signal');
ylabel('Amplitude');
xlabel('Time');
l1=length(sig1);
l2=length(sig2);
 for i=1:l1
  sig(1,i)=sig1(i);     
  sig(2,i)=sig2(i);
 end  
% TDM
tdmsig=reshape(sig,1,2*l1);               
figure
stem(tdmsig);
title('TDM Signal');
ylabel('Amplitude');
xlabel('Time');
% Demultiplexing of TDM Signal
 demux=reshape(tdmsig,2,l1);
 for i=1:l1
  sig3(i)=demux(1,i);           
  sig4(i)=demux(2,i);
 end  
 figure
 subplot(2,1,1)
 plot(sig3);
 title('Recovered Sinusoidal Signal');
 ylabel('Amplitude');
 xlabel('Time');
 subplot(2,1,2)
 plot(sig4);
 title('Recovered Triangular Signal');
 ylabel('Amplitude');
 xlabel('Time');
