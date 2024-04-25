clc; clear; close all;

[s,fs] = audioread("17_as_norm.wav");
N = round(0.03*fs);
%do ludzkiej mowy stosujemy FIR
%projektowanie amplitudowo-widmowe
noverlap = 0;
win = hann(N);
fg= 4000;
fz = (2*fg)/fs;
F = [0, fz, 1.2*fz, 1];
M = [1, 1, 0, 0];
B = fir2(1024, F, M);
snew (:,1) = conv(s(:,1), N);
%snew(:,2) = conc(s(:,2), 0);

figure(1);
subplot(2,1,1); spectrogram(s(:,1), win, noverlap, N, fs); colorbar;
subplot(2,1,2); spectrogram(snew(:,1), win, noverlap, N, fs); colorbar;
