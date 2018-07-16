function outputVideo = edgeDetectVideo(inputVideo, type)
%EDGEDETECTVIDEO This function accepts a grayscale video and applies an
%edge detection algorithm

[h, w, numOfFrames] = size(inputVideo);

vid = zeros(h, w, numOfFrames);

for i = 1:numOfFrames
    currentFrame = inputVideo(:,:,:,i);
    currentFrame = edge(currentFrame, type);
    vid(:,:,i) = currentFrame;
end

outputVideo = vid;

end




