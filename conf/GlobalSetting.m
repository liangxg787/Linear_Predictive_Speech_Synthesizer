classdef GlobalSetting
    %GLOBALSETTING Summary of this class goes here
    %   Detailed explanation goes here

    properties(Constant=true)
        % Female vowel phoneme sample, had_f.wav
        femaleFile="data/speech/had_f.wav"
        % Male vowel phoneme sample, had_m.wav
        maleFile="data/speech/had_m.wav"
        % The length of segment: 0.1, 100ms
        segmentLen = 0.1;
        % Order of the LPC filter
        NthOrder = 25
        % Graphs save path
        GRAPH_PATH="data/graphs"
        % Synthesis save path
        SYNTHESIS_PATH="data/synthesis"

    end

    methods
        function obj = GlobalSetting()
            %GLOBALSETTING Construct an instance of this class
            %   Detailed explanation goes here
        end

    end
end

