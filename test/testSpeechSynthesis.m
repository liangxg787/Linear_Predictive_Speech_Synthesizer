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

% default length of segment: 0.1, 100ms
segmentLen = GlobalSetting.segmentLen;
% Default Order of the LPC filter, an Nth order forward linear predictor
NthOrder = GlobalSetting.NthOrder;

sampleStart = 1;
[y,Fs,segment]=preProcess(femaleFile,sampleStart,segmentLen);

lpcCoeffs = estimateLpcCoeficients(segment,NthOrder);

% gender='male';
gender='female';
meanFundamentalFrequency=estimateMeanFundamentalFrequency(segment,Fs,gender);

strSegmentLen = num2str(segmentLen*1000);
strNthOrder = num2str(NthOrder);

if strcmp(gender,'female')
    saveFile=['synthesized_speech_female_when_segmentLength_',strSegmentLen,'_Order_',strNthOrder,'.wav'];
else
    saveFile=['synthesized_speech_male_when_segmentLength_',strSegmentLen,'_Order_',strNthOrder,'.wav'];
end

speechSynthesis(Fs,meanFundamentalFrequency,lpcCoeffs,saveFile);