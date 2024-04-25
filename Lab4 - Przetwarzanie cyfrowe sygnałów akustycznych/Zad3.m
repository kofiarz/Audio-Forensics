%sprawdza się przeskoki częstotliwości
clc; clear; close all;
[y, fs] = audioread('17_as_norm.wav');
%od 25 do 35 ms - takie ramki czasowe stosuje się w j. polskim
N = 1024;
noverlap = 0; % nakładkowanie
win = hann(N);
[S, F, T] = spectrogram(y(:,1), win, noverlap, N, fs);
modul = abs(S).^2;
spec = 20*log10(modul);
figure(1);
imagesc(T, F, spec); %imagesc do rysowania macierzy
spectrogram(y(:,1), win, noverlap, N, fs, 'yaxis')
%windowDesigner (dawniej wintool) w command line
%amerykańskie podejście - time i frequency zamienione na osiach
%prawo Webera-Fehnera: człowiek odbiera bodźce logarytmicznie, a nie
%liniowo