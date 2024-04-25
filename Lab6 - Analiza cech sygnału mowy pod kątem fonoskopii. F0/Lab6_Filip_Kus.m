%% a)

clc; clear; close all;

[ya, fs] = audioread('17_aaa_norm.wav');
[ye] = audioread('17_eee_norm.wav');
[yi] = audioread('17_iii_norm.wav');
[yu] = audioread('17_uuu_norm.wav');

% Funkcja autokorelacji
F0_a_y = F0(ya, 1, fs);
F0_a_EGG = F0(ya, 2, fs);
F0_e_y = F0(ye, 1, fs);
F0_e_EGG = F0(ye, 2, fs);
F0_i_y = F0(yi, 1, fs);
F0_i_EGG = F0(yi, 2, fs);
F0_u_y = F0(yu, 1, fs);
F0_u_EGG = F0(yu, 2, fs);

%% b)

pitch_F0_a_y = pitch_F0(ya, 1, fs);
pitch_F0_a_EGG = pitch_F0(ya, 2, fs);
pitch_F0_e_y = pitch_F0(ye, 1, fs);
pitch_F0_e_EGG = pitch_F0(ye, 2, fs);
pitch_F0_i_y = pitch_F0(yi, 1, fs);
pitch_F0_i_EGG = pitch_F0(yi, 2, fs);
pitch_F0_u_y = pitch_F0(yu, 1, fs);
pitch_F0_u_EGG = pitch_F0(yu, 2, fs);