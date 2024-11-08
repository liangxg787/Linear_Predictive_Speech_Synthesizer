function [H, W, formantFrequencies, Y, frequencyVector] = computeFrequencyResponse(lpcCoeffs, segment, Fs)
% COMPUTEFREQUENCYRESPONSE Summary of this function goes here
%
% [OUTPUTARGS] = COMPUTEFREQUENCYRESPONSE(INPUTARGS) This function computes the frequency response of an LPC filter and the FFT of a given segment.
% It also identifies the formant frequencies from the LPC spectrum.
%
% Examples:
% [H, W, formantFrequencies, Y, frequencyVector] = computeFrequencyResponse(lpcCoeffs, segment, 16000);
%
% See also: plotFrequencyResponse

% Author: Xiaoguang Liang, University of Surrey
% Date: 2024/10/31 23:09:35
% Revision: 0.1

%% Compute frequency response for LPC filter
% Using nextpow2 to calculate the number of frequency points
N = 2^nextpow2(length(segment));

% Compute the N-point complex frequency response of the LPC filter
% Got the N-point complex frequency response: H, and the N-point frequency vector: W
[H, W] = freqz(1, lpcCoeffs, N, Fs);
% Converts the magnitude to a decibel (dB) scale
H = 20 * log10(abs(H));

%% Find peaks in the LPC spectrum that correspond to formants
[~, LOCS] = findpeaks(abs(H));
% Get formant frequencies
formantFrequencies = W(LOCS);

%% Compute the FFT of the signal, returns the n-point DFT
Y = fft(segment, N);
% Converts the magnitude to a decibel (dB) scale
Y = 20 * log10(abs(Y));

% Compute frequency Vector for the FFT Result
Ylen = length(Y);
% Make the scales from 0 Hz up to the sampling frequency Fs and provides the frequency for each point in Y.
frequencyVector = (0:Ylen-1) * Fs / Ylen;

end