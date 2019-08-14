%作业5

%希尔伯特变换
clear
clc
close all
figure(1);
N=512;
dt=0.002;
n=0:N-1;
t=(0:N-1)*dt;%fs=1/dt 采样率是dt倒数
f1=15;
f2=20;
f=(n/dt)/N ; %f=n*fs/N
y=cos(2*pi*f1*t)+0.5*cos(2*pi*f2*t+pi/4);
Yht=hilbert(y);
subplot(2,1,1);
plot(t,y,'k');
xlabel('time');
ylabel('y');
title('原信号（时域）');
subplot(2,1,2);
plot(t,real(Yht),'b');
hold on 
plot(t,imag(Yht),'r');
xlabel('time(s)');
ylabel('amp(t)');
title('Hilbert变换');
legend('real' ,'imag');

figure(2);
subplot(2,1,1);
plot(t,angle(Yht),'b');
xlabel('time(s)');
ylabel('phase(rad)');
title('相位');

subplot(2,1,2);
plot(t,abs(Yht),'b');
xlabel('time(s)');
ylabel('abs');
title('瞬时振幅');

figure(3);
subplot(2,1,1);
plot(t,unwrap(angle(Yht)),'b');
xlabel('time(s)');
ylabel('unwrapped phase(rad)');
title('');

