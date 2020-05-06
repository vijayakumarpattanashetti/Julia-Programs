x=[-4:1:11];
y=[-2:1:7];
a=sin(x);
b=y;
subplot(2,2,1)
stem(x,a,'diamond')
title('DT Signal a')
ylabel('a=sin(x)')
xlabel('x as time samples')
subplot(2,2,2)
stem(y,b,'o')
title('DT Signal b')
ylabel('b=y')
xlabel('y as time samples')
%'o','filled',':'