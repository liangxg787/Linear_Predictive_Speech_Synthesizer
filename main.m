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

% Set the Experiment Mode. 1: run experiment mode for experiments; 0: run default mode for mainFunction with default parameters
ExperimentMode = 1;

% Create a struct for the output arguments
experimentArgs = struct('gender', {}, 'segmentLen', {}, 'NthOrder', {}, 'H', {}, 'W', {}, 'formantFrequencies', {}, 'Y', {}, 'frequencyVector', {});
if ExperimentMode == 0
    fprintf('>>> Run default mode \n');
    %% 1 Model Estimation & 2 Speech Synthesis
    % default length of segment: 0.1, 100ms
    segmentLen = GlobalSetting.segmentLen;
    % Default Order of the LPC filter, an Nth order forward linear predictor
    NthOrder = GlobalSetting.NthOrder;
  
    % Start processing the vowels
    mainFunction(fileStruct,segmentLen,NthOrder,ExperimentMode,experimentArgs);
else
    fprintf('>>> Run experiment mode \n');
    %% 3 Experiment with different AR model orders and segment lengths. Notice: Part 1 and 2 are included in the mainFunction()

    % The lengths of segment range from 50ms to 200ms
    segmentLenArray=0.05:0.05:0.2;
    % segmentLenArray=0.05:0.05:0.1;
    % Orders of the LPC filter, an Nth order forward linear predictor, range from 15 to 35
    NthOrdersArray=15:5:35;
    % NthOrdersArray=15:5:20;

    % Start experiments for processing the vowels
    mainFunctionForExperiments(fileStruct,segmentLenArray,NthOrdersArray,ExperimentMode,experimentArgs);
end


