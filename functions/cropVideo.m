function outputVideo = cropVideo(inputVideo, wLow, wHigh, hLow, hHigh, frame1, frame2)
%CROPVIDEO This function crops a video

newHeight = hHigh - hLow + 1;
newWidth = wHigh - wLow + 1;
newLength = frame2 - frame1 + 1;

vid = zeros(newHeight, newWidth, 3, newLength, 'uint8');

for i = 1:newLength
    j = i + frame1;
    currentFrame = inputVideo(hLow:hHigh,wLow:wHigh,:,j);
    vid(:,:,:,i) = currentFrame;
end

outputVideo = vid;

end