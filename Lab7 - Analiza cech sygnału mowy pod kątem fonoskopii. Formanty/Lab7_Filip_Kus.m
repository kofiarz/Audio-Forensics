%% Zadanie a)

clc; clear; close all;

% Wczytanie plików audio
[y1, fs] = audioread("17_a_norm.wav");
[y2] = audioread("17_e_norm.wav");
[y3] = audioread("17_i_norm.wav");
[y4] = audioread("17_u_norm.wav");

% Odjęcie składowej stałej
y1 = y1 - mean(y1);
y2 = y2 - mean(y2);
y3 = y3 - mean(y3);
y4 = y4 - mean(y4);

% Zastosowanie okna
y1 = y1 .* hamming(length(y1));
y2 = y2 .* hamming(length(y2));
y3 = y3 .* hamming(length(y3));
y4 = y4 .* hamming(length(y4));

% Preemfaza
h = [1 -0.95];
y1 = filter(h, 1, y1(:,1));
y2 = filter(h, 1, y2(:,1));
y3 = filter(h, 1, y3(:,1));
y4 = filter(h, 1, y4(:,1));

% Szybka transformacja Fouriera
N = 8192;
df = fs/N;
f = (0:N-1)*df;

Y1 = fft(y1, N);
Y2 = fft(y2, N);
Y3 = fft(y3, N);
Y4 = fft(y4, N);

% Wykonanie obwiedni
np1 = 38;
np2 = 35;
np3 = 15;
np4 = 15; 
[up1] = envelope(abs(Y1), np1, 'peak');
[up2] = envelope(abs(Y2), np2, 'peak');
[up3] = envelope(abs(Y3), np3, 'peak');
[up4] = envelope(abs(Y4), np4, 'peak');

% Prezentacja wyników
figure("Name", "Zadanie 1"); 
subplot(4,1,1); plot(f(1:N/2), abs(Y1(1:N/2)), f(1:N/2), up1(1:N/2)); xlim([0, 3000]); title("Samogłoska 'a'"); legend('Widmo samogłoski', 'Obwiednia widma');
subplot(4,1,2); plot(f(1:N/2), abs(Y2(1:N/2)), f(1:N/2), up2(1:N/2)); xlim([0, 3000]); title("Samogłoska 'e'"); legend('Widmo samogłoski', 'Obwiednia widma');
subplot(4,1,3); plot(f(1:N/2), abs(Y3(1:N/2)), f(1:N/2), up3(1:N/2)); xlim([0, 3000]); title("Samogłoska 'i'"); legend('Widmo samogłoski', 'Obwiednia widma');
subplot(4,1,4); plot(f(1:N/2), abs(Y4(1:N/2)), f(1:N/2), up4(1:N/2)); xlim([0, 3000]); title("Samogłoska 'u'"); legend('Widmo samogłoski', 'Obwiednia widma');


%% Zadanie b)

% Weryfikacja wyników
formants1 = formants_lpc(y1, fs);
formants2 = formants_lpc(y2, fs);
formants3 = formants_lpc(y3, fs);
formants4 = formants_lpc(y4, fs);
% Zmienne formants_ do obejrzenia w przestrzeni roboczej po prawej


