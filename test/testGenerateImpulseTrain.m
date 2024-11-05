%% Author: Xiaoguang Liang (PG/T - Comp Sci & Elec Eng)
%% University of Surrey, United Kingdom
%% Email address: xl01339@surrey.ac.uk
%% Time: 01/11/2024 21:07

clc;
close all;
clear;

% Female vowel phoneme sample, had_f.wav
femaleFile=GlobalSetting.femaleFile;
% Male vowel phoneme sample, had_m.wav
maleFile=GlobalSetting.maleFile;

sampleStart = 800;
[y,Fs,segment]=preProcess(femaleFile,sampleStart);

lpcCoeffs = estimateLpcCoeficients(segment);

% gender='male';
gender='female';
meanFundamentalFrequency=estimateMeanFundamentalFrequency(segment,Fs,gender);

speechSynthesis(Fs,meanFundamentalFrequency,lpcCoeffs,gender);