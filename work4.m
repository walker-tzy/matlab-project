%��ҵ4

%����FFT������ɢ���е����Ծ����ѭ�����
clc;
clear;
n=[1,2,0,1];
m=[2,2,1,1];
N=length(n)+length(m)-1;
N1=fft(n,N);
M1=fft(m,N);
Y1=N1.*M1;
y1=ifft(Y1,N);
subplot(2,1,1);
x=0:N-1;
stem(x,y1);
title('����fft���������Ծ��')
xlabel('x');ylabel('y1');
 %��L=8ʱ���ѭ�����
 L=8;
N2=fft(n,L); M2=fft(m,L);
Y2=N2.*M2;
y2=ifft(Y2,L); 
subplot(2,1,2);
n=0:length(y2)-1;
stem(n,y2);
title('��L=8ʱ���ѭ�����');
xlabel('n');ylabel('y2');

