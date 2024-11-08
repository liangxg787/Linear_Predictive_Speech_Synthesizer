function mainFunctionForExperiments(fileStruct, segmentLenArray, NthOrdersArray, ExperimentMode, experimentArgs)
% MAINFUNCTIONFOREXPERIMENTS Summary of this function goes here
%
% [OUTPUTARGS] = MAINFUNCTIONFOREXPERIMENTS(INPUTARGS) This function runs multiple experiments by looping over different segment lengths and LPC orders.
% It calls the `mainFunction` for each combination of segment length and LPC order, and collects the results.
% Finally, it plots all the experimental results.
%
% Examples:
% fileStruct = struct('male', 'male_vowel.wav', 'female', 'female_vowel.wav');
% segmentLenArray = [0.1, 0.2]; % Array of segment lengths in seconds
% NthOrdersArray = [10, 15]; % Array of LPC orders
% ExperimentMode = 0; % 0 for plotting, 1 for saving results
% experimentArgs = [];
% mainFunctionForExperiments(fileStruct, segmentLenArray, NthOrdersArray, ExperimentMode, experimentArgs);
%
% See also: mainFunction, plotExperimentGraph

% Author: Xiaoguang Liang, University of Surrey
% Date: 2024/11/06 09:45:15
% Revision: 0.1

% Loop over the segment lengths and orders, and run the mainFunction to plot graphs and generate the synthesis audios
for i = 1:length(segmentLenArray)
    segmentLen = segmentLenArray(i);
    for j = 1:length(NthOrdersArray)
        NthOrder = NthOrdersArray(j);
        fprintf('>>> Experiment when Segment Length: %f and Order: %d\n', segmentLen, NthOrder);
        experimentArgs = mainFunction(fileStruct, segmentLen, NthOrder, ExperimentMode, experimentArgs);
    end
end

% Plot all the graphs
plotExperimentGraph(experimentArgs);

end