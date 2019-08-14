%作业6
%编写希尔伯特变换
clear
clc
close all
figure(1);
N=512;
dt=0.001;
n=0:N-1;
t=(0:N-1)*dt;%fs=1/dt 采样率是dt倒数
f1=15;
f2=20;
f=(n/dt)/N ; %f=n*fs/N

%希尔伯特变换程序实现

x1=cos(2*pi*f1*t)+0.5*cos(2*pi*f2*t+pi/4);
%x=cos(2*pi*15*t);
x2=1/pi*t;
Y1=fft(x1);


Y2=-i*sign(x1); %i/pi*t傅里叶变换后的关系式，-j*sign(f)
YH=Y2.*Y1;
Yht=hilbert(x);

fH=ifft(YH);
figure(1);
plot(t,real(fH),'r');
hold on;
plot(t,x,'b');
axis([0 max(t) -2 2]);
xlabel('time(s)');
ylabel('amp(t)');
legend('imag' ,'real');
title('FFT设计Hilbert变换');

figure(2);
plot(t,imag(Yht),'r');
axis([0 max(t) -2 2]);
xlabel('time(s)');
ylabel('amp(t)');
hold on;
plot(t,real(Yht),'b');
legend('imag' ,'real');
title('matlab内置Hilbert变换');