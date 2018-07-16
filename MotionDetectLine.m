clear;

%% Declare data directory
% dataDir = './videos';
% videoName = 'vid2.mp4';

[videoName, dataDir] = getFile();

videoDir = fullfile(dataDir, videoName);
addpath(dataDir);

vidLine = transformVideo(videoName);
displacement = calculateDisplacements(vidLine);

rmpath(dataDir);

%Display output
imshow(vidLine, [0 255]);
figure;
plot(displacement);