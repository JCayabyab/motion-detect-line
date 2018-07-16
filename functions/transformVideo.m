function outputLine = transformVideo(vr)
%TRANSFORMVIDEO Transforms a VideoReader object to a single pixel line.
%   Detailed explanation goes here
%% Read the video from the .mp4 file

v = VideoReader(vr);
vid = v.read();

%% Crop the video to specifications needed
% Note: inputs for cropVideo: cropVideo(inputVideo, width-low, width-high,
% height-low, height-high)

vid = cropVideo(vid, 200, 400, 150, 200, 200, 250);

%% Apply effects to video

% Turns RBG 4-D matrix to grayscale Intensity matrix
vid = grayscaleVideo(vid);

%% Turn into Video Feed for a row of pixels over time

%Obtain selected column of pixels
outputLine = vid(:, 100, :);
%Get rid of redundant dimension
outputLine = permute(outputLine, [1 3 2]);



end
