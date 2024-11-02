%% Author: Xiaoguang Liang (PG/T - Comp Sci & Elec Eng)
%% University of Surrey, United Kingdom
%% Email address: xl01339@surrey.ac.uk
%% Time: 01/11/2024 19:39

clc;
close all;
clear;

% Create a figure but set it to be invisible
fig = figure('Visible', 'off');

% Plot the data (this will not display the plot)
x = 0:0.1:10;
y = sin(x);
plot(x, y);

% Optionally save the figure to a file if needed
saveas(fig, 'myPlot.png');  % Save as PNG file

% Close the invisible figure (optional if you don’t need it anymore)
close(fig);