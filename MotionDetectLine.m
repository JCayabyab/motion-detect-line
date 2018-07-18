clear;

%% Declare data directory
% dataDir = './videos';
% videoName = 'vid2.mp4';

[video, Fs] = getVideo();

[vidLine, angle] = transformVideo(video);
displacement = calculateDisplacements(vidLine, angle);

%Display output
imshow(vidLine, [0 255]);
figure('Name', 'Displacement-Time Graph');
plot(displacement);
title('Displacement of Edge vs Time');
xlabel('Time (Frames)')
ylabel('Displacement (Pixels)')

figure('Name', 'Displacement-Frequency Graph');
obtainFourierDomain(Fs, displacement);