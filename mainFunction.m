function experimentArgs = mainFunction(fileStruct, segmentLen, NthOrder, ExperimentMode, experimentArgs)
% MAINFUNCTION Summary of this function goes here
%
% [OUTPUTARGS] = MAINFUNCTION(INPUTARGS) This function processes vowel files to estimate LPC coefficients, formant frequencies, and the mean fundamental frequency.
% It also synthesizes speech based on the estimated parameters and saves the results.
%
% Examples:
% fileStruct = struct('male', 'male_vowel.wav', 'female', 'female_vowel.wav');
% segmentLen = 0.1; % Segment length in seconds
% NthOrder = 10; % Order of LPC coefficients
% ExperimentMode = 0; % 0 for plotting, 1 for saving results
% experimentArgs = [];
% mainFunction(fileStruct, segmentLen, NthOrder, ExperimentMode, experimentArgs);
%
% See also: preProcess, estimateLpcCoeficients, computeFrequencyResponse, estimateFirstThreeFormant, plotFrequencyResponse, estimateMeanFundamentalFrequency, speechSynthesis

% Author: Xiaoguang Liang, University of Surrey
% Date: 2024/11/02 16:42:01
% Revision: 0.1

%% 1 Model Estimation
% Get the field names of the struct
fields = fieldnames(fileStruct);

%% Iterate over the files to process the vowel files
for i = 1:length(fields)
    gender = fields{i};
    file = fileStruct.(gender);
    fprintf('>>> Start processing %s vowel file: %s\n', gender, file);

    %% 1.1 Pre-processing audio files
    % Choose the start point in the segment
    sampleStart = 1;
    fprintf('1.1 Pre-processing audio files\n');
    fprintf('Segment start point: %d; Segment length: %f\n', sampleStart, segmentLen);
    [~, Fs, segment] = preProcess(file, sampleStart, segmentLen);

    %% 1.2 Estimate the LPC coefficients
    fprintf('1.2 Estimate the LPC coefficients\n');
    fprintf('The Nth order of LPC is: %d\n', NthOrder);
    lpcCoeffs = estimateLpcCoeficients(segment, NthOrder);

    %% 1.3 Plot the frequency response of the LPC filter
    % 1.3.1 Compute frequency response and formant frequencies
    fprintf('1.3.1 Compute frequency response and formant frequencies\n');
    [H, W, formantFrequencies, Y, frequencyVector] = computeFrequencyResponse(lpcCoeffs, segment, Fs);

    % Get the first three formant frequencies of the vowel and plot them
    formantFrequencies = estimateFirstThreeFormant(formantFrequencies);

    % Save the output arguments
    if ExperimentMode == 1
        experimentArgs(end+1).gender = gender;
        experimentArgs(end).segmentLen = segmentLen;
        experimentArgs(end).NthOrder = NthOrder;
        experimentArgs(end).H = H;
        experimentArgs(end).W = W;
        experimentArgs(end).formantFrequencies = formantFrequencies;
        experimentArgs(end).Y = Y;
        experimentArgs(end).frequencyVector = frequencyVector;
    end

    strSegmentLen = num2str(segmentLen * 1000);
    strNthOrder = num2str(NthOrder);
    % Only on experiment mode, plot the frequency response of the LPC filter
    if ExperimentMode == 0
        % 1.3.2 Plot the frequency response of the LPC filter
        fprintf("1.3.2 Plot the frequency response of the LPC filter\n");
        plotFrequencyResponse(H, W, formantFrequencies, Y, frequencyVector, strSegmentLen, strNthOrder, gender);
    end

    %% 1.4 Estimate the first three formant frequencies of the vowel
    fprintf("1.4 Estimate the first three formant frequencies of the vowel\n");
    firstThreeFormants = formantFrequencies;

    %% 1.5 Estimate the mean fundamental frequency.
    fprintf("1.5 Estimate the mean fundamental frequency\n");
    meanFundamentalFrequency = estimateMeanFundamentalFrequency(segment, Fs, gender);
    fprintf('The mean fundamental frequency is: %d\n', meanFundamentalFrequency);

    %% 2 Synthesis
    %% 2.1 Generate a periodic impulse train with the same fundamental frequency
    fprintf("2.1 Generate a periodic impulse train with the same fundamental frequency\n");
    % Make the save file for the synthesis audios
    if strcmp(gender, 'female')
        saveFile = ['synthesized_speech_female_when_segmentLength_', strSegmentLen, '_Order_', strNthOrder, '.wav'];
    else
        saveFile = ['synthesized_speech_male_when_segmentLength_', strSegmentLen, '_Order_', strNthOrder, '.wav'];
    end
    % Generate impulse train with the same fundamental frequency as the original vowel segment
    speechSynthesis(Fs, meanFundamentalFrequency, lpcCoeffs, saveFile);

end

end