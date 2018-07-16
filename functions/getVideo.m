function outputVideo = getVideo()
%GETVIDEO Obtains file directory and outputs an RGB video.
[videoName, dataDir] = getFile();

videoDir = fullfile(dataDir, videoName);
addpath(dataDir);

%% Read the video from the .mp4 file

v = VideoReader(videoDir);
outputVideo = v.read();

rmpath(dataDir);
end

