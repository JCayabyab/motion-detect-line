clear;

%% Declare data directory
% dataDir = './videos';
% videoName = 'vid2.mp4';

[video, Fs] = getVideo();

vidLine = transformVideo(video);
displacement = calculateDisplacements(vidLine);

%Display output
imshow(vidLine, [0 255]);
figure;
plot(displacement);
figure;
obtainFourierDomain(Fs, displacement);