clc; clear all; close all;
i=imread('pout.tif');
e=histeq(i);
subplot(2,2,1)
imshow(i)
title('Normal Image')
subplot(2,2,2)
imshow(e)
title('Contrast improved Image')
subplot(2,2,3)
imhist(i)
title('Histogram of Normal Image')
subplot(2,2,4)
imhist(e)
title('Histogram of contrast improved Image')
