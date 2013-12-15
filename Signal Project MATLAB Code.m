%==========================================================================
%     Student: Mathew Yamasaki
%      Course: Image and Signal Processing (CMSC 465)
%  Assignemnt: Signal Project
%        Date: Sunday, November 18, 2012
% Description: This program accpets three input signals and perfroms PSD,
% FFT, and magnitude analysis.
%==========================================================================

Fs=1024;                % samples per second
ts=1/Fs;                % seconds per sample

%==========================================================================
%                      Figure 1 - Plot input signals 
%==========================================================================
figure(1);
subplot(131);
plot(Signal1);
title('Signal 1 sampled at 1024 Hz','FontSize',12);
xlabel('n');
ylabel('x(n)');

subplot(132);
plot(Signal2,'r');
title('Signal 2 sampled at 1024 Hz','FontSize',12);
xlabel('n');
ylabel('x(n)');

subplot(133);
plot(Signal3,'k');
title('Signal 3 sampled at 1024 Hz','FontSize',12);
xlabel('n');
ylabel('x(n)');

% Perform PSD using Welch's method
Nfft=1024;
hanning=hann(Nfft);

% number of seconds: since the signal was sampled at 1024 samples per
% second, divide total signal length by 1024 to get the number of samples

% Determine PDSs for each signal using Welch's method
psdSig1Sec1=pwelch(Signal1(1:1024),hanning,0.5,Nfft,Fs);
psdSig1Sec2=pwelch(Signal1(1025:2048),hanning,0.5,Nfft,Fs);
psdSig1Sec3=pwelch(Signal1(2049:3072),hanning,0.5,Nfft,Fs);

psdSig2Sec1=pwelch(Signal2(1:1024),hanning,0.5,Nfft,Fs);
psdSig2Sec2=pwelch(Signal2(1025:2048),hanning,0.5,Nfft,Fs);
psdSig2Sec3=pwelch(Signal2(2049:3072),hanning,0.5,Nfft,Fs);

psdSig3Sec1=pwelch(Signal3(1:1024),hanning,0.5,Nfft,Fs);
psdSig3Sec2=pwelch(Signal3(1025:2048),hanning,0.5,Nfft,Fs);
psdSig3Sec3=pwelch(Signal3(2049:3072),hanning,0.5,Nfft,Fs);

%==========================================================================
%                         Figure 2 - Plot PSD 
%==========================================================================

% Plot PSD Signal 1
figure(2);
zoom xon;

subplot(331);
plot(psdSig1Sec1);
grid on;
title('First second PSD of Signal 1');
xlabel('Frequency (Hz)');
ylabel('Power spectral value');

subplot(334);
plot(psdSig1Sec2);
title('Second second PSD of Signal 1');
xlabel('Frequency (Hz)');
ylabel('Power spectral value');
grid on;

subplot(337);
plot(psdSig1Sec3);
grid on;
title('Third second PSD of Signal 1');
xlabel('Frequency (Hz)');
ylabel('Power spectral value');

% Plot PSD Signal 2
subplot(332);
plot(psdSig2Sec1,'-r');
grid on;
title('First second PSD of Signal 2');
xlabel('Frequency (Hz)');
ylabel('Power spectral value');

subplot(335);
plot(psdSig2Sec2,'r');
grid on;
title('Second second PSD of Signal 2');
xlabel('Frequency (Hz)');
ylabel('Power spectral value');

subplot(338);
plot(psdSig2Sec3,'r');
grid on;
title('Third second PSD of Signal 2');
xlabel('Frequency (Hz)');
ylabel('Power spectral value');

% Plot signal 3
subplot(333);
plot(psdSig3Sec1,'k');
grid on;
title('First second PSD of Signal 1');
xlabel('Frequency (Hz)');
ylabel('Power spectral value');

subplot(336);
plot(psdSig3Sec2,'k');
grid on;
title('Second second PSD of Signal 2');
xlabel('Frequency (Hz)');
ylabel('Power spectral value');

subplot(339);
plot(psdSig3Sec3,'k');
grid on;
title('Third second PSD of Signal 3');
xlabel('Frequency (Hz)');
ylabel('Power spectral value');

%==========================================================================
%                       Figure 3 - Plot magnitudes
%==========================================================================
figure(3);
%zoom yon; 
zoom xon;

% Plot Signal 1
subplot(131);
plot(abs(fft(Signal1)));
grid on;
title('Signal 1 magnitude');
xlabel('Frequency (Hz)');
ylabel('Y');

% Plot Signal 2
subplot(132);
plot(abs(fft(Signal2)),'r');
grid on;
title('Signal 2 magnitude');
xlabel('Frequency (Hz)');
ylabel('Y');

% Plot Signal 3
subplot(133);
plot(abs(fft(Signal3)),'k');
grid on;
title('Signal 3 magnitude');
xlabel('Frequency (Hz)');
ylabel('Y');

%==========================================================================
%                          Figure 4 - FFT plots
%==========================================================================
figure(4);
N=length(Signal1);
zoom yon; 
zoom xon;

f=Fs/2*linspace(0,1,Nfft/2+1);
y1=fft(Signal1,Nfft)/Fs;
y2=fft(Signal2,Nfft)/Fs;
y3=fft(Signal3,Nfft)/Fs;

subplot(311);
plot(f,2*abs(y1(1:Nfft/2+1)));
grid on;
title('Singe-sided amplitude spectrum of FFT of Signal 1','FontSize',12);
xlabel('Frequency (Hz)');
ylabel('|FFT|');

subplot(312);
plot(f,2*abs(y2(1:Nfft/2+1)));
grid on;
title('Singe-sided amplitude spectrum of FFT of Signal 2','FontSize',12);
xlabel('Frequency (Hz)');
ylabel('|FFT|');

subplot(313);
plot(f,2*abs(y3(1:Nfft/2+1)));
grid on;title('Singe-sided amplitude spectrum of FFT of Signal 3','FontSize',12);
xlabel('Frequency (Hz)');
ylabel('|FFT|');

%==========================================================================
%                      Figure 5 - PSD comparisons
%==========================================================================
figure(5);
zoom yon;

subplot(131);
hold all;
plot(psdSig1Sec1,'b');
plot(psdSig2Sec1,'r');
plot(psdSig3Sec1,'k');
title('First second PSD comparison');
xlabel('Frequency (Hz)');
ylabel('Power spectral value');
legend('Signal 1','Signal 2', 'Signal 3');

subplot(132);
hold all;
plot(psdSig1Sec2,'b');
plot(psdSig2Sec2,'r');
plot(psdSig3Sec2,'k');
title('Second second PSD comparison');
xlabel('Frequency (Hz)');
ylabel('Power spectral value');
legend('Signal 1','Signal 2', 'Signal 3');

subplot(133);
hold all;
plot(psdSig1Sec3,'b');
plot(psdSig2Sec3,'r');
plot(psdSig3Sec3,'k');
title('Third second PSD comparison');
xlabel('Frequency (Hz)');
ylabel('Power spectral value');
legend('Signal 1','Signal 2', 'Signal 3');

%==========================================================================
%                    Figure 6 - Plot magnitudes
%==========================================================================
figure(6);
hold all;
zoom yon;

plot(abs(fft(Signal1)),'b');
plot(abs(fft(Signal2)),'r');
plot(abs(fft(Signal3)),'k');
grid on;
title('Magnitude comparison');
xlabel('Frequency (Hz)');
ylabel('Y');
legend('Signal 1','Signal 2', 'Signal 3');