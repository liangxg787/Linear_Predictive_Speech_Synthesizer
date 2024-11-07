%% Author: Xiaoguang Liang (PG/T - Comp Sci & Elec Eng)
%% University of Surrey, United Kingdom
%% Email address: xl01339@surrey.ac.uk
%% Time: 31/10/2024 21:46

clc;
close all;
clear;

% Female vowel phoneme sample, had_f.wav
femaleFile=GlobalSetting.femaleFile;
% Male vowel phoneme sample, had_m.wav
maleFile=GlobalSetting.maleFile;

% default length of segment: 0.1, 100ms
segmentLen = GlobalSetting.segmentLen;

sampleStart = 800;
[y,Fs,segment]=preProcess(maleFile,sampleStart,segmentLen);

meanFundamentalFrequency=estimateMeanFundamentalFrequency(segment,Fs,'male');