function plotExperimentGraph(experimentArgs)
% PLOTEXPERIMENTGRAPH Summary of this function goes here
%
% [OUTPUTARGS] = PLOTEXPERIMENTGRAPH(INPUTARGS) Explain usage here
%
% Examples:
%
% Provide sample usage code here
%
% See also: List related files here

% Author: Xiaoguang Liang, University of Surrey
% Date: 2024/11/06 10:48:30
% Revision: 0.1

% Get the field names and data of the struct
% Get the field names and data of the struct
genderData = {experimentArgs.gender};
segmentLenData = cellfun(@(x) num2str(x), {experimentArgs.segmentLen}, 'UniformOutput',0);
NthOrderData = cellfun(@(y) num2str(y), {experimentArgs.NthOrder}, 'UniformOutput',0);
HData = {experimentArgs.H};
WData = {experimentArgs.W};
formantFrequenciesData = {experimentArgs.formantFrequencies};
YData = {experimentArgs.Y};
frequencyVectorData = {experimentArgs.frequencyVector};

genderUnique = unique(genderData);
segmentLenUnique = unique(segmentLenData);
NthOrderUnique = unique(NthOrderData);
for i=1:length(genderUnique)
    gender=genderUnique{i};

    % Plot the spectrum with fixed segment lenght and  different orders
    for j=1:length(segmentLenUnique)
        segmentLen=segmentLenUnique{j};
        % Find the index of the corresponding data
        idxes = find(strcmp(genderData,gender) & strcmp(segmentLenData,segmentLen));

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

        NthOrders = NthOrderData(idxes);
        NthOrders = cellfun(@(x) num2str(x), NthOrders, 'UniformOutput',0);
        
        colorLen = length(NthOrders);

        colors = jet(colorLen);  % 'jet' colormap with 'numCurves' colors
        

        legendLabels = {}; % Initialize an empty cell array for legend labels
        
        l = 1;
        for k=1:length(idxes)
            idx = idxes(k);
            % Extract the data for the current condition
            H = cell2mat(HData(idx));
            W = cell2mat(WData(idx));
            formantFrequencies = cell2mat(formantFrequenciesData(idx));
            Y = cell2mat(YData(idx));
            frequencyVector = cell2mat(frequencyVectorData(idx));

            if k == 1
              % Plot the amplitude spectrum of original segment
              h(l) = plot(frequencyVector, Y, "Color","#8C92AC");
              legendLabels{l} = 'Original Segment Spectrum'; % Add label to the legend array
              l = l+1;
            end
            %this zooms in the plot to find the formants clearly
            maxW=max(W);
            xlim([0 maxW+100]);
            hold on;
 
            % Plot LPC frequency response on the graph
            h(l) = plot(W, H, 'Color', colors(k, :), 'LineWidth', 1.5);
            legendLabels{l} = strjoin(['LPC Frequency Response, Order:' NthOrders(k)]); % Add label to the legend array
            l = l+1;
            xlabel('Frequency (Hz)');
            ylabel('Amplitude (dB)');

            % Get the magnitude of the response at each formant frequency
            formantMag=zeros(2,1);
            for n = 1:length(formantFrequencies)
                freqIndex = find(W >= formantFrequencies(n), 1);
                formantMag(n) = H(freqIndex);
            end

            % Plot the formant frequencies points
            sz=10;
            h(l) = scatter(formantFrequencies,formantMag,sz,"filled", "o","MarkerFaceColor", 'k');
            legendLabels{l} = 'First Three Formant Frequencies';
            l = l+1;

            hold on;

        end

        strSegmentLen = num2str(str2num(segmentLen)*1000);
        titleStr=['LPC filter response and segment amplitude spectrum for ',gender,' vowel. ', 'Segment Length:',strSegmentLen,'ms, different Orders'];
        title(titleStr,'FontSize', 10);
        
        legend(h, legendLabels);
        hold off;
        
        % Save graph
        graphName=["Experiment_LPC_response_and_segment_amplitude_spectrum_",gender,'_segment_length_',strSegmentLen,'ms_different_Orders'];
        saveGraph(gcf,graphName);

        % Close the invisible figure
        close(figure);

    end

    % Plot the spectrum with fixed order and  different segment lenghts
    for j=1:length(NthOrderUnique)
      NthOrder=NthOrderUnique{j};
      % Find the index of the corresponding data
      idxes = find(strcmp(genderData,gender) & strcmp(NthOrderData,NthOrder));

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

      segmentLens = segmentLenData(idxes);
      segmentLens = cellfun(@(x) num2str(x), segmentLens, 'UniformOutput',0);
      
      colorLen = length(segmentLens);

      colors = jet(colorLen);  % 'jet' colormap with 'numCurves' colors
      

      legendLabels = {}; % Initialize an empty cell array for legend labels
      
      l = 1;
      for k=1:length(idxes)
          idx = idxes(k);
          % Extract the data for the current condition
          H = cell2mat(HData(idx));
          W = cell2mat(WData(idx));
          formantFrequencies = cell2mat(formantFrequenciesData(idx));
          % Y = cell2mat(YData(idx));
          % frequencyVector = cell2mat(frequencyVectorData(idx));

          % if k == 1
          %   % Plot the amplitude spectrum of original segment
          %   h(l) = plot(frequencyVector, Y, "Color","#8C92AC");
          %   legendLabels{l} = 'Original Segment Spectrum'; % Add label to the legend array
          %   l = l+1;
          % end
          % %this zooms in the plot to find the formants clearly
          % maxW=max(W);
          % xlim([0 maxW+100]);
          % hold on;

          % Plot LPC frequency response on the graph
          h(l) = plot(W, H, 'Color', colors(k, :), 'LineWidth', 1.5);
          strSegmentLen = segmentLens{k};
          strSegmentLen = num2str(str2num(strSegmentLen)*1000);
          label_ = {'LPC Frequency Response, Segment length:',strSegmentLen,'ms'};
          legendLabels{l} = strjoin(label_); % Add label to the legend array
          l = l+1;
          xlabel('Frequency (Hz)');
          ylabel('Amplitude (dB)');
          hold on;

          % Get the magnitude of the response at each formant frequency
          formantMag=zeros(2,1);
          for n = 1:length(formantFrequencies)
              freqIndex = find(W >= formantFrequencies(n), 1);
              formantMag(n) = H(freqIndex);
          end

          % Plot the formant frequencies points
          sz=10;
          h(l) = scatter(formantFrequencies,formantMag,sz,"filled", "o","MarkerFaceColor", 'k');
          legendLabels{l} = 'First Three Formant Frequencies';
          l = l+1;

          hold on;

      end

      strNthOrder = NthOrder;
      titleStr=['LPC filter response and segment amplitude spectrum for ',gender,' vowel. ', 'Order:',strNthOrder,', different Segment Length'];
      title(titleStr,'FontSize', 10);
      
      legend(h, legendLabels);
      hold off;
      
      % Save graph
      graphName=["Experiment_LPC_response_and_segment_amplitude_spectrum_",gender,'_Order_',strNthOrder,'ms_different_segment_lengths'];
      saveGraph(gcf,graphName);

      % Close the invisible figure
      close(figure);

  end

end



end

