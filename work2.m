%��ҵ2
%fft��Ƶ�ʷֱ���
clear
clc
figure(2);
fs=20;  %����Ƶ��
Ts=1/fs;
Ndata=128; %���ݳ���
Nfft=256;
n=0:Ndata-1;
t=n*Ts; %��Ŷ�Ӧ��ʱ������
f=n*fs/Ndata;
xt=sin(3*2*pi*t)+cos(3.1*pi*2*t);
Xf=fft(xt,Nfft);
subplot(2,1,1);
plot(t,xt);
xlabel('time/s');
ylabel('�ź�ֵ');
title('figure 4 : Ndata=128');
subplot(2,1,2);
plot(f(1:Ndata/2),abs(Xf(1:Ndata/2)));
xlabel('Frequency/Hz');
ylabel('Amplitude');
title('figure 5 : Nfft=256');

