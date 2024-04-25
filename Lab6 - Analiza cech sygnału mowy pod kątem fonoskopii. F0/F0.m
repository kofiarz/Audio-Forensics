function F0_value = F0(vowel, signal_type, fs) 
% F0 przyjmuje argumenty: sygnał ya/ye/yi/y;  typ sygnału - mowa (wartość 1) lub EGG (wartość 2), częstotliwość próbkowania sygnałów wejściowych
R = xcorr(vowel(:, signal_type), 'unbiased'); % do obliczenia autokorelacji wykorzystana funkcja wbudowana xcorr
R = R(10000:80000); % zawężenie zakresu wyniku, by znaleźć prawidłowe maksimum (i tak znajduje się ono na środku przebiegu)
[~, xmax1] = max(R); % znalezienie maksimum funkcji autokorelacji
R(xmax1 - 20 : xmax1 + 20) = 0; % wyzerowanie wartości maksimum globalnego i jego otoczenia w celu prawidłowego znalezienia sąsiedniego maksimum
[~, xmax2] = max(R); % znalezienie sąsiedniego maksimum
F0_value = fs/abs(xmax1 - xmax2); % obliczenie F0
end


