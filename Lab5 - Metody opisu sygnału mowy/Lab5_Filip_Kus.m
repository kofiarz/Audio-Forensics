% W sprawozdaniu przesyłamy tylko kod w m-plikach
% 20-30ms: pobrać odpowiednią liczbę próbek za ten czas
% Całka - zsumowanie wszystkich  amplitud (sum)
% t2-t1: szerokość ramki
% Moment zerowy: sumowanie widma mocy w dziedzinie częstotliwści
% Moment drugiego rzędu: rozrzut
% Kurtoza - mówi o harmonicznych, im bardziej spłaszczone, tym mniej harmonicznych
% Druga strona e pierwszy wzór: n2 - n1, a nie n2 - n2

%% Zadanie 1
clc; clear; close all;

[y, fs] = audioread("17_dzis_jest_ladna_pogoda_norm.wav");
ramka_t = 0.02;
ramka_f = fs * ramka_t;
l_ramek = round(length(y)/ramka_f, "TieBreaker","plusinf"); %dzięki zaokrągleniu ostatnia ramka wliczona

%prealokacja
calka = zeros(l_ramek, 1);
energia = zeros(l_ramek, 1);
moc = zeros(l_ramek, 1);
rms = zeros(l_ramek, 1);
minimum = zeros(l_ramek, 1);
maksimum = zeros(l_ramek, 1);

for i=1:l_ramek 
    ramka_y = y((i-1)*ramka_f + 1:i*ramka_f, 1);

    calka(i, 1) = sum(ramka_y);
    energia(i, 1) = sum(ramka_y.^2);
    moc(i, 1) = energia(i, 1)/ramka_f;
    rms(i, 1) = sqrt(moc(i,1));
    minimum(i, 1) = min(ramka_y);
    maksimum(i, 1) = max(ramka_y);
end

figure("Name", "Zadanie 1", "WindowState", "maximized"); 
subplot(6, 1, 1); plot(calka); title("Całka sygnału"); xlim tight;
subplot(6, 1, 2); plot(energia); title("Energia sygnału"); xlim tight;
subplot(6, 1, 3); plot(moc); title("Moc sygnału"); xlim tight;
subplot(6, 1, 4); plot(rms); title("RMS sygnału"); xlim tight;
subplot(6, 1, 5); plot(minimum); title("Minimum sygnału"); xlim tight;
subplot(6, 1, 6); plot(maksimum); xlabel('Numer ramki czasowej'); title("Maksimum sygnału"); xlim tight;

%% Zadanie 2

%prealokacja
moment0 = zeros(l_ramek, 1);
moment1 = zeros(l_ramek, 1);
moment2 = zeros(l_ramek, 1);
moment3 = zeros(l_ramek, 1);
moment4 = zeros(l_ramek, 1);
skosnosc = zeros(l_ramek, 1);
kurtoza = zeros(l_ramek, 1);

for i=1:l_ramek
    ramka_y = y((i-1)*ramka_f + 1:i*ramka_f, 1);
    ramka_y = ramka_y.*hamming(ramka_f);
    ramka_Y = fft(ramka_y);
    f_i = ((0:length(ramka_Y)-1)*fs/length(ramka_Y))';

    moment0(i,1) = sum(abs(ramka_Y));
    moment1(i,1) = sum(abs(ramka_Y).*f_i)/moment0(i,1);
    moment2(i,1) = sum(abs(ramka_Y).*(f_i-moment1(i,1)).^2)/moment0(i,1);
    moment3(i,1) = sum(abs(ramka_Y).*(f_i-moment1(i,1)).^3)/moment0(i,1);
    moment4(i,1) = sum(abs(ramka_Y).*(f_i-moment1(i,1)).^4)/moment0(i,1);
    skosnosc(i,1) = moment3(i,1)/moment2(i,1).^3;
    kurtoza(i,1) = moment4(i,1)/moment2(i,1).^2;
end

figure("Name", "Zadanie 2", "WindowState", "maximized");
subplot(7, 1, 1); plot(moment0); title("Moment zerowy sygnału"); xlim tight;
subplot(7, 1, 2); plot(moment1); title("Moment unormowany 1. rzędu sygnału"); xlim tight;
subplot(7, 1, 3); plot(moment2); title("Moment unormowany centralny 2. rzędu sygnału"); xlim tight;
subplot(7, 1, 4); plot(moment3); title("Moment unormowany centralny 3. rzędu sygnału"); xlim tight;
subplot(7, 1, 5); plot(moment4); title("Moment unormowany centralny 4. rzędu sygnału"); xlim tight;
subplot(7, 1, 6); plot(skosnosc); title("Skosnosc sygnału"); xlim tight;
subplot(7, 1, 7); plot(kurtoza); xlabel('Numer ramki czasowej'); title("Kurtoza sygnału"); xlim tight;

