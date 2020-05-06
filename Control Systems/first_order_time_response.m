clc; clear all; close all;
x=input('Enter output, for 1x enter, [1 0], i:');
y=input('Enter input, for 2x+5 enter, [2 5], j:');
G=tf(i,j);
subplot(2,1,1)
pzmap(G) %pole-zero plot
subplot(2,1,2)
%time response
step(G) %linearSystemAnalyzer('step',G)
stepinfo(G)
