%% Author: Xiaoguang Liang (PG/T - Comp Sci & Elec Eng)
%% University of Surrey, United Kingdom
%% Email address: xl01339@surrey.ac.uk
%% Time: 31/10/2024 22:52

clc;
close all;
clear;

% Female vowel phoneme sample, had_f.wav
femaleFile=GlobalSetting.femaleFile;
% Male vowel phoneme sample, had_m.wav
maleFile=GlobalSetting.maleFile;
% gender = 'female';
gender = 'male';

% default length of segment: 0.1, 100ms
segmentLen = GlobalSetting.segmentLen;
% Default Order of the LPC filter, an Nth order forward linear predictor
NthOrder = GlobalSetting.NthOrder; 

% Choose the start point in the segment
sampleStart = 1;

[y,Fs,segment]=preProcess(maleFile,sampleStart,segmentLen);

lpcCoeffs = estimateLpcCoeficients(segment,NthOrder);
