clear;

%% Declare data directory
% dataDir = './videos';
% videoName = 'vid2.mp4';

video = getVideo();
vidLine = transformVideo(video);
displacement = calculateDisplacements(vidLine);
freq = fft(displacement);

%Display output
imshow(vidLine, [0 255]);
figure;
plot(displacement);
figure;
plot(freq);
