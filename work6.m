%��ҵ6
%��дϣ�����ر任
clear
clc
close all
figure(1);
N=512;
dt=0.001;
n=0:N-1;
t=(0:N-1)*dt;%fs=1/dt ��������dt����
f1=15;
f2=20;
f=(n/dt)/N ; %f=n*fs/N

%ϣ�����ر任����ʵ��

x1=cos(2*pi*f1*t)+0.5*cos(2*pi*f2*t+pi/4);
%x=cos(2*pi*15*t);
x2=1/pi*t;
Y1=fft(x1);


Y2=-i*sign(x1); %i/pi*t����Ҷ�任��Ĺ�ϵʽ��-j*sign(f)
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
title('FFT���Hilbert�任');

figure(2);
plot(t,imag(Yht),'r');
axis([0 max(t) -2 2]);
xlabel('time(s)');
ylabel('amp(t)');
hold on;
plot(t,real(Yht),'b');
legend('imag' ,'real');
title('matlab����Hilbert�任');