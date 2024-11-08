function lpcCoeffs = estimateLpcCoeficients(segment, NthOrder)
% ESTIMATELPCCOEFICIENTS Summary of this function goes here
%
% [OUTPUTARGS] = ESTIMATELPCCOEFICIENTS(INPUTARGS) This function estimates the Linear Predictive Coding (LPC) coefficients for a given speech segment.
% It uses the `lpc` function to compute the coefficients and ignores the prediction error.
%
% Examples:
% segment = [0.1, 0.2, 0.3, 0.4, 0.5];
% NthOrder = 4;
% lpcCoeffs = estimateLpcCoeficients(segment, NthOrder);
%
% See also: computeFrequencyResponse, plotFrequencyResponse

% Author: Xiaoguang Liang, University of Surrey
% Date: 2024/10/31 21:57:11
% Revision: 0.1

% Using LPC to estimate formant frequencies in both speech

% The LPC coefficients are stored in the first variable in the vector.
% For now, I am ignoring the second variable which is the prediction error.
[lpcCoeffs, ~] = lpc(segment, NthOrder);

end