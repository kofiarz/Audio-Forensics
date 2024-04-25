%Sygnał mowy jest niestacjonarny. Nie można stosować klasycznej
%transformaty, bo sygnał zostanie uśredniony.

%Y = fft(y, n);
%widmo mocy |X| = sqrt(Xreal^2 * Ximag^2)
%Wzór na DFT: Skoro t to n, a f to m, to X(m) = Sum(n=0 do N-1)
%x(n)*e^-j...
%N = 2^k
%%
clc; clear; close all;

[y, fs] = audioread ("17_as_norm.wav");
N = 1024; %length(y)
df = fs/N;
f = [0:N-1]*df;
Y = fft(y, N);

figure(1);

subplot(3,1,1);
plot(f, abs(Y)); %robimy z połowy, dla całości widmo byłoby symetryczne
title('abs');

subplot(3,1,2);
plot(f(1:N/2), real(Y(1:N/2)));
title('real');

subplot(3,1,3);
plot(f(1:N/2), imag(Y(1:N/2)));
title('imag');