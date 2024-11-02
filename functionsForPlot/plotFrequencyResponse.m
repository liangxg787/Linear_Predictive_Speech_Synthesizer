function plotFrequencyResponse(Y,frequencyVector,response,normAngFreq,formantFrequencies,graphName,strSegmentLen,strNthOrder)
% PLOTFREQUENCYRESPONSE Summary of this function goes here
% 
% [OUTPUTARGS] = PLOTFREQUENCYRESPONSE(INPUTARGS) Explain usage here
% 
% Examples: 
% 
% Provide sample usage code here
% 
% See also: List related files here

% Author: Xiaoguang Liang, University of Surrey 
% Date: 2024/11/02 15:23:18 
% Revision: 0.1 

figure('Position',[100 100 800 500],'Visible', 'off');
% Adjust the axes position for margins
% Get current axes
ax = gca;
% Position: [left, bottom, width, height]
ax.Position = [0.1, 0.1, 0.8, 0.8];

% Set the paper position mode
set(gcf, 'PaperPositionMode', 'auto');

% Set the font format of axis
set(gca, 'Fontname', 'Times New Roman', 'Fontsize', 10);

% Plot frequency domain representation
plot(frequencyVector, 20*log10(abs(Y(1:length(frequencyVector)))), "Color","#4DBEEE"); 
hold on;

% Plot the spectral envelope on the same graph
plot(normAngFreq, 20*log10(abs(response)), 'r', 'LineWidth', 1.5); 
titleStr=['Frequency Domain Representation and LPC Spectral Envelope. Segment Length:',strSegmentLen,' Order:',strNthOrder];
title(titleStr,'FontSize', 12);
xlabel('Frequency (Hz)');
ylabel('Amplitude (dB)');

% Mark the formant frequencies on the plot. Use pretty big green circles
% because it wasn't very clear with x on the same plot as the signal
% spectrum 
for i = 1:length(formantFrequencies)
    freqIndex = find(normAngFreq >= formantFrequencies(i), 1);
    plot(formantFrequencies(i), 20*log10(abs(response(freqIndex))), 'go', 'MarkerSize', 8, 'MarkerFaceColor', 'g');
end

legend('Signal Spectrum', 'LPC Spectral Envelope', 'Formant Frequencies');
hold off;

% Save graph
saveGraph(gcf,graphName);

% Close the invisible figure (optional if you don’t need it anymore)
close(figure);


end
