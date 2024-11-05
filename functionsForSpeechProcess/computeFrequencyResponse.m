function [response,W,formantFrequencies,Y,frequencyVector] = computeFrequencyResponse(lpcCoeffs,segment,Fs)
% COMPUTEFREQUENCYRESPONSE Summary of this function goes here
% 
% [OUTPUTARGS] = COMPUTEFREQUENCYRESPONSE(INPUTARGS) Explain usage here
% 
% Examples: 
% 
% Provide sample usage code here
% 
% See also: List related files here

% Author: Xiaoguang Liang, University of Surrey 
% Date: 2024/10/31 23:09:35 
% Revision: 0.1 

%% Compute frequency response and formant frequencies

% Using nextpow2 to calculate the number of frequency points 
N=2^nextpow2(length(segment));

% Compute the N-point complex frequency response of the LPC filter
% Got the N-point complex frequency response: response, and the N-point frequency vector: W
[response, W] = freqz(1, lpcCoeffs, N, Fs);

% Find peaks in the LPC spectrum that correspond to formants
[~,LOCS] = findpeaks(abs(response));
% Get formant frequencies
formantFrequencies = W(LOCS);

% Compute the FFT of the signal, returns the n-point DFT
Y = fft(segment, N);
% Frequency vector
frequencyVector = (0:length(Y)-1) * Fs / length(Y);

end
