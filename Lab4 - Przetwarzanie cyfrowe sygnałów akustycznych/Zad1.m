% 48k - standard audiofilski
% dziś 16 lub 24 bitowe przetworniki (dynamika)
% 1 bit - ok. 6dB
% godzina 700MB nieskopresowanego, 8 razy mniej skompresowanego
% .au ma tylko inny head nagrania niż .wav (format przejęty przez Apple od
% sun)
% as ma fonem dźwięczny i bezdźwięczny (szumowa spółgłoska)
%%
clc; clear; close all;

[y, fs] = audioread("17_as_norm.wav");
dt = 1/fs;
t = dt*[0:length(y)-1];
ym = y - mean(y);

figure(1);

subplot(2,1,1); plot(t, y);
title("Przebieg surowy");
xlabel("Czas"); ylabel("Amplituda");
legend("Sygnał mowy", "EGG");

subplot(2,1,2); plot (t, ym);
title("Przebieg bez składowej stałej");
xlabel("Czas"); ylabel("Amplituda");
legend("Sygnał mowy", "EGG");
%%
%figure(2);
%plot(t, y(:,1), t, y(:,2)); % Wyświetlanie obu kanałów pojedynczo

