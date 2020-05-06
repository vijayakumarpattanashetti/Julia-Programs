clc; clear all; close all;
n=input('Enter output, for 1x enter, [1 0], i:');
d=input('Enter input, for 2x+5 enter, [2 5], j:');
sys=tf(n,d);
h=bodeplot(sys);
p=getoptions(h);
p.Title.String='Root Locus Plot';
setoptions(h,p);
%[r,k]=rlocus(sys)
%r=rlocus(sys,k)
