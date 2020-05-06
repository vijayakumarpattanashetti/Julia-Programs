%IIR Low pass Butterworth Filter design
clc; clear a1l; close all;
rp=input ('Enter passband ripple value: ');
rs=input ('Enter stopband ripple value: ');
wp=input ('Enter passband frequency: ');
ws=input ('Enter stopband frequency: ');
fs=input ('Enter Sampling frequency: ');
wl=2*wp/fs;
w2=2*ws/fs;
[n,wn]=buttord(w1,w2,rp,rs);
[b,a]=butter(n, wn);
w=[0:0.1:pi];
[h,m]=freqz (b,a,w);
mag=20*log10(abs (h));
ang=angle(h);
subplot (2,1,1)
plot (3*m, mag)
title('Magnitude Plot')
ylabel('gain magnitude (db)');
xlabel('frequency (kHz)');
subplot(2,1,2)
plot(3*m, ang)
title('Phase Plot');
ylabel('angle (rad)');
xlabel ('frequency (kHz)');