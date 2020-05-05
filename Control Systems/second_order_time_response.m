clc; clear all; close all;
wn=input('Enter natural frequency, wn: ');
zeta=input('Enter damping ratio, zeta: ');
s=tf('s');
G=wn^2/(s^2+2*zeta*wn*s+wn^2);
subplot(2,1,1)
pzmap(G)
subplot(2,1,2)
%time response
step(G) %linearSystemAnalyzer('step',G)
stepinfo(G)