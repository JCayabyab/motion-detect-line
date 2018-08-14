function type = getType()
%GETTYPE Summary of this function goes here
%   Detailed explanation goes here
answer = questdlg('Video or Series of Images?', 'Type of Video',...
    'Video', 'Images', 'Video');
switch answer
    case 'Video'
        type = 0;
    case 'Images'
        type = 1;
end

end

