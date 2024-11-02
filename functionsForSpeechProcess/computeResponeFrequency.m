function [response,normAngFreq,formantFrequencies] = computeResponeFrequency(lpcCoeffs,segment,Fs)
% COMPUTERESPONEFREQUENCY Summary of this function goes here
% 
% [OUTPUTARGS] = COMPUTERESPONEFREQUENCY(INPUTARGS) Explain usage here
% 
% Examples: 
% 
% Provide sample usage code here
% 
% See also: List related files here

% Author: Xiaoguang Liang, University of Surrey 
% Date: 2024/10/31 23:09:35 
% Revision: 0.1 

% Compute frequency response and formant frequencies
%with the freqz() function, I can plot the frequency response of the digital signal
[response, normAngFreq] = freqz(1, lpcCoeffs, 2^nextpow2(length(segment)), Fs);


% Find peaks in the LPC spectrum that correspond to formants
[~,LOCS] = findpeaks(abs(response));

% Get formant frequencies and make sure they are in the range of human speech formants
formantFreqs = normAngFreq(LOCS);
% This should be the estimated formant frequency for human speech
validFormantsIdx = formantFreqs > 90 & formantFreqs < 8000;
formantFrequencies = formantFreqs(validFormantsIdx);
formantFrequencies = sort(formantFrequencies, 'ascend');

end
