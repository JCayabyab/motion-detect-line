function outputVid = transformVideo(vid)
%TRANSFORMVIDEO Transforms a RGB video to a single pixel line.
%   Detailed explanation goes here

%% Crop the video to specifications needed

vid = cropVideo(vid);

%% Apply effects to video

% Turns RBG 4-D matrix to 3-D grayscale Intensity matrix
outputVid = grayscaleVideo(vid);

end

