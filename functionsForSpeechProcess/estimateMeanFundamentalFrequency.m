function meanFundamentalFrequency=estimateMeanFundamentalFrequency(segment,Fs,gender)
% ESTIMATEMEANFUNDAMENTALFREQUENCY Summary of this function goes here
% 
% [OUTPUTARGS] = ESTIMATEMEANFUNDAMENTALFREQUENCY(INPUTARGS) Explain usage here
% 
% Examples: 
% 
% Provide sample usage code here
% 
% See also: List related files here

% Author: Xiaoguang Liang, University of Surrey 
% Date: 2024/10/30 10:52:36 
% Revision: 0.1 

% Use the correlation function 
autocorrSegment = xcorr(segment);

% Find peaks in the autocorrelation within the expected lag range
[~, LOCS] = findpeaks(autocorrSegment);

% Define the expected F0 range, (90-155 Hz) for male and (165-255 Hz) for female
if strcmp(gender,'female')
    minF0 = 165;
    maxF0 = 255;
else
    minF0 = 90;
    maxF0 = 155;
end

% Calculate the lag values corresponding to the F0 range
minLag = round(Fs / maxF0);
maxLag = round(Fs / minF0);

% Filter peaks within the expected lag range
expectedPeaks = LOCS(LOCS >= minLag & LOCS <= maxLag);

% Calculate fundamental frequencies in Hz
fundamentalFrequencies = Fs ./ expectedPeaks;

% Calculate the mean F0
meanFundamentalFrequency = mean(fundamentalFrequencies);

end
