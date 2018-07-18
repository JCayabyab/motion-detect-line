function angle = getAngle(vidFrame)
%GETANGLE Summary of this function goes here
%   Detailed explanation goes here

figure('Name','Select Line in Rectangle:');
[~, dims] = imcrop(vidFrame);
close;

width = dims(3);
height = dims(4);

angle = atan(height/width);

end

