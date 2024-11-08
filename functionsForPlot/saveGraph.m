function saveGraph(gcf, graphName)
% SAVEGRAPH Summary of this function goes here
%
% [OUTPUTARGS] = SAVEGRAPH(INPUTARGS) This function saves the current figure as a high-resolution PNG file.
% It ensures that the directory exists and creates it if necessary.
%
% Examples:
% saveGraph(gcf, 'example_graph');
%
% See also: plotFrequencyResponse

% Author: Xiaoguang Liang, University of Surrey
% Date: 2024/11/01 22:38:29
% Revision: 0.1

% Save the graph as a high-resolution PNG file
saveDir = [GlobalSetting.GRAPH_PATH];
if ~exist(saveDir, 'dir')
    % Create the new directory
    mkdir(saveDir);
end

savePath = [saveDir, '/', graphName, '.png'];
savePath = strjoin(savePath, '');

% Save the figure as a PNG file with specified margins
print(gcf, savePath, '-dpng', '-r300');  % '-r300' sets 300 DPI for high resolution

end