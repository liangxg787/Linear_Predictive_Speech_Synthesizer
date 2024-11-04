function mainFunction(fileStruct,segmentLen,NthOrder)
% MAINFUNCTION Summary of this function goes here
%
% [OUTPUTARGS] = MAINFUNCTION(INPUTARGS) Explain usage here
%
% Examples:
%
% Provide sample usage code here
%
% See also: List related files here

% Author: Xiaoguang Liang, University of Surrey
% Date: 2024/11/02 16:42:01
% Revision: 0.1

%% 1 Model Estimation
% Get the field names of the struct
feilds = fieldnames(fileStruct);

%% Iterate over the files to process the vowel files
for i = 1:length(feilds)
    gender = feilds{i};
    file = fileStruct.(gender);
    fprintf('>>> Start processing %s vowel file: %s\n',gender,file);

    %% 1.1 Pre-processing audio files
    % Choose the start point in the segment
    sampleStart = 1;
    fprintf('1.1 Pre-processing audio files\n');
    fprintf('Segment start point: %d; Segment length: %f\n', sampleStart, segmentLen);
    [~,Fs,segment] = preProcess(file, sampleStart,segmentLen);

    %% 1.2 Estimate the LPC coefficients
    fprintf('1.2 Estimate the LPC coefficients\n');
    fprintf('The Nth order of LPC is: %d\n',NthOrder);
    lpcCoeffs = estimateLpcCoeficients(segment,NthOrder);

    %% 1.3 Plot the frequency response of the LPC filter
    % 1.3.1 Compute frequency response and formant frequencies
    fprintf('1.3.1 Compute frequency response and formant frequencies\n');
    [response,W,formantFrequencies,Y,frequencyVector] = computeFrequencyResponse(lpcCoeffs,segment,Fs);

    % 1.3.2 Plot the frequency response of the LPC filter
    fprintf("1.3.2 Plot the frequency response of the LPC filter\n");
    strSegmentLen = num2str(segmentLen);
    strNthOrder = num2str(NthOrder);
    graphName=["frequency_response_of_LPC_filter_when_segmentLength_",strSegmentLen,'_Order_',strNthOrder];
    plotFrequencyResponse(Y,frequencyVector,response,W,formantFrequencies,graphName,strSegmentLen,strNthOrder);

    %% 1.4 Estimate the first three formant frequencies of the vowel
    fprintf("1.4 Estimate the first three formant frequencies of the vowel\n");
    firstThreeFormants = estimateFirstThreeFormant(formantFrequencies);

    %% 1.5 Estimate the mean fundamental frequency.
    fprintf("1.5 Estimate the mean fundamental frequency\n");
    meanFundamentalFrequency = estimateMeanFundamentalFrequency(segment,Fs,gender);
    fprintf('The mean fundamental frequency is: %d\n',meanFundamentalFrequency);

    %% 2 Synthesis
    %% 2.1 Generate a periodic impulse train with the same fundamental frequency
    fprintf("2.1 Generate a periodic impulse train with the same fundamental frequency\n");

    % Make the save file for the synthesis audios
    if strcmp(gender,'female')
        saveFile=['synthesized_speech_female_when_segmentLength_',strSegmentLen,'_Order_',strNthOrder,'.wav'];
    else
        saveFile=['synthesized_speech_male_when_segmentLength_',strSegmentLen,'_Order_',strNthOrder,'.wav'];
    end
    % Generate impulse train with the same fundamental frequency as the coriginal vowel segment
    generateImpulseTrain(Fs,meanFundamentalFrequency,lpcCoeffs,saveFile)

end


end
