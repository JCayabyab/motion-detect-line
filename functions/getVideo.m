function [outputVideo, outputFrameRate] = getVideo(type)
%GETVIDEO Obtains file directory and outputs an RGB video.
[videoName, dataDir] = getFile(type);

videoDir = fullfile(dataDir, videoName);
addpath(dataDir);

%% Read the video from the .mp4 file

if(type == 0)
    v = VideoReader(videoDir);
    outputFrameRate = v.FrameRate;
    outputVideo = v.read();
else
%% Read images in folder
    [h, w, ~] = size(imread(videoDir{1}));
    v = zeros(h, w, 3, numel(videoDir));
    for i = 1:numel(videoDir)
        v(:,:,:,i)=imread(videoDir{i});
    end
    outputVideo = v;
    outputFrameRate = 40.7;
end

rmpath(dataDir);
end

