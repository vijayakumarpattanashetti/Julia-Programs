clc; clear all; close all;
%data generation
m=51;
f=@(x)15*x+5;
x=linspace(0,1,m);
y=f(x)+normrnd(0,0.4,size(x));
plot(x,y,'o')
%linear regression
w1=rand(1); w0=rand(1);
alp=1.5;
J(1)=0.5/m*sum((y-w1*x-w0).^2);
err=1; iter=1;
while(err>1.e-5)
    yh=w1*x + w0;
    DJ0=(yh-y); dw0=-alp*sum(DJ0)/m;
    DJ1=(yh-y).*x; dw1=-alp*sum(DJ1)/m;
    w0=w0+dw0;
    w1=w1+dw1;
    iter=iter+1;
    J(iter)=0.5/m*sum((y-w1*x-w0).^2);
    err=abs(J(iter)-J(iter-1)); %norm([dw0,dw1])
    subplot(2,1,1)
    plot(x,y,'o',x,yh,'r')
    xlabel('x');
    ylabel('y');
    legend({'Data','Linear Fit'},'Location','NorthWest')
    subplot(2,1,2)
    xlabel('iterations');
    ylabel('J');
    plot([1:iter],J([1:iter]),'-o')
end