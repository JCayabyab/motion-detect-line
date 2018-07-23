clear;

%% Declare data directory

[video, Fs] = getVideo();

vid = transformVideo(video);
displacement = calculateDisplacements(vid, Fs);

freq = obtainFourierDomain(Fs, displacement);

plotData(displacement, freq);