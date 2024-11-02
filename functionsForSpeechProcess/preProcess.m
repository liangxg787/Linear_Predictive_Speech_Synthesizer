function [y,Fs,segment]=preProcess(filepath,sampleStart,segmentLen)
arguments
    filepath
    sampleStart
    segmentLen
end
% preProcess Summary of this function goes here
%
% [y,Fs,segment] = preProcess(filepath) Explain usage here
%
% Examples:
%
% Provide sample usage code here
%
% See also: List related files here

% Author: Xiaoguang Liang, University of Surrey
% Date: 2024/10/30 11:10:20
% Revision: 0.1

% Read the audio file
[y,Fs]=audioread(filepath);

% Calculate the number of samples for the segment
segmentSpan = round(segmentLen * Fs);

% Extract the 100ms segment from the speech signal
segment = y(sampleStart:sampleStart+segmentSpan-1);

end
