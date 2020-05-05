clc; clear all; close all;
i=input('Enter first order system, for eg. [1 0], i:');
j=input('Enter first order system, for eg. [2 5], j:');
G=tf(i,j);
subplot(2,1,1)
%frequency response
bode(G) %linearSystemAnalyzer('bode',G)
subplot(2,1,2)
nyquist(G) %linearSystemAnalyzer('nyquist',G)