function firstThreeFormants=estimateFirstThreeFormant(formantFrequencies)
% ESTIMATEFIRSTTHREEFORMANT Summary of this function goes here
% 
% [OUTPUTARGS] = ESTIMATEFIRSTTHREEFORMANT(INPUTARGS) Explain usage here
% 
% Examples: 
% 
% Provide sample usage code here
% 
% See also: List related files here

% Author: Xiaoguang Liang, University of Surrey 
% Date: 2024/11/01 17:52:37 
% Revision: 0.1 

%% Estimate the first three formant frequencies of the vowel
% Select the first three peaks as the first three formants
firstThreeFormants=zeros(3,1);
for i = 1:min(3, length(formantFrequencies))
    firstThreeFormants(i) = formantFrequencies(i);
    fprintf('Formant %d: %.2f Hz\n', i, formantFrequencies(i));
end

end
