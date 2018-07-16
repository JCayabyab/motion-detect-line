function outputVideo = grayscaleVideo(inputVideo)
%GRAYSCALEVIDEO This function accepts an RGB24 video and converts it to a
%grayscale video

[h, w, ~, numOfFrames] = size(inputVideo);

vid = zeros(h, w, numOfFrames, 'uint8');

for i = 1:numOfFrames
    currentFrame = inputVideo(:,:,:,i);
    currentFrame = rgb2gray(currentFrame);
    vid(:,:,i) = currentFrame;
end

outputVideo = vid;

end

