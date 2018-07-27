clear;

%% Declare data directory

[typeOfVid] = getType();


[video, Fs] = getVideo(typeOfVid);

vid = transformVideo(video);
displacement = calculateDisplacements(vid, Fs);

freq = obtainFourierDomain(Fs, displacement);

plotData(displacement, freq);