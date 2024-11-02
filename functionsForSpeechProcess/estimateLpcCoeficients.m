function lpcCoeffs = estimateLpcCoeficients(segment,NthOrder)
% ESTIMATELPCCOEFICIENTS Summary of this function goes here
% 
% [OUTPUTARGS] = ESTIMATELPCCOEFICIENTS(INPUTARGS) Explain usage here
% 
% Examples: 
% 
% Provide sample usage code here
% 
% See also: List related files here

% Author: Xiaoguang Liang, University of Surrey 
% Date: 2024/10/31 21:57:11 
% Revision: 0.1 

% Using LPC to estimate formant frequencies in both speech 

%The lpc coefficiencts are stored in the first variable in the vector. For
%now I am ignoring the second variable which is the prediction error
[lpcCoeffs, ~] = lpc(segment, NthOrder);

end
