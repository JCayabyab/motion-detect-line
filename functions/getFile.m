function [fileName,filePath] = getFile()
%GETFILE Prompts user for file and saves name and path to variables.
%   
fileTypes = ['*.avi; *.mp4; *.mov; *.wmv; *.asf; *.asx; *.m4v; *.mj2; '...
    '*.mpg'];
fileDesc = ['Video files (*.avi; *.mp4; *.mov; *.wmv; *.asf; *.asx; *.m4v; *.mj2; '...
    '*.mpg)'];

[fileName, filePath] = uigetfile({fileTypes, fileDesc});


end

