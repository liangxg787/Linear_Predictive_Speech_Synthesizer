%% Author: Xiaoguang Liang (PG/T - Comp Sci & Elec Eng)
%% University of Surrey, United Kingdom
%% Email address: xl01339@surrey.ac.uk
%% Time: 02/11/2024 15:28

clc;
close all;
clear;

% Female vowel phoneme sample, had_f.wav
femaleFile=GlobalSetting.femaleFile;
% Male vowel phoneme sample, had_m.wav
maleFile=GlobalSetting.maleFile;

% Choose the start point in the segment
sampleStart = 800;

[y,Fs,segment]=preProcess(femaleFile,sampleStart);

lpcCoeffs = estimateLpcCoeficients(segment);

[response,normAngFreq,formantFrequencies] = computeResponeFrequency(lpcCoeffs,segment,Fs);

[Y,frequencyVector] = transformToFrequencyDomain(segment,Fs,response);

plotFrequencyResponse(Y,frequencyVector,response,normAngFreq,formantFrequencies);