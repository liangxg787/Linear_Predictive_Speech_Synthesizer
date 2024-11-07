%% Author: Xiaoguang Liang (PG/T - Comp Sci & Elec Eng)
%% University of Surrey, United Kingdom
%% Email address: xl01339@surrey.ac.uk
%% Time: 01/11/2024 19:39

clc;
close all;
clear;

% Female vowel phoneme sample, had_f.wav
femaleFile=GlobalSetting.femaleFile;
% Male vowel phoneme sample, had_m.wav
maleFile=GlobalSetting.maleFile;

% Load the speech signal
[y, fs] = audioread(maleFile); 

% Create a time vector for plotting
t = (0:length(y)-1) / fs;

% Plot the time-domain waveform
plot(t, y);


xlabel('Time (seconds)');
ylabel('Amplitude');
title('Time-Domain Waveform of Speech Signal');

% Optional: Zoom in on a specific time range for clarity
% xlim([0 0.5]); % View the first 0.5 seconds