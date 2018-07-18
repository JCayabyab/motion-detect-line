function outputVideo = cropVideo(inputVideo)
%CROPVIDEO This function crops a video

[firstFrame, lastFrame] = getFrames(inputVideo);

    
[~, dims] = imcrop(inputVideo(:,:,:,firstFrame));
xmin = floor(dims(1))+1;
ymin = floor(dims(2))+1;
width = floor(dims(3));
height = floor(dims(4));

xmax = xmin + width;
ymax = ymin + height;
newLength = lastFrame - firstFrame;

vid = zeros(height + 1, width + 1, 3, newLength, 'uint8');

for i = 1:newLength
    j = i + firstFrame;
    currentFrame = inputVideo(ymin:ymax,xmin:xmax,:,j);
    vid(:,:,:,i) = currentFrame;
end

outputVideo = vid;

end