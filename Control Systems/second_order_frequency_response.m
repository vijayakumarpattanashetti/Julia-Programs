clc; clear all; close all;
u=1;
wn=input('Enter natural frequency, wn: ');
zeta=input('Enter damping ratio, zeta: ');
s=tf('s');
G=wn^2/(s^2+2*zeta*wn*s+wn^2);
subplot(2,1,1)
%frequency response
bode(G) %linearSystemAnalyzer('bode',G)
subplot(2,1,2)
nyquist(G) %linearSystemAnalyzer('nyquist',G)