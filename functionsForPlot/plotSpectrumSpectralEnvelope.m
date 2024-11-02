function plotSpectrumSpectralEnvelope(Y,frequencyVector,response,normAngFreq,formantFrequencies)
% PLOTFREQUENCYRESPONCE Summary of this function goes here
%
% [OUTPUTARGS] = PLOTFREQUENCYRESPONCE(INPUTARGS) Explain usage here
%
% Examples:
%
% Provide sample usage code here
%
% See also: List related files here

% Author: Xiaoguang Liang, University of Surrey
% Date: 2024/11/01 16:05:48
% Revision: 0.1

figure('Position',[100 100 500 500]);
% Adjust the axes position for margins
% Get current axes
ax = gca;
% Position: [left, bottom, width, height]
ax.Position = [0.1, 0.1, 0.8, 0.8];

% Set the paper position mode
set(gcf, 'PaperPositionMode', 'auto');

% Set the font format of axis
set(gca, 'Fontname', 'Times New Roman', 'Fontsize', 10);

subplot(2,1,1);
% Plot the signal's frequency domain representation
plot(frequencyVector, 20*log10(abs(Y)));
title('Frequency domain representation of the signal');
xlabel('Frequency (Hz)');
ylabel('Amplitude (dB)');
%this zooms in the plot to find the formants clearly
xlim([0 max(formantFrequencies) + 1000]);

% Set legend names
legendNames={'frequency domain representation'};
legendName = legend(legendNames,'Location', 'best');
legendName.ItemTokenSize = [30 30];
set(legendName,'Box','off');

% Plot the spectral envelope on the same graph
subplot(2,1,2);
plot(normAngFreq, 20*log10(abs(response)), 'b');
% title('Spectral Envelope of the Signal');
xlabel('Frequency (Hz)');
ylabel('Amplitude (dB)');
hold on;

% Get the magnitude of the response at each formant frequency
responeseY=zeros(2,1);
for i = 1:length(formantFrequencies)
    freqIndex = find(normAngFreq >= formantFrequencies(i), 1);
    responeseY(i) = 20*log10(abs(response(freqIndex)));
    hold on;
end

% Plot the formant frequencies points
sz=10;
scatter(formantFrequencies,responeseY,sz,"filled")


% Set legend names
legendNames={'spectral envelope', 'formant frequencies points'};
legendName = legend(legendNames,'Location', 'best');
legendName.ItemTokenSize = [30 30];
set(legendName,'Box','off')

title('The Spectrum and Spectral Envelope for Vowel sample');
xlabel('Frequency (Hz)');
ylabel('Amplitude (dB)');

% Save graph
graphName="spectrum_spectral_envelope_for_vowel_sample";
saveGraph(gcf,graphName)

end
