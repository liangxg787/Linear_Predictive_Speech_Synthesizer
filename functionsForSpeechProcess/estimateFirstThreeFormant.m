function firstThreeFormants = estimateFirstThreeFormant(formantFrequencies)
% ESTIMATEFIRSTTHREEFORMANT Summary of this function goes here
%
% [OUTPUTARGS] = ESTIMATEFIRSTTHREEFORMANT(INPUTARGS) This function estimates the first three formant frequencies from the given formant frequencies.
% It selects the first three peaks and prints them.
%
% Examples:
% formantFrequencies = [1000, 2000, 3000, 4000];
% firstThreeFormants = estimateFirstThreeFormant(formantFrequencies);
%
% See also: computeFrequencyResponse, plotFrequencyResponse

% Author: Xiaoguang Liang, University of Surrey
% Date: 2024/11/01 17:52:37
% Revision: 0.1

%% Estimate the first three formant frequencies of the vowel
% Select the first three peaks as the first three formants
firstThreeFormants = zeros(3, 1);
for i = 1:min(3, length(formantFrequencies))
    firstThreeFormants(i) = formantFrequencies(i);
    fprintf('Formant %d: %.2f Hz\n', i, formantFrequencies(i));
end

end