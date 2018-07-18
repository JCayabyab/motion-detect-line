function angle = getAngle(vidFrame)
%GETANGLE Summary of this function goes here
%   Detailed explanation goes here

answer = questdlg('Is the line parallel to the frame?', 'Angle check:',...
    'Yes', 'No', 'Yes');
switch answer
    case 'Yes'
        calculateAngle = false;
    case 'No'
        calculateAngle = true;
end

if (calculateAngle)
    figure('Name','Fit line in selected rectangle:');
    [~, dims] = imcrop(vidFrame);
    close;

    width = dims(3);
    height = dims(4);

    angle = atan(height/width);
else
    angle = 0;
end

end

