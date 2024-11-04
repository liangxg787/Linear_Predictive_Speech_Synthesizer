%% Author: Xiaoguang Liang (PG/T - Comp Sci & Elec Eng)
%% University of Surrey, United Kingdom
%% Email address: xl01339@surrey.ac.uk
%% Time: 01/11/2024 18:52

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

[response,W,formantFrequencies] = computeFrequencyResponse(lpcCoeffs,segment,Fs);

firstThreeFormants=estimateFirstThreeFormant(formantFrequencies);