clc; clear all; close all;
n=input('Enter coefficients of numerator polynomial of open loop transfer function: ');
d=input('Enter coefficients of denominator polynomial of open loop transfer function: ');
sys=tf(n,d);
h=bodeplot(sys);
p=getoptions(h);
p.Title.String='Root Locus Plot';
setoptions(h,p);
%[r,k]=rlocus(sys)
%r=rlocus(sys,k)