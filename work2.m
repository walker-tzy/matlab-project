%作业2
%fft的频率分辨率
clear
clc
figure(2);
fs=20;  %采样频率
Ts=1/fs;
Ndata=128; %数据长度
Nfft=256;
n=0:Ndata-1;
t=n*Ts; %序号对应的时间序列
f=n*fs/Ndata;
xt=sin(3*2*pi*t)+cos(3.1*pi*2*t);
Xf=fft(xt,Nfft);
subplot(2,1,1);
plot(t,xt);
xlabel('time/s');
ylabel('信号值');
title('figure 4 : Ndata=128');
subplot(2,1,2);
plot(f(1:Ndata/2),abs(Xf(1:Ndata/2)));
xlabel('Frequency/Hz');
ylabel('Amplitude');
title('figure 5 : Nfft=256');

