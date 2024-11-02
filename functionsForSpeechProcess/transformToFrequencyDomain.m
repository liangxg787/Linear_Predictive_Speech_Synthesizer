function [Y,frequencyVector] = transformToFrequencyDomain(segment,Fs,response)
% TRANSFORMTOFREQUENCYDOMAIN Summary of this function goes here
% 
% [OUTPUTARGS] = TRANSFORMTOFREQUENCYDOMAIN(INPUTARGS) Explain usage here
% 
% Examples: 
% 
% Provide sample usage code here
% 
% See also: List related files here

% Author: Xiaoguang Liang, University of Surrey 
% Date: 2024/11/02 15:37:04 
% Revision: 0.1 

% Compute the FFT of the signal, returns the n-point DFT
Y = fft(segment, length(response));
% Frequency vector
frequencyVector = (0:length(Y)-1) * Fs / length(Y);


end
