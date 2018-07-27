function [fileName,filePath] = getFile(type)
%GETFILE Prompts user for file and saves name and path to variables.
%   
videoTypes = ['*.avi; *.mp4; *.mov; *.wmv; *.asf; *.asx; *.m4v; *.mj2; '...
    '*.mpg'];
videoDesc = ['Video files (*.avi; *.mp4; *.mov; *.wmv; *.asf; *.asx; *.m4v; *.mj2; '...
    '*.mpg)'];

imageTypes = '*.tif; *.tiff';
imageDesc = 'Image files (*.tif; *.tiff)';

if (type == 0)
    [fileName, filePath] = uigetfile({videoTypes, videoDesc});
else
    [fileName, filePath] = uigetfile({imageTypes, imageDesc}, 'MultiSelect', 'on');
end

% if(fileName == null)
%     return;
% end

end

