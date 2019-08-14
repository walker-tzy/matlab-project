%��ҵ7
%����fft���м��˲�
clear
clc
close all
%%����ʱ��������ɢ�ź�
N=512;
dt=0.001;
df =1/N/dt;
freq =(0:N-1)*df;
f1=20;
f2=80;
t=(0:N-1)*dt;
y1=sin(2*pi*f1*t);
y2=sin(2*pi*f1*t)+ sin(2*pi*f2*t);
figure(1);
subplot(2,1,1)
plot(t,y1);
xlabel('time (s)');
ylabel('amp(t)');
title( 'ԭ�ź�');
axis([0 max(t) -3 3]);

subplot(2,1,2)
plot(t,y2);
xlabel('time (s)');
ylabel('amp(t)');
title( '��80Hz�������ź�');
axis([0 max(t) -3 3]);
%Ƶ�����˲�
%Ƶ�׷���
Yw=fft(y2);
Y=abs(Yw);
Yh=Yw(1:N/2);

%Ƶ���˲�����
f1=0;
f2=50;
f3=80;
f4=150;
type=[1,1,0,0];

filter = zeros (1, length(Yh));
filter (floor(f1/df)+1:floor(f2/df+1))=1;
for i =1:10
filter = smooth(filter,5);
end
filter = filter';
figure('color' ,'w');
plot (freq(1:N/2), abs(Yw(1:N/2))/max(abs(Yw(1:N/2))),'r');
hold on;
plot (freq(1:N/2), filter);
axis([0 300 -0.2 1.2]);
xlabel(' Freq (Hz)' );
ylabel(' Normalized amp' );
legend(' normalized amp' ,' filter' )
%�˲�
Xw=Yh.*filter;
%�任��ʱ���ź�
MinFPoint=max(2,ceil(min(freq)/df));
MaxFPoint=min(N/2,floor(max(freq)/df));
Xw( 1:MinFPoint ) = 0.0;
Xw( MaxFPoint:(N/2+1)) = 0.0;
Xw((N/2+2):N) = conj(Xw((N/2):-1:2));
xt=real(ifft(Xw));
%�����ʾ
figure('color','w')
subplot(2,1,1)
plot(t,y2);
xlabel('time (s)');
ylabel('amp(t)');
title( 'Before');
axis([0 max(t) -3 3]);

% figure( color' ,'w ):
subplot(2,1,2)
plot (t,xt,'r');
xlabel(' time (s)');
ylabel( 'amp(t)' );
title(' After ');
axis([0 max(t) -3 3]);

figure( 'color' ,'w');
subplot(2,1,1)
plot(freq(1:N/2),Y(1:N/2));
xlabel( 'Frequency (Hz)');
ylabel( 'amp(f)' );
title( 'Before' );
% set (gca,'xlim',[O,200]);

subplot(2,1,2)
X=abs(fft(xt));
plot (freq(1:N/2),X(1:N/2),'r-');
xlabel(' Frequency (Hz)');
ylabel( 'amp(f)' );
title('After');
set(gca,'xlim',[0,200]);





