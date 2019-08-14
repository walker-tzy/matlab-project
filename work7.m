%作业7
%利用fft进行简单滤波
clear
clc
close all
%%构建时间区域离散信号
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
title( '原信号');
axis([0 max(t) -3 3]);

subplot(2,1,2)
plot(t,y2);
xlabel('time (s)');
ylabel('amp(t)');
title( '加80Hz噪声后信号');
axis([0 max(t) -3 3]);
%频率域滤波
%频谱分析
Yw=fft(y2);
Y=abs(Yw);
Yh=Yw(1:N/2);

%频域滤波函数
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
%滤波
Xw=Yh.*filter;
%变换回时域信号
MinFPoint=max(2,ceil(min(freq)/df));
MaxFPoint=min(N/2,floor(max(freq)/df));
Xw( 1:MinFPoint ) = 0.0;
Xw( MaxFPoint:(N/2+1)) = 0.0;
Xw((N/2+2):N) = conj(Xw((N/2):-1:2));
xt=real(ifft(Xw));
%结果显示
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





