clear;

%% Declare data directory

[video, Fs] = getVideo();

[vidLine, angle] = transformVideo(video);
displacement = calculateDisplacements(vidLine, angle, Fs);

%Display output
imshow(vidLine, [0 255]);

freq = obtainFourierDomain(Fs, displacement);

plotData(displacement, freq);