%% Author: Xiaoguang Liang (PG/T - Comp Sci & Elec Eng)
%% University of Surrey, United Kingdom
%% Email address: xl01339@surrey.ac.uk
%% Time: 01/11/2024 21:43

clc;
close all;
clear;

% Original vowels sample
% Female vowel phoneme sample, had_f.wav
femaleFile=GlobalSetting.femaleFile;
% Male vowel phoneme sample, had_m.wav
maleFile=GlobalSetting.maleFile;

% Synthesized speech samples
% Female speech
saveDir=GlobalSetting.SYNTHESIS_PATH;
femaleSynSpeech=fullfile(saveDir, 'synthesized_speech_female.wav');
% Male speech
maleSynSpeech=fullfile(saveDir, 'synthesized_speech_male.wav');

% Create a struct for sample files of the female or male
fileStruct = struct('female', femaleFile, 'male', maleFile);

% fileStruct = struct('female', femaleSynSpeech, 'male', maleSynSpeech);

% Get the field names of the struct
feilds = fieldnames(fileStruct);

%% Iterate over the files to process the vowel files
fprintf('Start processing female and male vowel files:\n');
for i = 1:length(feilds)
    gender = feilds{i};
    file = fileStruct.(gender);

    % Read the audio file
    [y,Fs]=audioread(file);
    
    % Play the audio
    ap = audioplayer(y,Fs,16);
    play(ap);
    pause(3);

end