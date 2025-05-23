function speechSynthesis(Fs, meanF0, lpcCoeffs, saveFile)
% SPEECHSYNTHESIS Summary of this function goes here
%
% [OUTPUTARGS] = SPEECHSYNTHESIS(INPUTARGS) This function synthesizes speech using the given fundamental frequency, LPC coefficients, and sampling rate.
% It generates a periodic impulse train, filters it using the LPC coefficients, normalizes the synthesized signal, and saves it to a specified file.
%
% Examples:
% Fs = 16000;
% meanF0 = 120; % Example mean fundamental frequency
% lpcCoeffs = [1, -0.8, 0.3]; % Example LPC coefficients
% saveFile = 'synthesized_speech.wav';
% speechSynthesis(Fs, meanF0, lpcCoeffs, saveFile);
%
% See also: estimateMeanFundamentalFrequency, estimateLpcCoeficients

% Author: Xiaoguang Liang, University of Surrey
% Date: 2024/11/01 20:40:37
% Revision: 0.1

% Define the variable to manipulate the length of the synthesized signal
% Unit of measurement: seconds
desiredSpan = 1;
desiredSamples = round(desiredSpan * Fs);

%% Generate a periodic impulse train with the same fundamental frequency
% as the original vowel segment and of roughly a second in length
impulseTrainPeriod = round(Fs / meanF0);

impulseTrainSamples = min(desiredSamples, impulseTrainPeriod);
impulseTrain = zeros(1, desiredSamples);
impulseTrain(1:impulseTrainSamples:end) = 1;

% Filter the pulse train using the LPC filter determined above
synthesizedSignal = filter(1, lpcCoeffs, impulseTrain);

% Normalize the synthesized signal
synthesizedSignal = synthesizedSignal / max(abs(synthesizedSignal));

% Play the signal
% sound(synthesizedSignal, Fs);

% Make the save path for the synthesis audio
saveDir = GlobalSetting.SYNTHESIS_PATH;
if ~exist(saveDir, 'dir')
    % Create the new directory
    mkdir(saveDir);
end

savePath = fullfile(saveDir, saveFile);
% Synthesis signal output
audiowrite(savePath, synthesizedSignal, Fs);

end