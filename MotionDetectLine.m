%% README
% Note: Run the setPath.m file first to find the folders needed for the
% data.

clear;

%% Declare data directory
% dataDir = './videos';
% videoName = 'vid2.mp4';

[videoName, dataDir] = getFile();

inFile = fullfile(dataDir, videoName);

%% Read the video from the .mp4 file

vr = VideoReader(videoName);
vid = vr.read();

%% Crop the video to specifications needed
% Note: inputs for cropVideo: cropVideo(inputVideo, width-low, width-high,
% height-low, height-high)

vid = cropVideo(vid, 200, 400, 150, 200, 200, 250);

%Obtain properties of video: height, width, no. of colours, no. of frames
[h, w, nC, nF] = size(vid);

%% Apply effects to video

% Turns RBG 4-D matrix to grayscale Intensity matrix
vid = grayscaleVideo(vid);

% for i = 1:nF 
% imshow(vid(:,:,i));
% end

%% Turn into Video Feed for a row of pixels over time

%Obtain selected column of pixels
vidLine = vid(:, 100, :);
%Get rid of redundant dimension
vidLine = permute(vidLine, [1 3 2]);

reference = createReference(vidLine);
[~, grad] = imgradientxy(reference);
displacement = calculateDisplacements(vidLine, grad);

%Display output
imshow(vidLine, [0 255]);
figure;
plot(displacement);

% [gMag, gDir] = imgradient(vidLine);
% figure;
% imshow(gMag,[]);
% figure;
% imshow(gDir, []);