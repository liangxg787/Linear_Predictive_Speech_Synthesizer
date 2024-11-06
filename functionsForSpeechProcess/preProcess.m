function [y,Fs,segment]=preProcess(filepath,sampleStart,segmentLen)
% preProcess Preprocesses an audio file to extract a specified duration segment
%
% [y,Fs,segment] = preProcess(filepath, sampleStart, segmentLen) Reads an audio file and extracts a segment of specified duration starting from a given sample point.
%
% Parameters:
%   - filepath: String, path to the audio file
%   - sampleStart: Integer, starting sample point for the segment extraction
%   - segmentLen: Float, duration of the segment to extract (in seconds)
%
% Returns:
%   - y: Array, original audio signal
%   - Fs: Integer, sampling rate of the audio
%   - segment: Array, extracted segment of the specified duration
%
% Examples:
%   [y,Fs,segment] = preProcess('vowel.wav', 10, 0.1);
%   Extracts a 0.1-second segment from 'vowel.wav' starting at the 10th sample point.
%
% See also: audioread

% Author: Xiaoguang Liang, University of Surrey
% Date: 2024/10/30 11:10:20
% Revision: 0.1

% Read the audio file
[y,Fs]=audioread(filepath);

% Calculate the number of samples for the segment
segmentSpan = round(segmentLen * Fs);

% Extract the specified duration segment from the speech signal
segment = y(sampleStart:sampleStart+segmentSpan);

end