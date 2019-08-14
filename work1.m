%作业1
%fftshift函数
clc
figure(1);
fs=100;N=256;
n=0:N-1;
t=n/fs;
x=0.5*sin(2*pi*15*t)+2*sin(2*pi*40*t);
y1=fft(x,N); %信号进行快速傅里叶变换
y2=fftshift(y1);
mag1=abs(y1);
mag2=abs(y2);
f1=n*fs/N;
f2=n*fs/N-fs/2;
subplot(3,1,1);
plot(f1,mag1,'r');  %绘制振幅图像
xlabel('频率 Hz');
ylabel('振幅');
title('figure 1 : usual FFT','color','r');
grid on;
subplot(3,1,2);
plot(f2,mag1,'b');
xlabel('频率 Hz');
ylabel('振幅');
title('figure 2 : FFT without fftshift','color','b');
grid on;
subplot(3,1,3);
plot(f2,mag2,'k');
xlabel('频率 Hz');
ylabel('振幅');
title('figure 3 : FFT after fftshift','color','k');
grid on;

