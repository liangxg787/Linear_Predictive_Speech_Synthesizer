function plotAmplitudeSpectrum(segment,Fs)
% PLOTAMPLITUDESPECTRUM Summary of this function goes here
% 
% [OUTPUTARGS] = PLOTAMPLITUDESPECTRUM(INPUTARGS) Explain usage here
% 
% Examples: 
% 
% Provide sample usage code here
% 
% See also: List related files here

% Author: Xiaoguang Liang, University of Surrey 
% Date: 2024/11/01 22:07:03 
% Revision: 0.1 

% Compute the FFT of the speech segment
N = length(segment);
fftResult = fft(segment);

% Calculate the amplitude spectrum and convert to dB
amplitudeSpectrum = abs(fftResult / N);
amplitudeSpectrum = amplitudeSpectrum(1:N/2+1); % Take the positive frequencies
amplitudeSpectrum(2:end-1) = 2 * amplitudeSpectrum(2:end-1); % Adjust for single-sided spectrum
amplitudeSpectrum_dB = 20 * log10(amplitudeSpectrum); % Convert amplitude to dB

% Frequency axis
frequencies = (0:(N/2)) * (Fs / N);

% Plot the amplitude spectrum in dB
figure('Position',[100 100 500 300]);
% Adjust the axes position for margins
% Get current axes
ax = gca;
% Position: [left, bottom, width, height]
ax.Position = [0.1, 0.1, 0.8, 0.8];

% Set the paper position mode
set(gcf, 'PaperPositionMode', 'auto');

% Set the font format of axis
set(gca, 'Fontname', 'Times New Roman', 'Fontsize', 10);

plot(frequencies, amplitudeSpectrum_dB);
xlabel('Frequency (Hz)');
ylabel('Amplitude (dB)');
title('Amplitude Spectrum of the Speech Segment in (dB)');
grid on;

% Set legend names
legendNames={'amplitude spectrum of the speech segment'};
legendName = legend(legendNames,'Location', 'northeast');
legendName.ItemTokenSize = [30 30];
set(legendName,'Box','off');

% Save graph
graphName="amplitude_spectrum_of_speech_segment";
saveGraph(gcf,graphName);

end
