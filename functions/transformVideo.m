function [outputLine, angle] = transformVideo(vid)
%TRANSFORMVIDEO Transforms a RGB video to a single pixel line.
%   Detailed explanation goes here

%% Crop the video to specifications needed

vid = cropVideo(vid);

%% Get angle of rotation

angle = getAngle(vid(:,:,:,1));

%% Apply effects to video

% Turns RBG 4-D matrix to 3-D grayscale Intensity matrix
vid = grayscaleVideo(vid);

%% Turn into Video Feed for a row of pixels over time

%Obtain middle column of pixels
[~, columns, ~] = size(vid);
column = floor(columns/2);
outputLine = vid(:, column, :);
%Get rid of redundant dimension
outputLine = permute(outputLine, [1 3 2]);



end

