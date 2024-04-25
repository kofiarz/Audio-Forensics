%Preemfaza - odjęcie wartości średniej lub zastosowanie filtracji I rzędu
%dla sygnału mowy. Chodzi o uwypulenie wyższych częstotliwości. Wszystko
%krtaniowe (dźwięcznie) ma największe znaczenie z punktu widzenia
%informacji, tak jak w mandaryńskim. Samogłoski mają duże znaczenie, ale są
%wysokoenergetyczne, więc feminizm spółgłoskowy, by wyrównać je z
%samogłoskami

clc; clear; close all;

[y, fs] = audioread('17_as_norm.wav');

h = [1 -0.95];
ynew = filter(h, 1, y(:,1));

for i = 1:length(y) - 1
    yn(i,1) = y(i+1, 1) - 0.95*y(i,1);
end

for i = 1:length(ym) - 1
    ymn(i,1) = ym(i+1, 1) - 0.95*ym(i,1);
end

N = 1024;
noverlap = 0;
win = blackman(N);

figure(1)
subplot(5,1,1); spectrogram(y(:,1), win, noverlap, N, fs)
subplot(5,1,2); spectrogram(ynew(:,1), win, noverlap, N, fs)
subplot(5,1,3); spectrogram(yn(:,1), win, noverlap, N, fs)
subplot(5,1,4); spectrogram(ym(:,1), win, noverlap, N, fs)
subplot(5,1,5); spectrogram(ymn(:,1), win, noverlap, N, fs)