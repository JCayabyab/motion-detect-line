clear;

%% Declare data directory

[typeOfVid] = getType();

[video, Fs] = getVideo(typeOfVid);

vid = transformVideo(video);
[displacementX, displacementY] = calculateDisplacements(vid, Fs);

freq = obtainFourierDomain(Fs, displacementY);

writeDataToText(displacementX, displacementY);
plotData(displacementY, freq);
plotData(displacementX, freq);