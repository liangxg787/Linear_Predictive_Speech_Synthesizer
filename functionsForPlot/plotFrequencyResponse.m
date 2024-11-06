function plotFrequencyResponse(H,W,formantFrequencies,Y,frequencyVector,strSegmentLen,strNthOrder,gender)
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

% Adjust the axes position for margins
figure('Position',[100 100 800 500],'Visible', 'off');

% Get current axes
ax = gca;
% Position: [left, bottom, width, height]
ax.Position = [0.1, 0.1, 0.8, 0.8];

% Set the paper position mode
set(gcf, 'PaperPositionMode', 'auto');

% Set the font format of axis
set(gca, 'Fontname', 'Times New Roman', 'Fontsize', 10);

% Plot the amplitude spectrum of original segment
% plot(frequencyVector, 20*log10(abs(Y)), "Color","#4DBEEE");
plot(frequencyVector, Y, "Color","#4DBEEE"); 
%this zooms in the plot to find the formants clearly
maxW=max(W); 
xlim([0 maxW+100]);
hold on;

% Plot the spectral envelope on the same graph
plot(W, H, 'r', 'LineWidth', 1.5); 
xlabel('Frequency (Hz)');
ylabel('Amplitude (dB)');

% Get the magnitude of the response at each formant frequency
formantMag=zeros(2,1);
for i = 1:length(formantFrequencies)
    freqIndex = find(W >= formantFrequencies(i), 1);
    formantMag(i) = H(freqIndex);
    hold on;
end

% Plot the formant frequencies points
sz=10;
scatter(formantFrequencies,formantMag,sz,"filled", "o","MarkerFaceColor","b")

% % Mark the formant frequencies on the plot.
% for i = 1:length(formantFrequencies)
%     freqIndex = find(W >= formantFrequencies(i), 1);
%     plot(formantFrequencies(i),H(freqIndex), 'o', 'MarkerSize', 5, 'MarkerFaceColor', 'b');
% end

titleStr=['LPC filter response and segment amplitude spectrum for ',gender,' vowel. ', 'Segment Length:',strSegmentLen,'ms, Order:',strNthOrder];
title(titleStr,'FontSize', 12);

legend('Original Segment Spectrum', 'LPC Frequency response', 'Formant Frequencies');
hold off;

% Save graph
graphName=["LPC_response_and_segment_amplitude_spectrum_",gender,'_segment_length_',strSegmentLen,'ms_Order_',strNthOrder];
saveGraph(gcf,graphName);

% Close the invisible figure (optional if you don’t need it anymore)
close(figure);


end
