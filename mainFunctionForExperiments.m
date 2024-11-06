function [outputArgs] = mainFunctionForExperiments(segmentLenArray,NthOrdersArray)
% MAINFUNCTIONFOREXPERIMENTS Summary of this function goes here
% 
% [OUTPUTARGS] = MAINFUNCTIONFOREXPERIMENTS(INPUTARGS) Explain usage here
% 
% Examples: 
% 
% Provide sample usage code here
% 
% See also: List related files here

% Author: Xiaoguang Liang, University of Surrey 
% Date: 2024/11/06 09:45:15 
% Revision: 0.1 

% Loop over the segment lengths and orders, and run the mainFunction to plot graphs and generate the synthesis audios
for i=1:length(segmentLenArray)
  segmentLen=segmentLenArray(i);
  for j=1:length(NthOrdersArray)
      NthOrder=NthOrdersArray(j);
      fprintf('>>> Experiment when Segment Length: %f and Order: %s\n',segmentLen,NthOrder);
      mainFunction(fileStruct,segmentLen,NthOrder);
  end
end


end
