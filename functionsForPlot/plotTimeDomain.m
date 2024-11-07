function plotTimeDomain(timeVector,synthesizedSignal,gender)
% PLOTTIMEDOMAIN Summary of this function goes here
% 
% [OUTPUTARGS] = PLOTTIMEDOMAIN(INPUTARGS) Explain usage here
% 
% Examples: 
% 
% Provide sample usage code here
% 
% See also: List related files here

% Author: Xiaoguang Liang, University of Surrey 
% Date: 2024/11/07 07:06:29 
% Revision: 0.1 

% Adjust the axes position for margins
figure('Position',[100 100 800 500]);

% Get current axes
ax = gca;
% Position: [left, bottom, width, height]
ax.Position = [0.1, 0.1, 0.8, 0.8];

% Set the paper position mode
set(gcf, 'PaperPositionMode', 'auto');

% Set the font format of axis
set(gca, 'Fontname', 'Times New Roman', 'Fontsize', 10);

% Plot the time domain spectrum of original segment
plot(timeVector,synthesizedSignal, 'LineWidth', 1.5,"Color","#8C92AC");
% Zooms in the plot to easily observe the spectrums 
% maxW=max(W); 
% xlim([0 maxW+100]);
hold on;

% Plot LPC frequency response on the graph
% plot(W, H, 'r', 'LineWidth', 1.5); 
% xlabel('Time (seconds)');
% ylabel('Amplitude (dB)');


titleStr=['Time domain spectrum for synthesized signal ',gender,' vowel. '];
title(titleStr,'FontSize', 12);

legend('Original Segment Spectrum', 'LPC Frequency Response', 'First Three Formant Frequencies');
hold off;

% Save graph
% graphName=["Time_domain_spectrum_for_synthesized_signal_",gender,'_segment_length_',strSegmentLen,'ms_Order_',strNthOrder];
% saveGraph(gcf,graphName);
% 
% % Close the invisible figure
% close(figure);


end
