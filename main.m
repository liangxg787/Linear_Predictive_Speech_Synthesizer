%% Author: Xiaoguang Liang (PG/T - Comp Sci & Elec Eng)
%% University of Surrey, United Kingdom
%% Email address: xl01339@surrey.ac.uk
%% Time: 29/10/2024 21:16

clc;
close all;
clear;

% Female vowel phoneme sample, had_f.wav
femaleFile=GlobalSetting.femaleFile;
% Male vowel phoneme sample, had_m.wav
maleFile=GlobalSetting.maleFile;

% Create a struct for sample files of the female or male
fileStruct = struct('female', femaleFile, 'male', maleFile);

%% 1 Model Estimation & 2 Speech Synthesis

% default length of segment: 0.1, 100ms
segmentLen = GlobalSetting.segmentLen;
% Default Order of the LPC filter, an Nth order forward linear predictor
NthOrder = GlobalSetting.NthOrder;

% Start processing the vowels
mainFunction(fileStruct,segmentLen,NthOrder);

%% 3 Experiment with different AR model orders and segment lengths. Notice: Part 1 and 2 are included in the mainFunction()

% The lengths of segment range from 50ms to 200ms
segmentLenArray=0.05:0.05:0.2;
% segmentLenArray=[];
% Orders of the LPC filter, an Nth order forward linear predictor, range from 15 to 35
NthOrdersArray=15:5:35;

% Loop over the segment lengths and orders, and run the mainFunction to plot graphs and generate the synthesis audios
for i=1:length(segmentLenArray)
    segmentLen=segmentLenArray(i);
    for j=1:length(NthOrdersArray)
        NthOrder=NthOrdersArray(j);
        fprintf('>>> Experiment when Segment Length: %f and Order: %s\n',segmentLen,NthOrder);
        mainFunction(fileStruct,segmentLen,NthOrder);
    end
end


