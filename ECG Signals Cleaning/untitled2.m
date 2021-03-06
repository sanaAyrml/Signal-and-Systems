%preProcess
%1
S = load('/Users/sana/Desktop/Signal_Project_96101284/Data.mat');
data = S.data.signal;
t = 0:1:length(data)-1;
figure(1)
subplot (2,1,1),plot(t,data),title ('ECG Signal'),grid on 
subplot (2,1,2),plot(t(1:500),data(1:500)), title ('A period of ECG Signal'),grid on
%2
Fs = 500;
data1 = data;
NFFT = length(data1);
y = fft(data1,NFFT);
Y = fftshift(y);
F = ((0:1/NFFT:1-1/NFFT)*Fs).';
magnitudeY = abs(Y);   
phaseY = unwrap(angle(Y)); 
figure(2)
subplot (2,1,1),plot(F,magnitudeY),title ('Magnitude of FFT of ECG Signal'), grid on 
subplot (2,1,2),plot(F,phaseY),title ('Phase of FFT of ECG Signal'), grid on 
%3
figure(3)
Fs = 500; 
N = 100; 
Fc = 0.5;
hp = fdesign. highpass ('N,Fc', N, Fc, Fs); 
hpf = butter(hp);
data1n=data1./ max(data1);
data2=filter (hpf, data1n);
subplot (2,1,1), plot(data1n), title ('Normalized ECG Signal'), grid on
subplot (2,1,2), plot(data2), title ('ECG Signal with removed Motion Artifacts'), grid on
%4
figure(4)
Fs = 500; 
data2n=data2./ max(data2);
Fnotch = 60; 
BW = 120; 
Apass = 1; 
[b, a] = iirnotch (Fnotch/ (Fs/2), BW/ (Fs/2), Apass); 
notch = dfilt.df2 (b, a);
data3=filter (notch, data2n);
subplot (2, 1, 1), plot(data2n), title ('Normalized ECG Signal with removed Motion Artifacts'), grid on
subplot (2, 1, 2), plot (data3), title ('ECG Signal with removed Motion Artifacts and line noise Removed'), grid on
%5
figure(5)
Fs = 500; 
N = 100; 
Fc = 100; 
lp = fdesign.lowpass ('N,Fc', N, Fc, Fs); 
lpf = butter(lp);
data3n=data3./ max(data3);
data4=filter (lpf, data3n);
subplot (2,1,1), plot(data3n), title ('Normalized ECG Signal with removed Motion Artifacts and line noise Removed'), grid on
subplot (2,1,2), plot(data4), title ('ECG Signal with removed Motion Artifacts and line noise Removed and reduced SNR'), grid on
%Process
%1
%490
%2
corr = xcorr(data4,4169);
tx = 0:1:length(corr)-1;
figure(6)
plot(tx,corr) 
%3
beat_count = 0;
i = 0;
start = 0;
final = 0;
for k=2 : length(data4)-1
    if (data4(k)>data4(k-1) & data4(k)>data4(k+1) & data4(k)>0.55)
        beat_count= beat_count + 1;
        if i == 0
            start = k;
        end
        i = i + 1;
        final = k;
    end
end
%4
pf = (final - start)/(beat_count-1);
%5
pt = pf/Fs;
%6
hr = 60/pt;
disp(hr)
%7
Fs = 500;
NFFT = length(corr);
y = fft(corr,NFFT);
Y = fftshift(y);
F = ((0:1/NFFT:1-1/NFFT)*Fs).';
magnitudeY = abs(Y);   
phaseY = unwrap(angle(Y)); 
figure(7)
plot(F,fftshift(magnitudeY)) 
%8
S1 = load('/Users/sana/Desktop/Signal_Project_96101284/Diseas.mat');
data = S1.val;
t = 0:1:length(data)-1;
figure(11)
subplot (2,1,1),plot(t,data),title ('ECG Signal'),grid on 
subplot (2,1,2),plot(t(1:350),data(1:350)), title ('A period of ECG Signal'),grid on
%2
Fs = 250;
data1 = data;
NFFT = length(data1);
y = fft(data1,NFFT);
Y = fftshift(y);
F = ((0:1/NFFT:1-1/NFFT)*Fs).';
magnitudeY = abs(Y);   
phaseY = unwrap(angle(Y)); 
figure(12)
subplot (2,1,1),plot(F,magnitudeY),title ('Magnitude of FFT of ECG Signal'), grid on 
subplot (2,1,2),plot(F,phaseY),title ('Phase of FFT of ECG Signal'), grid on 
%3
figure(13) 
N = 10; 
Fc = 3;
hp = fdesign. highpass ('N,Fc', N, Fc, Fs); 
hpf = butter(hp);
data1n=data1./ max(data1);
data2=filter (hpf, data1n);
subplot (2,1,1), plot(data1n), title ('Normalized ECG Signal'), grid on
subplot (2,1,2), plot(data2), title ('ECG Signal with removed Motion Artifacts'), grid on
%4
figure(14) 
data2n=data2./ max(data2);
Fnotch = 60; 
BW = 120; 
Apass = 1; 
[b, a] = iirnotch (Fnotch/ (Fs/2), BW/ (Fs/2), Apass); 
notch = dfilt.df2 (b, a);
data3=filter (notch, data2n);
subplot (2, 1, 1), plot(data2n), title ('Normalized ECG Signal with removed Motion Artifacts'), grid on
subplot (2, 1, 2), plot (data3), title ('ECG Signal with removed Motion Artifacts and line noise Removed'), grid on
%5
figure(15)
N = 100; 
Fc = 100; 
lp = fdesign.lowpass ('N,Fc', N, Fc, Fs); 
lpf = butter(lp);
data3n=data3./ max(data3);
data41=filter (lpf, data3n);
subplot (2,1,1), plot(data3n), title ('Normalized ECG Signal with removed Motion Artifacts and line noise Removed'), grid on
subplot (2,1,2), plot(data41), title ('ECG Signal with removed Motion Artifacts and line noise Removed and reduced SNR'), grid on
data4down = downsample(data4,2)
figure(16)
subplot (2,1,1), plot(data4down), title ('Healthy'), grid on
subplot (2,1,2), plot(data41), title ('Sick'), grid on

